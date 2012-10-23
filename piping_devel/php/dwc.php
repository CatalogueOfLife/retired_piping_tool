<?php
// dwc.php: DwC Uploading page of Piping Tools
// $Id$

// load setup.php file
require_once("setup.php");

// load DwC input function
require_once("dwcLib.php");

// initialise smarty object for display html template
$smarty = new Smarty_PipingTools();

// Check if the user is logged in
// (this also starts the session)
logincheck();

// Connect to the MySQL DBMS 
// credentials are in the file db.php
// Notes: $db is an object of class DB, and it is NOT directly link to
// mysqli connection.
$db = new DB ($DB_hostname, $DB_username, $DB_password, $DB_databasename);

// Create a Taxa object with no_of_taxa set to 1 to make it run a bit efficient
$taxa = new Taxa(
					$db,
					$_SESSION['username'],
					$_SESSION['role'],
					'',			// where
					'',			// order_by
					1,			// no_of_taxa
					''			// offset
				);


// when 'Reset Piping Tools' button is pressed and username is 'admin'
if (isset($_POST['cbol']) && $_SESSION['username'] == 'admin')
{
	// get data provider setting, e.g. url, field order, delimited char ...
	$gbp_info = new UserInfo($db, 'CBOL');

	// download and unzip DwC
	$message = getDwC($gbp_info);

	// load the blimming things in 'CBOL' table
	// $tag is undefine at the moment
	if (!$message)	// no error in the download process using 'wget'
		inputDwCtoBuffer2($db, $taxa, $gbp_info, '');

	$smarty->assign('status', 'display');
}
elseif (isset($_POST['ena']) && $_SESSION['username'] == 'admin')
{
	// get data provider setting, e.g. url, field order, delimited char ...
	$gbp_info = new UserInfo($db, 'ENA');

	// download and unzip DwC
	$message = getDwC($gbp_info);

	// load the blimming things in 'ENA' table
	// $tag is undefine at the moment
	if (!$message)	// no error in the download process using 'wget'
		inputDwCtoBuffer2($db, $taxa, $gbp_info, '');

	$smarty->assign('status', 'display');
}
elseif (isset($_POST['gbif']) && $_SESSION['username'] == 'admin')
{
	// get data provider setting, e.g. url, field order, delimited char ...
	$gbp_info = new UserInfo($db, 'GBIF');

	// download and unzip DwC
	$message = getDwC($gbp_info);

	// load the blimming things in 'CBOL' table
	// $tag is undefine at the moment
	if (!$message)	// no error in the download process using 'wget'
		inputDwCtoBuffer2($db, $taxa, $gbp_info, '');

	$smarty->assign('status', 'display');
}
elseif (isset($_POST['iucn']) && $_SESSION['username'] == 'admin')
{
	// get data provider setting, e.g. url, field order, delimited char ...
	$gbp_info = new UserInfo($db, 'IUCN');

	// download and unzip DwC
	$message = getDwC($gbp_info);

	// load the blimming things in 'CBOL' table
	// $tag is undefine at the moment
	if (!$message)	// no error in the download process using 'wget'
		inputDwCtoBuffer2($db, $taxa, $gbp_info, '');

	$smarty->assign('status', 'display');
}
elseif (isset($_POST['eol']) && $_SESSION['username'] == 'admin')
{
	// get data provider setting, e.g. url, field order, delimited char ...
	$gbp_info = new UserInfo($db, 'EoL');

	// download and unzip DwC
	$message = getDwC($gbp_info);

// Data transfer from EoL Buffer to taxa table is not working yet!!!!!!!
	// load the blimming things in 'CBOL' table
	// $tag is undefine at the moment
	if (!$message)	// no error in the download process using 'wget'
		inputDwCtoBuffer($db, $taxa, $gbp_info, '');

	$smarty->assign('status', 'display');
}
else
	// when 'Cancel' button is press, it goes here as well.
	$smarty->assign('status', 'display');

