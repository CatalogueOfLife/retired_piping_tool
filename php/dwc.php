<?php
// dwc.php: start uploading Dwc from GBP
// Usage: /usr/bin/php dwc.php <GBP>
// e.g /usr/bin/php dwc.php ENA
// URLs of GBP should be stored on user table of Piping Tools
// $Id$

// load setup.php file
require_once("setup.php");

// load DwC input function
require_once("dwcLib.php");

// Create log file and set write privilege to all
// this is needed as cron job and web brower might use the same log file.
$log_file = LOG_DWC;	// LOG_DWC is defined in setup.php
`/usr/bin/touch $log_file`;
`/bin/chmod 777 $log_file`;

// Check for any argument for this script
if ($argc != 2)
	die("Usage: /usr/bin/php dwc.php <name of GBP>\n");

// get the name of the GBP
$gbp = $argv[1];

// dwc.php starting message
echo "Uploading $gbp DwC started: " . date('H:i:s d-m-Y') . "\n";

// Connect to the MySQL DBMS 
// credentials are in the file db.php
// Notes: $db is an object of class DB, and it is NOT directly link to
// mysqli connection.
$db = new DB ($DB_hostname, $DB_username, $DB_password, $DB_databasename);

// Create a Taxa object with no_of_taxa set to 1 to make it run a bit efficient
$taxa = new Taxa(
					$db,
				//	$_SESSION['username'],
					'admin',	// $_SESSION variables not available here!
				//	$_SESSION['role'],
					'admin',	// $_SESSION variables not available here!
					'',			// where
					'',			// order_by
					1,			// no_of_taxa
					''			// offset
				);

// Check $gbp is exist, note 'admin' is not GBP and would be rejected here
// Have to code it like this, as case is important here!
// $gbp value will be use to form directory path on the server and
// Unix / Linux directory name are case sensitive.
$user_table_object = new User($db);
$users = $user_table_object->get_result();

$usernames = array();
foreach ($users as $user)
	$usernames[] = $user['username'];

if (!in_array($gbp, $usernames))
	die ("No GBP has this name: $gbp\n");

// Create UserInfo object which contain information for uploading
$gbp_info = new UserInfo($db, $gbp);

// Print message to log
echo "$gbp update from [" . $gbp_info->down_load_url . "]\n";


// download and unzip DwC
echo "Downloading zip file\n";
$status = getDwC($gbp_info);

switch($status)
{
	case "updated":
		echo "Loading into Taxa Table\n";
		inputDwCtoBuffer2($db, $taxa, $gbp_info, '');
		break;
	case "unchange":
		// check to see if taxa table is empty for this GBP
		$tags = $taxa->tags($db);
		$no_of_record = 0;
		foreach ($tags as $tag)
		{
			if ($tag['username'] == $gbp)
				$no_of_record += $tag['COUNT(tag)'];
		}
		if ($no_of_record > 0)
		// if this data provider has data in taxa table, do nothing
			echo "No update in data file, skipping loading into Taxa Table\n";
		else
		// if this data provider has no data in taxa table
		// load the data into taxa table
		{
			echo "Loading into Taxa Table\n";
			inputDwCtoBuffer2($db, $taxa, $gbp_info, '');
		}
		break;
	case "fail":
		echo "Cannot download zip file\n";
		break;
}

echo "Uploading $gbp DwC ended: " . date('H:i:s d-m-Y') . "\n";

/////////////////////////////////////////
// Function definition in here //////////
/////////////////////////////////////////

