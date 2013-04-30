<?php
// scheduler_pmonit.php is process monitor scheduler
// it is run from a command line in a schedule cron job.
// $Id$

require_once("setup.php");

///////////////////////////////////////////////////
// set flags //////////////////////////////////////
///////////////////////////////////////////////////

// output all mysql commands to DEBUG which defined in setup.php
$debugF = 1;		// 1 is on; 0 is off

// dry run mode, if dry run flag is on, it skips all mysql queries
$dryRunF = 0;		// 1 is on; 0 is off


// Open debug file to store debug information
if ($debugF)
{
	// debug file
	$debugFile = DEBUG_PM;
	if (file_exists($debugFile))
		unlink($debugFile);
	$dh = fopen($debugFile, 'w') or die ("Can't open $debugFile.");
}

// Create log file and set write privilege to all
$log_file = LOG_PM;		// LOG_PM is defined in setup.php
`/usr/bin/touch $log_file`;
`/bin/chmod 777 $log_file`;

// scheduler_pmonit.php starting message
echo "Scheduler Process Monitor started: " . date('H:i:s d-m-Y') . "\n";

// Connect to Piping Tools database
$db = new DB ($DB_hostname, $DB_username, $DB_password, $DB_databasename);

// Connect to Catalogue of Life database
$CoL_db = new DB ($DB_hostname, $DB_username, $DB_password, $CoL_databasename);

// List of messages to log file for each step
$steps = array(
				"Step 1. Importing GSD annotations:\n",
				"Step 2. Resetting webservice for GBPs.\n",
				"Step 3. Populating webservice with GBP data:\n",
				"Step 4. Updating statistics.\n",
			);

$step_no = 0;		// step counter

///////////////////////////////////////////////////////////////////
// Step 1. Importing GSD annotations //////////////////////////////
///////////////////////////////////////////////////////////////////
// write out each step in the output log via standard output
echo $steps[$step_no++];

// write to debug file
if ($debugF) fwrite($dh, $steps[$step_no-1]); // counter already incremented!

// Get a list of GBPs' user name
$query =	"SELECT username FROM `user`";

$db->query2($query);

// replace characters to clean up GBPs' names
$patterns = array();
$replacements = array();
$patterns[0]		= '/\s/';
$replacements[0]	= '_';
$patterns[1]		= '/-/';
$replacements[1]	= '_';
$patterns[2]		= '/\./';
$replacements[2]	= '_';
$patterns[3]		= '/&_/';
$replacements[3]	= '';
$patterns[4]		= '/\(/';
$replacements[4]	= '';
$patterns[5]		= '/\)/';
$replacements[5]	= '';

// Store all the cleaned up gbps' name as we're going to use it a few times
$gbps = array();
for($i = 0; $i < $db->num_rows(); $i++)
{
	$results = $db->fetch();
	$gbps[] = preg_replace($patterns, $replacements, $results['0']);
}

// Get a list of all GSDs' names from webservice directory
$gsds = array();
foreach (new DirectoryIterator(GSD_WEB) as $dir)
	if (!$dir->isDot() && $dir->isDir())
		if ($dir->getBasename() != 'Unplaced_Names')	// don't need
														// Unplaced_Names here.
			$gsds[] = $dir->getBasename();
// in alphabetical order
sort($gsds);

/* We no longer pull GSDs' annotations onto taxa table
// remove old comments on taxa table
$query = "UPDATE taxa SET `gsd_status` = NULL;";
if ($debugF) fwrite($dh, $query . "\n");
if (!$dryRunF) $db->query2($query);

$query = "UPDATE taxa SET `gsd_comments` = NULL;";
if ($debugF) fwrite($dh, $query . "\n");
if (!$dryRunF) $db->query2($query);

$query = "UPDATE taxa SET `gsd_comments_predefined` = NULL;";
if ($debugF) fwrite($dh, $query . "\n");
if (!$dryRunF) $db->query2($query);
*/

// remove old annotated_taxa table
$query = "DROP TABLE IF EXISTS annotated_taxa;";
if ($debugF) fwrite($dh, $query . "\n");
if (!$dryRunF) $db->query2($query);