// Pre-process the message data for security
if(isset($_GET['message']))
	$message  = $db->clean($_GET["message"], 128);

if (isset($message))
	$smarty->assign('message', $message);

$smarty->assign('username', $_SESSION['username']);

// initialise menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

$smarty->assign('page_title', 'Piping Tools DwC Uploading Page');
$smarty->assign('template', 'dwc.tpl');

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");

/////////////////////////////////////////
// Function definition in here //////////
/////////////////////////////////////////

// inputDwCtoBuffer(), read in taxa data file from unzipped DwC and
// put into user's buffer, then clean it up before move the data into
// taxa table
function inputDwCtoBuffer(
							DB			$db,		// db base handle
							Taxa		$taxa,		// taxa table object
							UserInfo	$gbp_info,	// info of data provider
										$tag		// tag name
)
{
	$gbp		= $gbp_info->username;
	$taxa_file	= $gbp_info->taxa_file;

	// full path to the input data file
	// data file name might be runtime depend and this line might need
	// to change
	$full_path = USER_BASE_DIR . $gbp . "/" . $taxa_file;

	// get starting id in taxa table
	$s_id = $taxa->next_id($db);

	// if $tag is empty, generate a default tag
	if (empty($tag))
		// use date and starting ID as $tag
		$tag = date('Y_m_d') . "SID" . $s_id;

	// generate mysql query field input
	$query_field = '';
	foreach ($gbp_info->inputField as $field)
		$query_field .= "`" . $field . "`,";
	// remove the last ','
	$query_field = preg_replace("/,$/", "", $query_field);

	// set up some hard-coded option and will change to runtime dependent in
	// later days

	// set up other uploading options

	//$delimit_char = "\t";
	switch ($gbp_info->delimitor)
	{
		case "comma"		: $delimit_char = ",";
			break;
		case "semicolon"	: $delimit_char = ";";
			break;
		case "tab"			: $delimit_char = "\t";
			break;
		case "space"		: $delimit_char = " ";
			break;
	}

	//$enclose_char = "";
	switch ($gbp_info->enclose_by)
	{
		case "d_quote"		: $enclose_char = '"';
			break;
		case "s_quote"		: $enclose_char = "\'";
			break;
		case "none"			: $enclose_char = "";
			break;
	}

	// clear user buffer table first
	// if don't clear it first, all the previous record would import
	// into taxa table.
	$query = "TRUNCATE TABLE $gbp";
	$db->query($query);

	// mysql query command to uploading input buffer
	$query = "LOAD DATA LOCAL INFILE '$full_path' ".
			 "INTO TABLE $gbp FIELDS ".
			 "TERMINATED BY '$delimit_char' ".
			 "OPTIONALLY ENCLOSED BY '$enclose_char' ";

	// if ignore first row option is selected
	if ($gbp_info->no_first_row)
		$query .= "IGNORE 1 LINES ";

	$query .= "($query_field) ";
	$query .= "SET provider_id = '$gbp_info->userid',";
	$query .= "tag = '$tag'";

	$db->query($query);

	//////////////////////////////////////////////////////
	// Transformation section, from buffer to taxa table /
	//////////////////////////////////////////////////////

//	$query = $gbp_info->mysql_script;
//	$db->query($query);

	// The above two lines have been changed so now it can
	// have multiple queries. Note queries are separated
	// by ';'.
	$queries = explode(';', $gbp_info->mysql_script);
	foreach ($queries as $query)
	{
//echo $query;
		$db->query($query);
	}
}