// getDwC(), download and unzip DwC archive
function getDwC(UserInfo $gbp_info)
{
	$down_load_url = $gbp_info->down_load_url;
	$down_load_file = $gbp_info->down_load_file;
	$down_load_username = $gbp_info->down_load_username;
	$down_load_password = $gbp_info->down_load_password;

	$name_n_password = '';
	if ($down_load_username)
	{
		$name_n_password = ' --http-user=' . $down_load_username;
		if ($down_load_password)
			$name_n_password .= ' --http-password=' . $down_load_password;
	}

	//////////////////////////////////////////////////////////////////////
	// the following codes define $file_full_path which give the full
	// path on local server after the file has uploaded. 
	//////////////////////////////////////////////////////////////////////

	// download file full path on local server
	$file_full_path	= USER_BASE_DIR . $gbp_info->username . "/" .
						$down_load_file;

	// user home directory full path
	$home_dir		= USER_BASE_DIR . $gbp_info->username . "/";

	// data file full path
	$data_file = USER_BASE_DIR.$gbp_info->username."/".$gbp_info->taxa_file;

	///////////////////////////////////////////////////////
	// clean up the directory before uploading the file
	///////////////////////////////////////////////////////

	// EoL doesn't use DwC and the followings codes dealing with DwC only
	if ($gbp_info->username != 'EoL')
	{
		// Get the old data file time stamp
		if (file_exists($data_file))
		{
			$old_date_stamp = filemtime($data_file);

			// remove old data file
			unlink($data_file);
		}
		else
			// set old data stamp as empty string
			$old_date_stamp = '';

		if (file_exists($home_dir . "eml.xml"))
			unlink($home_dir . "eml.xml");

		if (file_exists($home_dir . "meta.xml"))
			unlink($home_dir . "meta.xml");

		// IUCN & GBIF have these files
		if (file_exists($home_dir . "distribution.txt"))
			unlink($home_dir . "distribution.txt");

		if (file_exists($home_dir . "vernacularname.txt"))
			unlink($home_dir . "vernacularname.txt");

		if (file_exists($home_dir . "description.txt"))
			unlink($home_dir . "description.txt");

		// GBIF has these files as well
		if (file_exists($home_dir . "reference.txt"))
			unlink($home_dir . "reference.txt");

		if (file_exists($home_dir . "typesandspecimen.txt"))
			unlink($home_dir . "typesandspecimen.txt");

		if (file_exists($home_dir . "speciesprofile.txt"))
			unlink($home_dir . "speciesprofile.txt");

		if (file_exists($home_dir . "image.txt"))
			unlink($home_dir . "image.txt");

		if (file_exists($home_dir . "smallDataSet.tab"))
			unlink($home_dir . "smallDataSet.tab");

		// get the zip file by wget
		`/usr/bin/wget -O $file_full_path $down_load_url $name_n_password`;

		// decompress the zip file
		if (file_exists($file_full_path))
		{
			echo "Unzip $file_full_path\n";

			`/usr/bin/unzip $file_full_path -d $home_dir 2>&1`;
			$new_date_stamp = filemtime($data_file);
		}
		else
			// zip file doesn't exist
			return 'fail';

		/////////////////////////////////////////////////////////////
		// Need to change privildge of all the files under user /////
		// directory as the script could be run either under root ///
		// or apache web server and would be own by different ///////
		// owners and groups, this might cause problem //////////////
		/////////////////////////////////////////////////////////////

		// change priviledge of zip file
		chmod($file_full_path, 0666);

		// change priviledge of all the extracted files
		if (file_exists($data_file))
			chmod($data_file, 0666);

		if (file_exists($home_dir . "eml.xml"))
			chmod($home_dir . "eml.xml", 0666);

		if (file_exists($home_dir . "meta.xml"))
			chmod($home_dir . "meta.xml", 0666);

		// IUCN & GBIF have these files
		if (file_exists($home_dir . "distribution.txt"))
			chmod($home_dir . "distribution.txt", 0666);

		if (file_exists($home_dir . "vernacularname.txt"))
			chmod($home_dir . "vernacularname.txt", 0666);

		if (file_exists($home_dir . "description.txt"))
			chmod($home_dir . "description.txt", 0666);

		// GBIF has these files as well
		if (file_exists($home_dir . "reference.txt"))
			chmod($home_dir . "reference.txt", 0666);

		if (file_exists($home_dir . "typesandspecimen.txt"))
			chmod($home_dir . "typesandspecimen.txt", 0666);

		if (file_exists($home_dir . "speciesprofile.txt"))
			chmod($home_dir . "speciesprofile.txt", 0666);

		if (file_exists($home_dir . "image.txt"))
			chmod($home_dir . "image.txt", 0666);

		if (file_exists($home_dir . "smallDataSet.tab"))
			chmod($home_dir . "smallDataSet.tab", 0666);


		// check whehter downloaded file is a new version
		if ($old_date_stamp === $new_date_stamp)
			// no changes in data file 
			return 'unchange';
		else
			// new data in data file
			return 'updated';
	}
	else
	{
		// EoL code will be here, at the moment EoL is not supported so
		// return status is 'fail'
		return 'fail';
	}
}
?>