// create new annotated_taxa table, here we put GSDs' annotations
$query =
"CREATE TABLE IF NOT EXISTS `annotated_taxa` (
	`ATid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id` int(10) unsigned NOT NULL,
	`taxonID` varchar(12) DEFAULT NULL
		COMMENT 'We do not know what type of identifiers are used by
		providers. Providers may refuse to provide their identifiers.',
	`genus` varchar(255) NOT NULL,
	`specificEpithet` varchar(255) NOT NULL,
	`scientificNameAuthorship` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
	`infraspecificEpithet` varchar(255) DEFAULT NULL,
	`verbatimTaxonRank` varchar(12) DEFAULT NULL,
	`taxonomicStatus` varchar(45) DEFAULT NULL,
	`acceptedNameUsageID` varchar(12) DEFAULT NULL,
	`parentNameUsageID` varchar(12) DEFAULT NULL,
	`family` varchar(255) DEFAULT NULL,
	`order` varchar(255) DEFAULT NULL,
	`class` varchar(255) DEFAULT NULL,
	`phylum` varchar(255) DEFAULT NULL,
	`kingdom` varchar(255) DEFAULT NULL,
	`higherClassification` varchar(500) DEFAULT NULL,
	`namePublishedIn` varchar(500) DEFAULT NULL,
	`taxonRemarks` varchar(500) DEFAULT NULL,
	`source` varchar(255) DEFAULT NULL,
	`updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE
		CURRENT_TIMESTAMP
		COMMENT 'timestamp of the last update',
	`provider_id` tinyint(3) unsigned NOT NULL
		COMMENT 'ID of provider as in providers table',
	`gsd_comments` varchar(500) COMMENT 'feedback from gsds',
	`gsd_comments_predefined` varchar(500) DEFAULT NULL,
	`gsd_short_name` varchar(150) DEFAULT NULL
		COMMENT 'abbreviation of GSD for which the name has been assigned',
	`gsd_status` varchar(45) DEFAULT NULL
		COMMENT 'Accepter or Rejected. Explanation of decision is stored
		in gsd_comments',
	`history_status` integer(10) DEFAULT NULL
		COMMENT 'Indicates how many times species name appeared in providers
		list (even if it was accepted or rejected by GSDs before)',
	`history_comments` varchar(255) DEFAULT NULL
		COMMENT 'Explains history_status - possibly discussion between
		provider, GSD and the COL',
	`tag` varchar(32) NOT NULL,
	`scientificName` varchar(255) DEFAULT NULL,
	`taxonRank` varchar(24) DEFAULT NULL,
	`in_col` tinyint(3) unsigned DEFAULT NULL,
	`matched_by` varchar(8) DEFAULT NULL,
	PRIMARY KEY (`ATid`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;";

if ($debugF) fwrite($dh, $query . "\n");
if (!$dryRunF) $db->query2($query);

// This UPDATE queries need to do one at a time, mysql doesn't seem to accept
// them in one go. 
$templateTxt1 =
'UPDATE GSDSPACEHOLDER SET gsd_comments = NULL WHERE LENGTH(gsd_comments) < 1 OR gsd_comments = "NULL";';

$templateTxt2 =
'UPDATE GSDSPACEHOLDER SET gsd_status = NULL WHERE LENGTH(gsd_status) < 1 OR gsd_status = "NULL";';

$templateTxt3 =
'UPDATE GSDSPACEHOLDER SET gsd_comments_predefined = NULL WHERE LENGTH(gsd_comments_predefined) < 1 OR gsd_comments_predefined = "NULL";';

$templateTxt4 =
'INSERT INTO annotated_taxa (
	`id`,

	`taxonRemarks`,

	`gsd_status`,
	`gsd_comments`,
	`gsd_comments_predefined`,

	`taxonID`,
	`genus`,
	`specificEpithet`,
	`scientificNameAuthorship`,
	`infraspecificEpithet`,
	`verbatimTaxonRank`,
	`taxonomicStatus`,
	`acceptedNameUsageID`,
	`parentNameUsageID`,
	`family`,
	`order`,
	`class`,
	`phylum`,
	`kingdom`,
	`higherClassification`,
	`namePublishedIn`,
	`source`,
	`updated`,
	`provider_id`, 
	`gsd_short_name`,
	`history_status`,
	`history_comments`,
	`tag`,
	`scientificName`,
	`taxonRank`,
	`in_col`,
	`matched_by` 
)
SELECT
	`id`,

	CONCAT_WS("|", `gsd_short_name`, `gsd_status`, `gsd_comments`,
	`gsd_comments_predefined`),

	`gsd_status`,
	`gsd_comments`,
	`gsd_comments_predefined`,

	`taxonID`,
	`genus`,
	`specificEpithet`,
	`scientificNameAuthorship`,
	`infraspecificEpithet`,
	`verbatimTaxonRank`,
	`taxonomicStatus`,
	`acceptedNameUsageID`,
	`parentNameUsageID`,
	`family`,
	`ordo`,
	`class`,
	`phylum`,
	`kingdom`,
	`higherClassification`,
	`namePublishedIn`,
	`source`,
	`updated`,
	`provider`, 
	`gsd_short_name`,
	`history_status`,
	`history_comments`,
	`tag`,
	`scientificName`,
	`taxonRank`,
	`in_col`,
	`matched_by`
FROM GSDSPACEHOLDER
WHERE (
	`GSDSPACEHOLDER`.`gsd_comments` IS NOT NULL OR
	`GSDSPACEHOLDER`.`gsd_status` IS NOT NULL OR
	`GSDSPACEHOLDER`.`gsd_comments_predefined` IS NOT NULL)
;';

/* Old mysql comment which pull GSDs' annotation onto taxa table
'INSERT INTO taxa ( `id`, `gsd_status`,`gsd_comments`, `gsd_comments_predefined`)  SELECT  `id`, `gsd_status`,`gsd_comments`, `gsd_comments_predefined` FROM GSDSPACEHOLDER WHERE (`GSDSPACEHOLDER`.`gsd_comments` IS NOT NULL OR `GSDSPACEHOLDER`.`gsd_status` IS NOT NULL OR `GSDSPACEHOLDER`.`gsd_comments_predefined` IS NOT NULL) ON DUPLICATE KEY UPDATE taxa.`gsd_status` = CONCAT_WS(" ", taxa.`gsd_status`, CONCAT("GSDSPACEHOLDER: " , GSDSPACEHOLDER.`gsd_status`), ";"), taxa.`gsd_comments`= CONCAT_WS(" ", taxa.`gsd_comments`, CONCAT("GSDSPACEHOLDER: ", GSDSPACEHOLDER.`gsd_comments`, ";")), taxa.`gsd_comments_predefined` = CONCAT_WS(" ", taxa.`gsd_comments_predefined`, CONCAT("GSDSPACEHOLDER: ", GSDSPACEHOLDER.`gsd_comments_predefined`, ";"));';
*/

foreach ($gsds as $gsd)
{
	echo "$gsd\n";

	$query =
		preg_replace('/GSDSPACEHOLDER/', $gsd, $templateTxt1);
	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query2($query);

	$query =
		preg_replace('/GSDSPACEHOLDER/', $gsd, $templateTxt2);
	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query2($query);

	$query =
		preg_replace('/GSDSPACEHOLDER/', $gsd, $templateTxt3);
	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query2($query);

	$query =
		preg_replace('/GSDSPACEHOLDER/', $gsd, $templateTxt4);
	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query2($query);

}

///////////////////////////////////////////////////////////////////
// Step 2. Resetting webservice for GBPs //////////////////////////
///////////////////////////////////////////////////////////////////
// write out each step in the output log via standard output
echo $steps[$step_no++];

// write to debug file
if ($debugF) fwrite($dh, $steps[$step_no-1]); // counter already incremented!

// Clean up gbp directories
foreach (new DirectoryIterator(GBP_WEB) as $file)
	if (!$file->isDot() && $file->isDir())
		rm_dir($file->getPathname());

foreach ($gbps as $gbp)
	if ($gbp != 'admin')
	{
		$gbp_dir = GBP_WEB . $gbp;
		`/bin/mkdir $gbp_dir`;
		`/bin/chmod 777 $gbp_dir`;

		$dot_htaccess = GBP_WEB_PROTO . ".htaccess";
		$meta_dot_xml = GBP_WEB_PROTO . "meta.xml";
		`cp -p $dot_htaccess $gbp_dir`;
		`cp -p $meta_dot_xml $gbp_dir`;
	}

///////////////////////////////////////////////////////////////////
// Step 3. Populating webservice with GBP data ////////////////////
///////////////////////////////////////////////////////////////////
// write out each step in the output log via standard output
echo $steps[$step_no++];

// write to debug file
if ($debugF) fwrite($dh, $steps[$step_no-1]); // counter already incremented!

$templateTxt = 
"SELECT
	'taxonID', 'scientificName', 'taxonRank', 'genus', 'specificEpithet',
	'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank',
	'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family',
	'order', 'class', 'phylum', 'kingdom', 'higherClassification',
	'namePublishedIn', 'taxonRemarks',
	'source'
UNION
SELECT
	`taxonID`, `scientificName`, `taxonRank`, `genus`, `specificEpithet`,
	`scientificNameAuthorship`, `infraspecificEpithet`, `verbatimTaxonRank`,
	`taxonomicStatus`, `acceptedNameUsageID`, `parentNameUsageID`, `family`,
	`order`, `class`, `phylum`, `kingdom`, `higherClassification`,
	`namePublishedIn`, `taxonRemarks`,
	`source`
FROM annotated_taxa
WHERE
	(`gsd_comments` IS NOT NULL OR
	 `gsd_status` IS NOT NULL OR
	 `gsd_comments_predefined` IS NOT NULL) AND
	provider_id = GBPIDSPACEHOLDER
INTO OUTFILE 'OUTPUTFILESPACEHOLDER'
	FIELDS TERMINATED BY '\t'
	OPTIONALLY ENCLOSED BY '\"'
	ESCAPED BY ''
	LINES TERMINATED BY '\\n';";

/* Old mysql output comments exporting taxa table data
"SELECT 'taxonID', 'scientificName', 'taxonRank', 'genus', 'specificEpithet', 'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks', 'source'
UNION
SELECT `taxonID`, `scientificName`, `taxonRank`, `genus`, `specificEpithet`, `scientificNameAuthorship`, `infraspecificEpithet`, `verbatimTaxonRank`, `taxonomicStatus`, `acceptedNameUsageID`, `parentNameUsageID`, `family`, `order`, `class`, `phylum`, `kingdom`, `higherClassification`, `namePublishedIn`, CONCAT_WS(' ', 'Status:', `gsd_status`, '. Comments:', `gsd_comments`, '; ' ,
`gsd_comments_predefined`) as `taxonRemarks`, `source` FROM taxa WHERE (`gsd_comments` IS NOT NULL OR `gsd_status` IS NOT NULL OR `gsd_comments_predefined` IS NOT NULL) AND provider_id = GBPIDSPACEHOLDER INTO OUTFILE 'OUTPUTFILESPACEHOLDER' FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '' LINES TERMINATED BY '\\n';";
*/

foreach ($gbps as $gbp)
	if ($gbp != 'admin')
	{
		echo "$gbp\n";

		// get provider (userid) ID from user table
		$query = "SELECT userid FROM user ".
				 "WHERE username='" . $gbp . "'";
		$db->query2($query);
		$results = $db->fetch();
		$dataProviderID = $results['userid'];

		$outputFile =	GBP_WEB . $gbp . "/annotated.txt";
		$xmlFile =		GBP_WEB . $gbp . "/meta.xml";
		$zipFile =		GBP_WEB . $gbp . "/annotated.zip";

		$query =
			preg_replace(
							array(	'/GBPIDSPACEHOLDER/',
									'/OUTPUTFILESPACEHOLDER/'),
							array(	$dataProviderID,
									$outputFile),
							$templateTxt
						);
		if ($debugF) fwrite($dh, $query . "\n");
		if (!$dryRunF) $db->query2($query);

		$zip = new ZipArchive;
		if (	file_exists($outputFile) &&
				($zip->open($zipFile, ZipArchive::CREATE) === TRUE))
		{
				chdir(GBP_WEB . $gbp);
				$zip->addFile('annotated.txt');
				$zip->addFile('meta.xml');
				$zip->close();
				unlink($outputFile);
				unlink($xmlFile);
		}
	}

///////////////////////////////////////////////////////////////////
// Step 4. Updating statistics ////////////////////////////////////
///////////////////////////////////////////////////////////////////
// write out each step in the output log via standard output
echo $steps[$step_no++];

// write to debug file
if ($debugF) fwrite($dh, $steps[$step_no-1]); // counter already incremented!

$rssFile = RSS_WEB . 'update.rss';
// remove the old rss file frist
if (file_exists($rssFile))
	unlink($rssFile);

$templateTxt = 
'SELECT
	"GSDNAMEHOLDER" as GSD,
	u.username as GP,
	count(*) as "Total piped",
	appr.Approved,
	rej.Rejected,
	ann.Annotated
FROM GSDNAMEHOLDER AS gsd LEFT JOIN user u ON gsd.provider=u.userid LEFT JOIN
(SELECT
	provider,
	count(*) as Approved
FROM GSDNAMEHOLDER
WHERE gsd_status = "Approved" GROUP BY provider) AS appr
ON gsd.provider=appr.provider LEFT JOIN
(SELECT
	provider,
	count(*) as Rejected
FROM GSDNAMEHOLDER
WHERE gsd_status = "Rejected" GROUP BY provider) AS rej
ON gsd.provider=rej.provider LEFT JOIN
(SELECT
	provider,
	count(*) as Annotated
FROM GSDNAMEHOLDER
WHERE
	gsd_status IS NOT NULL OR
	gsd_comments_predefined IS NOT NULL OR
	gsd_comments IS NOT NULL
GROUP BY provider) AS ann
ON gsd.provider=ann.provider GROUP BY gsd.provider';

// Need to include Unplaced_Names in statistic data
$gsds[] = 'Unplaced_Names';

// do mysql here
$data = '';			// Initial $data as empty string
foreach ($gsds as $gsd)
{
//	echo "$gsd\n";
//	$gsd = 'ILDIS';

	$query =
		preg_replace(
						array(	'/GSDNAMEHOLDER/',
								'/OUTPUTFILESPACEHOLDER/'),
						array(	$gsd,
								$outputFile),
						$templateTxt
					);

	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query2($query);

	for($i = 0; $i < $db->num_rows(); $i++)
	{
		$results = $db->fetch();

		$gsd		= $results['GSD'];
		$gbp		= $results['GP'];
		$total		= $results['Total piped'];
		//$approved	= $results['appr.Approved'];
		$approved	= $results[3];
		$rejected	= $results[4];
		$annotated	= $results[5];

		$data	.=	"$gsd\t$gbp\t$total\t$approved\t$rejected\t$annotated\n";
	}
}

$header	=	"GSD\tGP\tTotal piped\tApproved\tRejected\tAnnotated\n";

$dataString =	"<pre>\n" .
				// put data info in here
				$header .
				$data .
				"</pre>\n";

// generate rss here
$rss_title	= 'Catalogue of Life - Piping Tools Notifications';
$rss_link	= 'http://www.catalogueoflife.org/piping/webservice';
$rss_desc	= 'Species Names Update Notification service for Global Providers '.
			  'and Global Biodiversity Databases';

$rss = new rss2($rss_title, $rss_link, $rss_desc);
$rss->addItem(	'Overview of recent updates:',
				'',
				$dataString,
				date('D, d M Y H:i:s T'));

$rss->save($rssFile);


// scheduler_pmonit.php ending message
echo "Scheduler Process Monitor ended:" . date('H:i:s d-m-Y'). "\n";

if ($debugF) fclose($dh);	// closing file handle of debug.txt


//////////////////////////////////////////////////////////////
// function definition for this script ///////////////////////
//////////////////////////////////////////////////////////////
function rm_dir($dir)
{
	$iter = new RecursiveDirectoryIterator($dir);
	foreach (new  RecursiveIteratorIterator( $iter,
						RecursiveIteratorIterator::CHILD_FIRST) as $f)
	{
		if ($f->isDir())
			rmdir($f->getPathname());
		else
			unlink($f->getPathname());
	}
	rmdir($dir);
}

class rss2 extends DOMDocument
{
	private $channel;

	public function __construct($title, $link, $description)
	{
		parent::__construct();
		$this->formatOutput = true;

		$root = $this->appendChild($this->createElement('rss'));
		$root->setAttribute('version', '2.0');

		$channel = $root->appendChild($this->createElement('channel'));

		$channel->appendChild($this->createElement('title', $title));
		$channel->appendChild($this->createElement('link', $link));
		$channel->appendChild($this->createElement('description',$description));

		$this->channel = $channel;
	}

	public function addItem($title, $description, $data, $pubDate)
	{
		$item = $this->createElement('item');
		$item->appendChild($this->createElement('title', $title));

		$cdata = $this->createCDATASection($data);

		$item->appendChild(
			$this->createElement('description',
				$description))->appendChild($cdata);

		$item->appendChild($this->createElement('pubDate', $pubDate));

		$this->channel->appendChild($item);
	}
}
?>
