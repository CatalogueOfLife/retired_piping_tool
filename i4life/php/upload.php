<?php
// upload.php: page to upload csv file
// $Id: upload.php,v 1.7 2011/12/06 17:18:33 kwok Exp kwok $

// load setup.php file
require_once("setup.php");

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
//$userBaseDir = "/home/";
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

// pass mysql taxa table field names to template
$smarty->assign('fieldname', $taxa->d_name());

// pass number of fields to template
$smarty->assign('no_of_fields', count($taxa->d_name()));

// pass required fields to template
$smarty->assign('required_fields', $taxa->required_fields());

// Pre-process the message data for security
if(isset($_GET['message']))
	$message = $db->clean($_GET["message"], 128);
else
	$message = "";

// pass username to template
$smarty->assign('username', $_SESSION['username']);

// initialse menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

// set up page title
$smarty->assign('page_title', 'Piping Tools Data Uploading');

// set up page specific template
$smarty->assign('template', 'upload.tpl');

// set up field names for default setting buttton
/* Original default setting
$preset_fields =	'Taxon ID\n'.
					'Genus\n'.
					'Specific epithet\n'.
					'Scientific name authorship\n'.
					'Infraspecific epithet\n'.
					'Verbatim taxon rank\n'.
					'Family\n'.
					'Order\n'.
					'Class\n'.
					'Phylum\n'.
					'Kingdom\n';
*/

// This default is for uploading data from IUCN
$preset_fields =	'Taxon ID\n'.
					'Kingdom\n'.
					'Phylum\n'.
					'Class\n'.
					'Order\n'.
					'Family\n'.
					'Genus\n'.
					'Specific epithet\n'.
					'Scientific name authorship\n'.
					'Accepted name usage ID\n'.
					'Verbatim taxon rank\n'.
					'Name published In\n';

$smarty->assign('preset_fields', $preset_fields);

/////////////////////////////////////////////////////////////////////
// here is the actual uploading code ////////////////////////////////
/////////////////////////////////////////////////////////////////////

