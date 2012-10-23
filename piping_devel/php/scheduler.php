<?php
// scheduler.php starts piping process by
// executes the following scripts in sequence:
//		in_col_infraspecies.sql
//		in_col_species.sql
//		family.sql
//		order.sql
//		class.sql
//		genus.sql
//		phylum.sql
// These scripts are created by pressing the "Load CoL Data" button on
// the "Piping Tools Setting" page of the supply side front end.
//
// scheduler.php can be started using Piping Tools supply side front end
// or run from a command line in a schedule cron job.
// $Id$

require_once("setup.php");

///////////////////////////////////////////////////
// set flags //////////////////////////////////////
///////////////////////////////////////////////////

// output all mysql commands to DEBUG which defined in setup.php
$debugF = 1;		// 1 is on; 0 is off

// dry run mode, if dry run flag is on, it skips all mysql queries
$dryRunF = 0;		// i is on; 0 is off


// Open debug file to store debug information
if ($debugF)
{
	// debug file
	$debugFile = DEBUG;
	if (file_exists($debugFile))
		unlink($debugFile);
	$dh = fopen($debugFile, 'w') or die ("Can't open $debugFile.");
}

//echo "<pre>\n";	// make line break appear on any web browsers

// Create log file and set write privilege to all
// this is needed as cron job and web browser might use the same log file.
$log_file = LOG;	// LOG is defined in setup.php
`/usr/bin/touch $log_file`;
`/bin/chmod 777 $log_file`;

// Scheduler.php starting message
echo "Scheduler started: " . date('H:i:s d-m-Y') . "\n";

// Connect to Piping Tools database
$db = new DB ($DB_hostname, $DB_username, $DB_password, $DB_databasename);

// Connect to Catalogue of Life database
$CoL_db = new DB ($DB_hostname, $DB_username, $DB_password, $CoL_databasename);

// order of the first 7 scripts to execute
$scripts = array(
					"in_col_infraspecies.sql",
					"in_col_species.sql",
					"family.sql",
					"order.sql",
					"class.sql",
					"genus.sql",
					"phylum.sql"
				);

// list of messages to log file for each step
$steps = array(
					"Step 1. Marking infraspecies present in the Catalogue of Life:\n",
					"Step 2. Marking species present in the Catalogue of Life:\n",
					"Step 3. Matching GSD by family:\n",
					"Step 4. Matching GSD by order:\n",
					"Step 5. Matching GSD by class:\n",
					"Step 6. Matching GSD by genus:\n",
					"Step 7. Matching GSD by phylum:\n",
					"Step 8. Resetting GSDs' accounts in the pipeline database.\n",
					"Step 9. Resetting websrvice for GSDs.\n",
					"Step 10. Piping species names into the pipeline database:\n",
					"Step 11. Populating webservice with GSDs' data:\n"
				);


$step_no = 0;		// step counter

// Run each script one at a time
foreach ($scripts as $script)
{
	// write out each step in the output log via standard output
	echo $steps[$step_no++];

	$filePath = MYSQLSCRIPTS . $script;

	// wrtie to debug file
	if ($debugF)
	{
		fwrite($dh, $steps[$step_no-1]);	// counter already incremented!
		fwrite($dh, "Running $script.\n");
	}

	// find out how many lines need to run for this script
	$no_of_lines = array_shift(explode(' ', `/usr/bin/wc -l $filePath`));

	// calculate landmarks of progress
	$progress = array();
	$progress[0] = $no_of_lines * 0.01;	// first element store 1% step

	// 10% progress step
	for ($i = 1; $i < 10; $i++)
	{
		$progress[] = $no_of_lines * 0.1 * $i;
	}

	// open the script file
	$fh = fopen($filePath, 'r') or die ("Can't open $filePath.");

	$c_line = 0;		// $c_line counting the current line number
	$i = 1;				// 10% step progress counter
	$j = $progress[0];	// 1% step progress register

	echo "0%";
	while (! feof($fh))
	{
		$query = trim(fgets($fh));
		if (!empty($query))
		{
			if ($debugF) fwrite($dh, $query . "\n");
			if (!$dryRunF) $db->query($query);
		}

		// check progress and report back
		// 10% progress
		if (($c_line++ > $progress[$i]) && $i < 10)
		{
			echo "$i" . "0%";
			$i++;
		}

		// 1% pregress
		elseif ($c_line > $j)
		{
			echo ".";
			$j += $progress[0];				// increases $j by another 1%
		}
	}
	echo "$100%\n";
	fclose($fh);	// closing file handle of current script file
}

///////////////////////////////////////////////////////////
// Step 8 Resetting GSD accounts in the pipline database //
///////////////////////////////////////////////////////////
// write out each step in the output log via standard output
echo $steps[$step_no++];

// wrtie to debug file
if ($debugF) fwrite($dh, $steps[$step_no-1]); // counter already incremented!

// Get a list of GSDs' databases name
$query =	"SELECT db.database_name FROM `databases` db ".
			"GROUP BY db.database_name";

$CoL_db->query($query);

// replace characters to clean up GSDs' databases names
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

// Store all the cleaned up dataname as we're going to use it a few times
$database_names = array();
for($i = 0; $i < $CoL_db->num_rows(); $i++)
{
	$results = $CoL_db->fetch();
	$database_names[] = preg_replace($patterns, $replacements, $results['0']);
}
// add protoGSD as the last element of $database_names array
$database_names[] = "protoGSD";