// getDwC(), download and unzip DwC archive
function getDwC(UserInfo $gbp_info)
{
	$down_load_url = $gbp_info->down_load_url;

	//////////////////////////////////////////////////////////////////////
	// the following codes define $file_full_path which give the full
	// path on local server after the file has uploaded. These codes
	// also extract info from the file name e.g. extention of the filename
	//////////////////////////////////////////////////////////////////////
	if (preg_match('/\.zip$/', $down_load_url))
	{
		$zip_file_name = basename($down_load_url);
		$file_ext = ".zip";
		$rx_pattern = "/\.zip$/";  // use in regular expression search
		$gz_file_name = "";
		$file_name = "";
		$tar_gz_file_name = "";
	}
	// tar_gz file is used in EoL data
	elseif (preg_match('/\.tar\.gz$/', $down_load_url))
	{
		$tar_gz_file_name = basename($down_load_url);
		$file_ext = ".tar.gz";
		$rx_pattern = "/\.tar\.gz$/";  // use in regular expression search
		$gz_file_name = "";
		$zip_file_name = "";
		$file_name = "";
	}
	elseif (preg_match('/\.gz$/', $down_load_url))
	{
		$gz_file_name = basename($down_load_url);
		$file_ext = ".gz";
		$rx_pattern = "/\.gz$/";  // use in regular expression search
		$zip_file_name = "";
		$file_name = "";
		$tar_gz_file_name = "";
	}
	else
	{
		// IUCN stuff would be defined in here as the download
		// URL is a wrapper, it doesn't include the zip file name
		if ($gbp_info->username == 'IUCN')
		{
			$zip_file_name = "IUCN.zip";	// define the name here 
			$file_ext = ".zip";
			$rx_pattern = "/\.zip$/";  // use in regular expression search
			$file_name = "";
			$gz_file_name = "";
			$tar_gz_file_name = "";
		}
		// CBOL stuff would be defined in here as it likes IUCN,
		// it's URL doesn't contain zip filename
		elseif ($gbp_info->username == 'CBOL')
		{
			$zip_file_name = "CBOL.zip";	// define the name here 
			$file_ext = ".zip";
			$rx_pattern = "/\.zip$/";  // use in regular expression search
			$file_name = "";
			$gz_file_name = "";
			$tar_gz_file_name = "";
		}
		else
		{
			$file_name = basename($down_load_url);
			$file_ext = "";
			$rx_pattern = "/$/";  // use in regular expression search
			$zip_file_name = "";
			$gz_file_name = "";
			$tar_gz_file_name = "";
		}
	}

	// me being lazy, only one of them $zip_file_name, $gz_file_name 
	// $tar_gz_file_name and $file_name are not empty, no point to repeat
	// this line 3 times using if .... elseif ... else statements.
	$file_full_path	= USER_BASE_DIR . $gbp_info->username . "/" .
						$zip_file_name . $gz_file_name .
						$tar_gz_file_name . $file_name;

	$home_dir		= USER_BASE_DIR . $gbp_info->username . "/.";
	$home_dir_part	= USER_BASE_DIR . $gbp_info->username . "/";


	///////////////////////////////////////////////////////
	// clean up the directory before uploading the file
	///////////////////////////////////////////////////////

	// probably need to move the old zip file first before 'wget' the new one
	// clean up the directory first ....
	// don't need to clean up with .gz file as .gz no longer exist after
	// decompassion.
	if (file_exists($file_full_path))
	{
		if (($file_ext != '.tar.gz') && ($file_ext != '.gz'))
		{
			// rename old compressed file with date of the file appanded
			// to the filename
			$date_stamp = strftime('%Y%m%d', filemtime($file_full_path));
			$new_filename =
				preg_replace($rx_pattern, "_$date_stamp"."$file_ext",
								$file_full_path);
			rename($file_full_path, $new_filename);
		}
		else
		// remove any .gz file
		unlink($file_full_path);
	}

	// if uncompressed data file exist
	$data_file = $home_dir_part . $gbp_info->taxa_file;
	if (file_exists($data_file))
	{
		if (($gbp_info->username == 'GBIF') || ($gbp_info->username == 'EoL'))
		{
			// for GBIF, rename the file
			$date_stamp =
				strftime('%Y%m%d', filemtime($data_file));
			rename($data_file,
					$data_file . "_$date_stamp");
		}
		else
			// for all other data providers, just delete the file
			unlink($data_file);
	}
	elseif (file_exists($data_file . ".tar"))
	// EoL use tar file need to remove first or gzip won't decompress
	{
		unlink($data_file . ".tar");
	}

	if (file_exists($home_dir_part . "eml.xml"))
		unlink($home_dir_part . "eml.xml");

	if (file_exists($home_dir_part . "meta.xml"))
		unlink($home_dir_part . "meta.xml");

	// use 'wget' to get the blimming thing, then unzip it and put in
	// user home directory
//	$error = system("/usr/bin/wget -P $home_dir $down_load_url");

	if ($gbp_info->username == 'IUCN')
		// need to use $file_full_path as IUCN doesn't have zip filename in
		// their download URL
		`/usr/bin/wget -O $file_full_path $down_load_url`;
	elseif ($gbp_info->username == 'CBOL')
		// need to use $file_full_path as CBOL URL doesn't have zip filename
		// and it also need username and passoword
		`/usr/bin/wget -O $file_full_path $down_load_url --http-user=i4life --http-password=project2012`;
	else
		// ENA, GBIF and EoL come here
		`/usr/bin/wget -P $home_dir $down_load_url`;

	/////////////////////////////////////////////////
	// decompress the zip or gz file ////////////////
	/////////////////////////////////////////////////
	if (file_exists($file_full_path))
	{
		switch ($file_ext)
		{
			case ".zip":
				// redirect standard error to standard output
				$extract_error =
					`/usr/bin/unzip $file_full_path -d $home_dir 2>&1`;
				break;
			case ".gz":
				// redirect standard error to standard output
				$extract_error =
					`/bin/gzip -d $file_full_path 2>&1`;
				break;
			case ".tar.gz":
				// EoL file goes here
				// redirect standard error to standard output
				$extract_error =
					`/bin/tar -xzf $file_full_path -C $home_dir 2>&1`;
				break;
			default: // do nothing
				break;
		}

		if ($extract_error)
			return "";
		else
			return $extract_error;
	}
	else
		// $file_full_path doesn't exist
		return "Cannot download $down_load_url";
}