if (isset($_POST['upload']))
// when 'Upload' button has been pressed
{
	/////////////////////////////////////
	// get all the form inputs here first?
	/////////////////////////////////////

	// get selected field name and clean it up
	// remove all the any extra space
	$selected_items = $db->clean(trim($_POST['selected_items']), 400);

	// added last newline character back to selected_items_copy
	// this variable is use to retain the setting on the input form
	if (!empty($selected_items))
		$selected_items_copy = $selected_items . '\n';
	else
		$selected_items_copy = "";

	// clean url input
	$url = $db->clean($_POST['url'], 400);

	// clean server file input
	if (!empty($_POST['server_file']))
		$server_file = $db->clean($_POST['server_file'], 400);
	else
		$server_file = "";

	// get data source
	if (!empty($_POST['source']))
		$source =$db->clean($_POST['source'], 15);

	// clean tag input
	$tag = $db->clean($_POST['tag'], 32);

	// get field delimitor and field enclosed info.
	$delimitor = $db->clean($_POST['delimitor'], 10);
	$enclose_by = $db->clean($_POST['enclose_by'], 8);

	//if (empty($_POST['source']))
	if (empty($source))
	// source has not selected
	{
		$message .= "Please select input source for upload";
		$smarty->assign('message', $message);

		// retain all the form inputs
		$smarty->assign('selected_items', $selected_items_copy);
		$smarty->assign('url', $url);
		$smarty->assign('status', 'inputform');
	}
	elseif (empty($selected_items))
	// Data Columns have not been set
	{
		$message .= "Please select Data Columns Setting";
		$smarty->assign('message', $message);

		// retain url input
		$smarty->assign('url', $url);

		// retain source selection
		$smarty->assign('source', $source);

		// retain server file selection
		$smarty->assign('server_file', $server_file);

		$smarty->assign('status', 'inputform');
	}
	else
	// source has selected and Data Columns has set
	{
		// check Data Columns Setting has selected the required fields

		// get required fields
		$required_fields = $taxa->required_fields();

		// check $selected_items contain all the required fields
		// if after checking, $missing_required_fields is remain 0,
		// this means all the required fields are there
		$missing_required_fields = 0;
		foreach ($required_fields as $required_field => $value)
			if (!preg_match("/$required_field/", $selected_items))
				$missing_required_fields++;

		if ($missing_required_fields)
		// tell the user some required fields are missing
		{
			$message .= "Please include all the required fields ".
						"in 'Data Columns Setting' and submit again.";
			$smarty->assign('message', $message);

			// retain all the form inputs
			$smarty->assign('selected_items', $selected_items_copy);
			$smarty->assign('url', $url);
			$smarty->assign('source', $source);

			// only admin will have this entry in the form
			// and here is to retain the value of the box
			if ($_SESSION['username'] == 'admin')
				$smarty->assign('server_file', $server_file);

			$smarty->assign('status', 'inputform');
		}

		// all the required Columns has selected, process file or URL
		//elseif ($_POST['source'] == 'file' &&
		elseif ($source == 'file' &&
					empty($_FILES['filename']['tmp_name']))
		// no file been selected for upload
		{
			$message .= "Please select file for uploading";
			$smarty->assign('message', $message);

			// retain all the form inputs
			$smarty->assign('selected_items', $selected_items_copy);
			$smarty->assign('url', $url);
			$smarty->assign('source', $source);

			$smarty->assign('status', 'inputform');
		}
		//elseif ($_POST['source'] == 'url' && empty($url))
		elseif ($source == 'url' && empty($url))
		// no url in input box, 
		{
			$message .= "Please type in url for uploading";
			$smarty->assign('message', $message);

			// retain all the form inputs
			$smarty->assign('selected_items', $selected_items_copy);
			$smarty->assign('source', $source);

			$smarty->assign('status', 'inputform');
		}
		//elseif ($_POST['source'] == 'server_file' && empty($server_file))
		elseif ($source == 'server_file' && empty($server_file))
		// no server file selected
		{
			$message .= "Please select a file on the server for input";
			$smarty->assign('message', $message);

			// retain all the form inputs
			$smarty->assign('selected_items', $selected_items_copy);
			$smarty->assign('url', $url);
			$smarty->assign('source', $source);

			$smarty->assign('status', 'inputform');
		}
		elseif (!file_exists($userDirectory))
		// user has no directory set up
		{
			$message .= "Cannot upload file.<br />" .
						"'$userDirectory' directory has not been set up" .
						" on the server.";
			$smarty->assign('message', $message);

			// retain all the form inputs
			$smarty->assign('selected_items', $selected_items_copy);
			$smarty->assign('url', $url);
			$smarty->assign('source', $source);

			$smarty->assign('status', 'inputform');
		}
		else
		// upload data from either file or URL
		{
			// $file_uploaded is 1 after file uploaded
			$file_uploaded = 0;

			//if ($_POST['source'] == 'file' or
			//	$_POST['source'] == 'server_file')
			if ($source == 'file' or $source == 'server_file')
			// process file
			{
				if ($source == 'file')
				// upload the file
				{
					// setting up all the uploading parameters
					$name = $_FILES['filename']['name'];
					$full_path = "$userDirectory/" . $name;

					// upload the file
					move_uploaded_file(
							$_FILES['filename']['tmp_name'],
							$full_path);
				}
				else
				{
					// set the input to server file
					$full_path = $server_file;

					// this variable used in upload success message
					$name = $full_path;
				}

				// if file is compressed and end with .zip extention
				if	(
				//		isset($_POST['zip_file']) or
						preg_match('/\.zip$/', $full_path)
					)
				{
					// here is no need to worry about space in filename
					// so this line is commented out
					// $full_path = preg_replace('/\s/', '\ ', $full_path);

					// decompress the zip file
					//$unzip_error = `/usr/bin/unzip $full_path -d /var/tmp`;
					$unzip_error =
							`/usr/bin/unzip $full_path -d $userDirectory`; 

					// set full path point to decompressed file
					// which got .csv extention
					$full_path = preg_replace('/\.zip$/', '.csv', $full_path);
				}

				// test upload or decompression is o.k.
				$file_info = stat($full_path);

				// assume everything is o.k. if file have more
				// than 10 bytes of data
				if ($file_info['size'] > 10 )
					$file_uploaded = 1;

			} // closing brace: process file

			else
			// process URL
			{
				// uploaded will be store here
				//$full_path = '/var/tmp/url_input.txt';
				$full_path = '$userDirectory/url_input.txt';

				// as $name is going to be used in upload success / failure
				// message, this will show the url instead.
				$name = $url;

				// file_get_contents() error message is suppressed in here
				// if statement check is upload from url is o.k.
				if($url_data = @ file_get_contents($name))
				{
					file_put_contents($full_path, $url_data);

					$file_uploaded = 1;		// upload is o.k.
				}

			} // closing brace: process URL

			// need to test upload file ok first
			if ($file_uploaded)
			// read the file into mysql
			{
				/////////////////////////////////////
				// this section deal with mysql query
				/////////////////////////////////////

				// setup mysql table name
				$table_name = 'taxa';

				// get name mapping array to map display to mysql field name
				$d2f_name = $taxa->d2f_name();

				// turn this into an array of display field names
				$selected_fields = explode('\r\n', $selected_items);

				// generate mysql query field input
				foreach ($selected_fields as $field)
					$query_field .= "`" . $d2f_name[$field] . "`,";
				// remove the last ','
				$query_field = preg_replace("/,$/", "", $query_field);

				// get userid
				$query = "SELECT userid FROM user ".
						 "WHERE username='" . $_SESSION['username'] . "'";
				$db->query($query);
				$results = $db->fetch();

				if (!empty($results))
				// user is exist in the database
				{
					// before upload the data into database need to find out
					// the number of taxa already there and this information
					// is use to direct to the page where uploaded data
					// is started

					// no_of_taxa set to minimum to reduce requried resouces
					$taxa = new Taxa(
										$db,
										$_SESSION['username'],
										$_SESSION['role'],
										'',		// where
										'',		// order_by
										1,		// no_of_taxa
										''		// offset
									);

					// number of taxa per page need to define elsewhere
					// very likely have to modify a few lines of code here 
					$taxa_per_page = 15;

					// store the starting id
					$s_id = $taxa->next_id($db);

					// 	reset starting id
					$taxa->reset_id($db);

					// if $tag is empty, define it here as it is needed
					// to work out the page number which newly uploaded data
					// will be shown.
					if (empty($tag))
						// use date and starting ID as $tag
						$tag = date('Y_m_d') . "SID" . $s_id;

					// calculate which page the newly uploaded data started
			//		$totalRecordNo = $taxa->totalRecordNo($db);
					$totalRecordNo = $taxa->tagRankNumber($db, $tag);
					$pageNo = ceil($totalRecordNo / $taxa_per_page);
					if (($totalRecordNo % $taxa_per_page) == 0)
						$pageNo++;

/*
					// store the starting id
					$s_id = $taxa->next_id($db);
*/

					////////////////////////////
					// the actual upload section
					////////////////////////////

					$userid = $results['userid'];

					switch ($delimitor)
					{
						case "comma"    : $delimit_char = ",";
							break;
						case "semicolon": $delimit_char = ";";
							break;
						case "tab"      : $delimit_char = "\t";
							break;
						case "space"    : $delimit_char = " ";
							break;
					}

					switch ($enclose_by)
					{
						case "d_quote": $enclose_char = '"';
							break;
						case "s_quote": $enclose_char = "\'";
							break;
						case "none"   : $enclose_char = "";
							break;
					}

					// mysql query command
					$query = "LOAD DATA LOCAL INFILE '$full_path' ".
							 "INTO TABLE $table_name FIELDS ".

					//		 "TERMINATED BY ',' ".
					//		 "OPTIONALLY ENCLOSED BY '\"' ";

					//	The following lines is used for some csv files
					//	if the field is enclosed by quotes which followed
					//  straightly by CR or LF.
					//  "LINES TERMINATED BY '\n'" is the default which
					//  only work, if there is a comma between
					//  quote and CR.
					//		 "TERMINATED BY '$delimit_char' ".
					//		 "OPTIONALLY ENCLOSED BY '$enclose_char' ".
					//		 "LINES TERMINATED BY '\r'";

							 "TERMINATED BY '$delimit_char' ".
							 "OPTIONALLY ENCLOSED BY '$enclose_char' ";

					// if ignore first row option is selected
					if (isset($_POST['no_first_row']))
						$query .= "IGNORE 1 LINES ";

					$query .= "($query_field) ";
					$query .= "SET provider_id = '$userid',";

/* move the following codes a few lines before
					if (empty($tag))
						// use date and starting ID as $tag
						$tag = date('Y_m_d') . "SID" . $s_id;
*/

					$query .= "tag = '$tag'";

//echo "$query";
					$db->query($query);

					$message .= "Successfully uploaded '$name'.<br />";
				//	$message .= "Newly uploaded taxa begin at ID: $s_id.";

					// codes leading to taxa.php
					header("Location: taxa.php?message=".urlencode($message).
							"&pageNo=$pageNo");
				}
				else
				// could not find userid! show technical error message
				{
					$message .= "There is a technical problem, ".
								"cannot upload file.";
					$smarty->assign('message', $message);

					$smarty->assign('selected_items', $selected_items_copy);
					$smarty->assign('url', $url);
					$smarty->assign('status', 'inputform');
				}

				/////////////////////////////
				// end of mysql query section 
				/////////////////////////////

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

		} // closing brace: upload data from either file or URL

	} // closing brace: source has selected and Data Columns has set

} // closing brace: when 'Upload' button has been pressed

elseif (isset($_POST['server_file_select']))
// selection form for file on the server
{
	// store "Data Columns Setting" info, which would be restore
	// when return back to "input form" page

	// get selected field name and clean it up
	// remove all the any extra space
//	$selected_items = $db->clean(trim($_POST['selected_items']), 400);
	$selected_items = $_POST['selected_items'];

	// added last newline character back to selected_items_copy
	// this variable is use to retain the setting on the input form
//	$selected_items_copy = $selected_items . '\n';
	$selected_items_copy = $selected_items;

	$smarty->assign('selected_items_copy', $selected_items_copy);

	// get a list of usernames
	$userTable = new Table($db, 'user', '', 'username');
	$users = $userTable->get_result();

	// initialise $files array
	$files = array();

	for ($i = 0; $i < $userTable->num_rows(); $i++)
	{
		// goes through each user's directory
		$user = $users[$i]['username'];

		// see if the directory exist
		// do nothing if it is not exist
		// This check is needed to avoid error
		// if directory not exist
		if (file_exists($userBaseDir . $user))
		{

			foreach (new DirectoryIterator($userBaseDir . $user) as $file)
			{
				$fullpath = $file->getPathname();
				$basename = basename($fullpath);

				// $isHidden will set to 1 if $basename is started with '.'
				$isHiddenFile = preg_match("/^\./", $basename);

				if (is_file($fullpath) && !$isHiddenFile)
					// ignore directories and hidden files
					$files[] = $fullpath;

/* 				// old section of codes
				$fullpath = $file->getPathname();
				if (is_file($fullpath))
				{
					$basename = basename($fullpath);
					$files[$basename] = $fullpath;
					$filename[] = $basename;
				}
*/
			}
		}
	}

//	sort($filename, SORT_STRING);

	//$smarty->assign('filenames', $filename);
	$smarty->assign('files', $files);

	$smarty->assign('status', 'server_file_select');
}

elseif (isset($_POST['submit_file_selection']) &&
			$_SESSION['username'] == 'admin')
// submission of file on the server selection form
{
	$selected_items = $db->clean(trim($_POST['selected_items_copy']), 400);
	if (!empty($selected_items))
		$selected_items = $selected_items . '\n';
	$smarty->assign('selected_items', $selected_items);

	if (!empty($_POST['file_selection']))
		$smarty->assign('server_file', $_POST['file_selection']);
	$smarty->assign('source', 'server_file');
	$smarty->assign('status', 'inputform');
}

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

?>
