<?php
// xmap_upload.php: page to upload x-map tools output file
// $Id: xmap_upload.php,v 1.1 2012/07/11 10:40:23 kwok Exp kwok $

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

// Save session username to later use
$username = $_SESSION['username'];

// set up $userBaseDir
// might have to clean this up by removing $userBaseDir and
// use 'USER_BASE_DIR' directly
$userBaseDir = USER_BASE_DIR;

// set up $userDirectory
$userDirectory = $userBaseDir . $username;

// Create $taxa object
// no_of_taxa is set to 1 to save memory
$taxa = new Taxa(
					$db,
					$username,
					$_SESSION['role'],
					'',		// where
					'',		// order_by
					1,		// no_of_taxa
					''		// offset
				);

// Pre-process the message data for security
if(isset($_GET['message']))
	$message = $db->clean($_GET["message"], 128);
else
	$message = "";

// pass username to template
$smarty->assign('username', $username);

// initialse menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

// set up page title
$smarty->assign('page_title', 'Piping Tools X-map Data Uploading');

// set up page specific template
$smarty->assign('template', 'xmap_upload.tpl');

/////////////////////////////////////////////////////////////////////
// here is the actual uploading code ////////////////////////////////
/////////////////////////////////////////////////////////////////////

if (isset($_POST['upload']) && !empty($_FILES['filename']['tmp_name']))
// when 'Upload' button has been pressed and a file on client machine
// has been selected.
{
	/////////////////////////////////////
	// My code start here.
	/////////////////////////////////////

	$message .= "Uploaded.";
	$smarty->assign('message', $message);

	// $file_uploaded is 1 after file uploaded
	$file_uploaded = 0;

	// setting up all the uploading parameters
	$name = $_FILES['filename']['name'];
	$full_path = "$userDirectory/" . $name;

	// cleaned filename and full path to the clean file
	$csv_name = 'upload.csv';
	$csv_full_path = "$userDirectory/" . $csv_name;

	// upload the file
	move_uploaded_file( $_FILES['filename']['tmp_name'], $full_path);

	// test upload or decompression is o.k.
	$file_info = stat($full_path);

	// assume everything is o.k. if file have more
	// than 10 bytes of data
	if ($file_info['size'] > 10 )
	{
		$file_uploaded = 1;

		// remove carriage return which would case problem
		// should code this a bit better, but I'm in a hurry to get this fix.
		// Also need to remove 3 funny character at the beginning of the file!
		`/usr/bin/tr -d '\015\357\273\277' < $full_path > $csv_full_path`;
	}

	// need to test upload file ok first
	if ($file_uploaded)
	// read the file into mysql
	{
		/////////////////////////////////////
		// get data provider ID first ///////
		/////////////////////////////////////

		// The following code only apply for admin,
		// need to modify these code for other users.

		// get field delimitor and field enclosed info.
		$dataProvider = $db->clean($_POST['dataProvider'], 10);

		// get provider (userid) ID from user table
		$query = "SELECT userid FROM user ".
				 "WHERE username='" . $dataProvider . "'";
		$db->query($query);
		$results = $db->fetch();

		$dataProviderID = $results['userid'];

		/////////////////////////////////////
		// this section deal with mysql query
		/////////////////////////////////////

/*
		// These codes do hardwiring import and it doesn't work with xmampper
		// setup mysql table name
		$table_name = 'xmap';	// x-map tools input buffer

		// get the format of x-map tools output, which is stored under
		// admin account
		$xmap_info = new UserInfo($db, 'admin');

		// load the blimming things in 'xmap' table
		inputFiletoBuffer(
							$db,
							$taxa,
							$xmap_info,
							'',
							$full_path,
							$dataProviderID
						  );
*/

		/////////////////////////////////////////////////////////////
		// New codes for flexible data structure using DwC //////////
		/////////////////////////////////////////////////////////////

		$info = new UserInfo($db, 'admin');

		inputDwCtoBuffer2($db, $taxa, $info, '', $dataProviderID);

		$smarty->assign('status', 'display');

	} // closing brace: read the file into mysql

	else
	// file is not uploaded
	{
		$message .= "Cannot upload file from '$name'";
		$smarty->assign('message', $message);

		$smarty->assign('selected_items', $selected_items_copy);
		$smarty->assign('url', $url);
		$smarty->assign('status', 'inputform');
	}

} // closing brace: when 'Upload' button has been pressed

else
// show input form
{
	$smarty->assign('status', 'inputform');
}

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");


//////////////////////////////////
// Function definition in here ///
//////////////////////////////////

function inputFiletoBuffer(
							DB			$db,		// db base handle
							Taxa		$taxa,		// taxa table object
							UserInfo	$xmap_info,	// x-map output format
										$tag,		// tag (redundent)
										$full_path,	// input data file path
										$dataProviderID
							)
{
	// get starting id in taxa table
	$s_id = $taxa->next_id($db);

	// need to define $tag later?

	// generate mysql query field input
	$query_field = '';
	foreach ($xmap_info->inputField as $field)
		$query_field .= "`" . $field . "`,";
	// remove the last ','
	$query_field = preg_replace("/,$/", "", $query_field);
//echo $query_field;

	// set up other uploading options

	//$delimit_char
	switch ($xmap_info->delimitor)
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

	//$enclose_char
	switch ($xmap_info->enclose_by)
	{
		case "d_quote"		: $enclose_char = '"';
			break;
		case "s_quote"		: $enclose_char = "\'";
			break;
		case "none"			: $enclose_char = "";
			break;
	}

	// clear xmap buffer table first
	// if doesn't clear it first, all the previous record would be imported
	// into taxa table.
	$query = "TRUNCATE TABLE xmap";
	$db->query($query);

	// mysql query command to upload input buffer xmap
	$query = "LOAD DATA LOCAL INFILE '$full_path' ".
			 "INTO TABLE xmap FIELDS ".
			 "TERMINATED BY '$delimit_char' ".
			 "OPTIONALLY ENCLOSED BY '$enclose_char' ";

	// if ingore first row option is selected
	if ($xmap_info->no_first_row)
		$query .= "IGNORE 1 LINES ";

	$query .= "($query_field) ";
	$query .= "SET provider_id = '$dataProviderID'";

//	$query .= "SET provider_id = '12',";
//	$query .= "tag = '$tag'";

	$db->query($query);

	//////////////////////////////////////////////////////
	// Transformation section, from buffer to taxa table /
	//////////////////////////////////////////////////////

	$queries = explode(';', $xmap_info->mysql_script);
	foreach ($queries as $query)
		$db->query($query);
}

?>
