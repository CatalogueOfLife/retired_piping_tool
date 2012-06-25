<?php
// dwc.php: DwC Uploading page of Piping Tools
// $Id$

// load setup.php file
require_once("setup.php");

// initialise smarty object for display html template
$smarty = new Smarty_PipingTools();

// Check if the user is logged in
// (this also starts the session)
logincheck();

// Connect to the MySQL DBMS and use the myProbes database - 
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
		inputDwCtoBuffer($db, $taxa, $gbp_info, '');

	$smarty->assign('status', 'display');
//	print "selected CBOL";
}
elseif (isset($_POST['ena']) && $_SESSION['username'] == 'admin')
{
/*
	if ($taxa->clear_taxa_table($db))
		$message = "There is a technical problem, records cannot be clear.";
	else
		$message = "All the taxa records are deleted.";

	$smarty->assign('message', $message);

	// go back to the setting form input page
	$smarty->assign('status', 'display');
*/

	// get data provider setting, e.g. url, field order, delimited char ...
	$gbp_info = new UserInfo($db, 'ENA');

	// download and unzip DwC
	$message = getDwC($gbp_info);

	// load the blimming things in 'ENA' table
	// $tag is undefine at the moment
	if (!$message)	// no error in the download process using 'wget'
		inputDwCtoBuffer($db, $taxa, $gbp_info, '');

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
		inputDwCtoBuffer($db, $taxa, $gbp_info, '');

	$smarty->assign('status', 'display');
//	print "selected GBIF";
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
		inputDwCtoBuffer($db, $taxa, $gbp_info, '');

	$smarty->assign('status', 'display');
//	print "selected IUCN";
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

	$query = $gbp_info->mysql_script;
	$db->query($query);
}

// getDwC(), download and unzip DwC archive
function getDwC(UserInfo $gbp_info)
{
	$down_load_url = $gbp_info->down_load_url;

	if (preg_match('/\.zip$/', $down_load_url))
	{
		$zip_file_name = basename($down_load_url);
		$file_ext = ".zip";
		$rx_pattern = "/\.zip$/";  // use in regular expression search
		$gz_file_name = "";
		$file_name = "";
	}
	elseif (preg_match('/\.gz$/', $down_load_url))
	{
		$gz_file_name = basename($down_load_url);
		$file_ext = ".gz";
		$rx_pattern = "/\.gz$/";  // use in regular expression search
		$zip_file_name = "";
		$file_name = "";
	}
	else
	{
		// IUCN stuff would be defined in here as the download
		// URL is a wrapper, it doesn't include the zip file name
		if ($gbp_info->username == 'IUCN')
		{
			$zip_file_name = "IUCN.zip";	// define the name hear wired
			$file_ext = ".zip";
			$rx_pattern = "/\.zip$/";  // use in regular expression search
			$file_name = "";
			$gz_file_name = "";
		}
		// CBOL stuff would be defined in here as it likes IUCN,
		// it's URL doesn't contain zip filename
		elseif ($gbp_info->username == 'CBOL')
		{
			$zip_file_name = "CBOL.zip";	// define the name hear wired
			$file_ext = ".zip";
			$rx_pattern = "/\.zip$/";  // use in regular expression search
			$file_name = "";
			$gz_file_name = "";
		}
		else
		{
			$file_name = basename($down_load_url);
			$file_ext = "";
			$rx_pattern = "/$/";  // use in regular expression search
			$zip_file_name = "";
			$gz_file_name = "";
		}
	}

	// me being lazy, only one of them will filled, $zip_file_name,
	// $gz_file_name, $file_name, no point to repeat this line 3 times
	// in the if .... elseif ... else statement.
	$file_full_path	= USER_BASE_DIR . $gbp_info->username . "/" .
						$zip_file_name . $gz_file_name . $file_name;

	$home_dir		= USER_BASE_DIR . $gbp_info->username . "/.";
	$home_dir_part	= USER_BASE_DIR . $gbp_info->username . "/";


	// probably need to move the old zip file first before 'wget' the new one
	// clean up the directory first ....
	// don't need to clean up with .gz file
	if (file_exists($file_full_path) && ($file_ext != '.gz'))
	{
		// rename old compressed file with date of the file appanded
		// to the filename
		$date_stamp = strftime('%Y%m%d', filemtime($file_full_path));
		$new_filename =
	//		preg_replace("/\.zip$/", "_$date_stamp"."$file_ext",
			preg_replace($rx_pattern, "_$date_stamp"."$file_ext",
							$file_full_path);
		rename($file_full_path, $new_filename);
	}

	// if uncompressed data file exist
	$data_file = $home_dir_part . $gbp_info->taxa_file;
	if (file_exists($data_file))
		if ($gbp_info->username == 'GBIF')
		{
			// for GBIF, rename the file
			$date_stamp =
				strftime('%Y%m%d', filemtime($data_file));
			rename($data_file,
					$data_file . "_$date_stamp");
		}
		else
			// everyone else, delete it
			unlink($data_file);

	if (file_exists($home_dir_part . "eml.xml"))
		unlink($home_dir_part . "eml.xml");

	if (file_exists($home_dir_part . "meta.xml"))
		unlink($home_dir_part . "meta.xml");

	// use 'wget' to get the blimming thing, then unzip it and put in
	// user home directory
//	$error = system("/usr/bin/wget -P $home_dir $down_load_url");

//echo $file_full_path . " " . $down_load_url;
	if ($gbp_info->username == 'IUCN')
		// need to use $file_full_path as IUCN doesn't have zip filename in
		// their download URL
		`/usr/bin/wget -O $file_full_path $down_load_url`;
	elseif ($gbp_info->username == 'CBOL')
		// need to use $file_full_path as CBOL URL doesn't have zip filename
		// and it also need username and passoword
		`/usr/bin/wget -O $file_full_path $down_load_url --http-user=i4life --http-password=project2011`;
	else
		`/usr/bin/wget -P $home_dir $down_load_url`;

	if (file_exists($file_full_path))
	{
		switch ($file_ext)
		{
			case ".zip":
				$extract_error =
					`/usr/bin/unzip $file_full_path -d $home_dir`;
				break;
			case ".gz":
				$extract_error =
					`/bin/gzip -d $file_full_path`;
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

?>