// Clean up the database first by deleting existing GSDs' tables
$templateTxt = "DROP TABLE IF EXISTS DATABASENAMESPACEHOLDER;";
foreach ($database_names as $database_name)
{
	$query =
		preg_replace('/DATABASENAMESPACEHOLDER/', $database_name, $templateTxt);

	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query($query);
}

// Creating GSDs' tables
$templateTxt = 
"CREATE TABLE IF NOT EXISTS `DATABASENAMESPACEHOLDER` (
`id` int(10) unsigned NOT NULL,
`taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,
`genus` varchar(255) COLLATE utf8_general_ci, 
`specificEpithet` varchar(255) COLLATE utf8_general_ci,
`scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,
`taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,
`acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,
`parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,
`family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, 
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,
`namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,
`taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,
`source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`updated` timestamp,
`provider` varchar(24),
`gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,
`gsd_comments_predefined` enum('comment1','comment2','comment3') COLLATE utf8_general_ci DEFAULT NULL,
`gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`gsd_status` enum('Approved','Rejected') DEFAULT NULL,
`history_status` int(10) DEFAULT NULL,
`history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`tag` varchar(32) COLLATE utf8_bin,
`scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL,
`in_col` int(1) DEFAULT NULL, 
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,
PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;\n";
 
// find out how many lines need to run for this script
//$no_of_lines = count($database_names);

foreach ($database_names as $database_name)
{
	$query =
		preg_replace('/DATABASENAMESPACEHOLDER/', $database_name, $templateTxt);

	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query($query);
}

///////////////////////////////////////////////////////////
// Step 9. Resetting websrvice for GSDs ///////////////////
///////////////////////////////////////////////////////////
// write out each step in the output log via standard output
echo $steps[$step_no++];

// wrtie to debug file
if ($debugF) fwrite($dh, $steps[$step_no-1]);	// counter already incremented!

// Clean up gsd directory
foreach (new DirectoryIterator(GSD_WEB) as $file)
	if (!$file->isDot())
		rm_dir($file->getPathname());

foreach ($database_names as $database_name)
{
	$gsd_dir = GSD_WEB . $database_name;
	`/bin/mkdir $gsd_dir`;
	`/bin/chmod 777 $gsd_dir`;

//	$piping_txt = GSD_WEB_PROTO . "piping.txt";
//	`cp -p $piping_txt $gsd_dir`;

	$dot_htaccess = GSD_WEB_PROTO . ".htaccess";
	`cp -p $dot_htaccess $gsd_dir`;
}

//////////////////////////////////////////////////////////////
// Step 10. Piping species names into the pipeline database: /
//////////////////////////////////////////////////////////////
// write out each step in the output log via standard output
echo $steps[$step_no++];

// wrtie to debug file
if ($debugF) fwrite($dh, $steps[$step_no-1]);	// counter already incremented!

$templateTxt =
'INSERT INTO DATABASENAMESPACEHOLDER
SELECT `id`, `taxonID`, `genus`, `specificEpithet`, `scientificNameAuthorship`, `infraspecificEpithet`, `verbatimTaxonRank`,
`taxonomicStatus`, `acceptedNameUsageID`, `parentNameUsageID`, `family`, `order`, `class`, `phylum`, `kingdom`,
`higherClassification`, `namePublishedIn`, `taxonRemarks`, `source`, `updated`, `provider_id`, `gsd_comments`,
`gsd_comments_predefined`, `gsd_short_name`, `gsd_status`, `history_status`, `history_comments`, `tag`,
`scientificName`, `taxonRank`, `in_col`, `matched_by` 
FROM taxa pt WHERE gsd_short_name LIKE "%DATABASENAMESPACEHOLDER%";';

foreach ($database_names as $database_name)
{
	echo "$database_name\n";

	$query =
		preg_replace('/DATABASENAMESPACEHOLDER/', $database_name, $templateTxt);

	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query($query);
}

//////////////////////////////////////////////////////////////
// Step 11. Populating webservice with GSDs' data: ///////////
//////////////////////////////////////////////////////////////
// write out each step in the output log via standard output
echo $steps[$step_no++];

// wrtie to debug file
if ($debugF) fwrite($dh, $steps[$step_no-1]);	// counter already incremented!

$templateTxt = 
"SELECT 'id', 'taxonID', 'genus', 'specificEpithet', 'scientificNameAuthorship',
'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID',
'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks',
'source', 'updated', 'provider', 'gsd_comments', 'gsd_comments_predefined', 'gsd_short_name', 'gsd_status',
'history_status', 'history_comments', 'tag', 'scientificName', 'taxonRank', 'in_col', 'matched_by'
UNION SELECT * FROM DATABASENAMESPACEHOLDER
INTO OUTFILE 'OUTPUTFILESPACEHOLDER' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '' LINES TERMINATED BY '\\n';";

foreach ($database_names as $database_name)
{
	echo "$database_name\n";

	$outputFile = GSD_WEB . $database_name . "/piping.txt";

	$query =
		preg_replace(
				array(	'/DATABASENAMESPACEHOLDER/',
					'/OUTPUTFILESPACEHOLDER/'),
				array(	$database_name,
					$outputFile),
				$templateTxt
			);
	//$query = "SELECT * FROM 3i_Cicadellinae";

	if ($debugF) fwrite($dh, $query . "\n");
	if (!$dryRunF) $db->query($query);
}

// Scheduler.php ending message
echo "Scheduler ended:" . date('H:i:s d-m-Y'). "\n";

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
?>