/*

//////////////////////////////////////////////////////////////////////////
// Have move inputDwCtoBuffer2() function to ./include/dwcLib.php as /////
// this function will be use in BOLD and Xmap input as well          /////
//////////////////////////////////////////////////////////////////////////

// inputDwCtoBuffer2(), read in taxa data file from unzipped DwC and
// put into a temporary buffer, then clean it up before move the data into
// taxa table. The DwC data structure is either define by meta.xml file or
// the header of the data file.
function inputDwCtoBuffer2(
							DB			$db,		// db base handle
							Taxa		$taxa,		// taxa table object
							UserInfo	$gbp_info,	// info of data provider
										$tag		// tag name
)
{
	$gbp		= $gbp_info->username;
	$taxa_file	= $gbp_info->taxa_file;
	$meta_file	= USER_BASE_DIR . $gbp . "/meta.xml";

	// full path to the input data file
	// data file name might be runtime depend and this line might need
	// to change
	$full_path = USER_BASE_DIR . $gbp . "/" . $taxa_file;

	// get starting id in taxa table
	$s_id = $taxa->next_id($db);

	// if $tag is empty, generate a default tag
	if (empty($tag))
		// use date and starting ID as $tag
		$tag = date('Y_m_d') . "SID" . $s_id;

	////////////////////////////////////////////////////////////////
	// Get info about data structure, from meta.xml or data header /
	////////////////////////////////////////////////////////////////

	// Check meta file exist
	if (file_exists($meta_file))
	{
		// Open meta.xml file which define the data file format
		$metaFileObject = simplexml_load_file($meta_file);
		$core = $metaFileObject->core;
		$delimit_char = $core[fieldsTerminatedBy];
		$enclose_char = $core[fieldsEnclosedBy];
		$no_first_row = $core[ignoreHeaderLines];

		// read in all the field names
		foreach ($core->field as $field)
		{
			$fieldNames[] = basename($field[term]);
		}

		// check does it have taxonID field, if no taxonID put this
		// field at the front.
		// This line is needed as there is different between ENA
		// and GBIF/IUCN meta.xml files
		if (!in_array('taxonID', $fieldNames))
			$fieldNames = array_merge(array('taxonID'), $fieldNames);
	}
	else
	{
		// process header of data file here
	}

	// remove the buffer table if one already exist
	$query = 'DROP TABLE IF EXISTS buffer';
	$db->query($query);



	// Create temporary buffer in mysql
	$query_field = '';
	$query =	'CREATE TABLE buffer ('.
				'id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, '.
				'provider_id TINYINT(3) UNSIGNED NOT NULL, '.
				'tag VARCHAR(32) NOT NULL, ';

	foreach ($fieldNames as $field)
		$query_field .= "`" . $field . "` " .
						"VARCHAR(512) DEFAULT NULL, ";
	$query .= $query_field;
	$query .= 'PRIMARY KEY (id))';
	$db->query($query);


	// read raw data into buffer table
	$query_field = '';
	foreach ($fieldNames as $field)
		$query_field .= "`" . $field . "`,";
	// remove the last ','
	$query_field = preg_replace("/,$/", "", $query_field);

	$query = "LOAD DATA LOCAL INFILE '$full_path' ".
			 "INTO TABLE buffer FIELDS ".
			 "TERMINATED BY '$delimit_char' ".
			 "OPTIONALLY ENCLOSED BY '$enclose_char' ";

	// if ignore first row option is selected
	if ($no_first_row)
		$query .= "IGNORE 1 LINES ";

	$query .= "($query_field) ";
	$query .= "SET provider_id = '$gbp_info->userid',";
	$query .= "tag = '$tag'";

	$db->query($query);

	//////////////////////////////////////////////
	// move data from buffer table to taxa table /
	//////////////////////////////////////////////

	// create list of taxa fields and buffer fields for mysql query
	$taxa_field = '';
	$buffer_field = '';
	foreach ($taxa->fields() as $tFieldName => $tFieldValue)
	{
		$taxa_field .= "`" . $tFieldName . "`,";

		// $fieldName contain fields provided by data provider
		// we check to see if taxa table fields are provided by data provider
		// if any field is not provided, just fill it with NULL
		if (in_array($tFieldName, $fieldNames))
			switch ($tFieldValue)
			{
				case 0:
					// no need to change any character case
					$buffer_field .= "`" . $tFieldName . "`,";
					break;
				case 1:
					// change the first letter to uppper case
					$buffer_field .= "CONCAT(UCASE(LEFT(`$tFieldName`,1)),".
									 "LOWER(SUBSTRING(`$tFieldName`,2))), ";
					break;
				case -1:
					// change all letters to lower case
					$buffer_field .= "LOWER(`$tFieldName`), ";
					break;
			}
		else
			$buffer_field .= 'NULL,';
	}

	// this fields are not providered by data provider as they are generated
	// by Piping Tools so it need to add by hardwiring.
	// we set the history_status to initial value of '1'
	$taxa_field .= "`provider_id`,`tag`,`history_status`";
	$buffer_field .= "`provider_id`,`tag`,1";

	// create query to transfer data from buffer to taxa table
	$query  = "INSERT INTO taxa (" . $taxa_field . ") ";
	$query .= "SELECT " . $buffer_field . " FROM buffer ";
	$query .= $gbp_info->mysql_where;	// put in the condition clause
	$query .= "ON DUPLICATE KEY UPDATE " .
			  "`history_status`=`history_status`+1,".
			  "`history_comments`=`history_comments`,".
			  "`gsd_comments`=`gsd_comments`,".
			  "`gsd_short_name`=`gsd_short_name`,".
			  "`gsd_status`=`gsd_status`,".
			  "`in_col`=`in_col`";
//echo $query;
	$db->query($query);
}
*/
?>
