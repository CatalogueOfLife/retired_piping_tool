<?php
// upload.php: page to upload csv file

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

// Create $taxa object
$taxa = new Taxa($db);

// pass mysql taxa table field names to template
$smarty->assign('fieldname', $taxa->d_name());

// pass number of fields to template
$smarty->assign('no_of_fields', count($taxa->d_name()));

// pass required fields to template
$smarty->assign('required_fields', $taxa->required_fields());

// Pre-process the message data for security
if(isset($_GET['message']))
	$message = $db->clean($_GET["message"], 128);

// pass message to template
//$smarty->assign('message', $message);

// pass username to template
$smarty->assign('username', $_SESSION['username']);

// initialse menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

// set up page title
$smarty->assign('page_title', 'Piping Tools File Upload Page');

// set up page specific template
$smarty->assign('template', 'upload.tpl');

// set up field names for default setting buttton
$preset_fields =	'Genus\n'.
					'Species epithet\n'.
					'Infraspecies\n'.
					'Infraspecies marker\n'.
					'Author string\n'.
					'Family\n'.
					'Order\n'.
					'Class\n'.
					'Phylum\n'.
					'Kingdom\n';

$smarty->assign('preset_fields', $preset_fields);

// test code
if (isset($_POST['setCol']))
{
/*
	echo "Test the f2d_name: ";
	echo "<br />";
	$name = $taxa->f2d_name();
	foreach ($name as $fieldname => $displayname)
		echo "$fieldname $displayname <br />";

	echo "<br />";

	echo "Test the d2f_name: ";
	echo "<br />";
	$name = $taxa->d2f_name();
	foreach ($name as $displayname => $fieldname)
		echo "$displayname $fieldname <br />";

	echo "<br />";

	echo "Test the d_name: ";
	echo "<br />";
	$name = $taxa->d_name();
	foreach ($name as $displayname)
		echo "$displayname <br />";

	echo "<br />";
*/

/*	if (!empty($_POST['selected_items']))
	{
		echo "Setting up input fields: <br />";

		// get name mapping array to map from display to mysql field name
		$d2f_name = $taxa->d2f_name();

		// get required fields
		$required_fields = $taxa->required_fields();

		// get selected field name and clean it up
		$selected_items = $db->clean(trim($_POST['selected_items']), 400);

		// check $selected_items contain all the required fields
		// if after checking, $missing_required_fields is remain 0,
		// this means all the required fields are there
		$missing_required_fields = 0;
		foreach ($required_fields as $required_field => $value)
			if (!preg_match("/$required_field/", $selected_items))
				$missing_required_fields++;

		//echo "missing_required_fields is: $missing_required_fields";

		if ($missing_required_fields)
		// tell the user some required fields are missing
		{
			$message .= "Please include all the required fields ".
						"and submit again.";
			$smarty->assign('message', $message);

		}
		else
		// upload the file
		{
			// turn this into an array of display field names
			$selected_fields = explode('\r\n', $selected_items);

			// generate mysql query field input
			foreach ($selected_fields as $field)
				$query_field .= "`" . $d2f_name[$field] . "`,";

			// remove the last ','
			$query_field = preg_replace("/,$/", "", $query_field);

			echo $query_field;
		}
	}
*/
}

/////////////////////////////////////////////////////////////////////
// here is the actual uploading code ////////////////////////////////
/////////////////////////////////////////////////////////////////////

/* This code is obsolete now
if (	$_FILES &&									// upload button
		!empty($_FILES['filename']['tmp_name']) &&	// selected file
		!empty($_POST['selected_items'])			// selected fields
)
*/

/*if (isset($_POST['upload']))
// when 'Upload' button been pressed
{
	if (empty($_POST['source']))
	{
		$message .= "Please select input source for upload";
		$smarty->assign('message', $message);
		$smarty->assign('status', 'inputform');
	}
	else
	{

		// get required fields
		$required_fields = $taxa->required_fields();

		// get selected field name and clean it up
		$selected_items = $db->clean(trim($_POST['selected_items']), 400);

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
						"in 'Data Columns Setting and submit again.";
			$smarty->assign('message', $message);

			$smarty->assign('status', 'inputform');

		}
		else
		// upload the file
		{
			// get name mapping array to map from display to mysql field name
			$d2f_name = $taxa->d2f_name();

			// turn this into an array of display field names
			$selected_fields = explode('\r\n', $selected_items);

			// generate mysql query field input
			foreach ($selected_fields as $field)
				$query_field .= "`" . $d2f_name[$field] . "`,";
			// remove the last ','
			$query_field = preg_replace("/,$/", "", $query_field);

			// setting up all the uploading parameters
			$name = $_FILES['filename']['name'];
			$full_path = '/var/tmp/' . $name;
			$table_name = 'taxa';

			move_uploaded_file($_FILES['filename']['tmp_name'], $full_path);

// this only a temporary solution at moment, need to create objects query
// or incorperate query in table object
//	$query = "LOAD DATA LOCAL INFILE '$full_path' " .
//			 "INTO TABLE $table_name FIELDS TERMINATED BY ',' " .
//			 "OPTIONALLY ENCLOSED BY '\"' " .
//			 "(genus, species_epithet, infraspecies, infraspecies_marker, " .
//			 "author_string, family, `order`, class, phylum, kingdom)";

			// get userid
			$query = "SELECT userid FROM user ".
					 "WHERE username='" . $_SESSION['username'] . "'";
			$db->query($query);
			$results = $db->fetch();

			if (!empty($results))
			{
				//echo $results['userid'];
				$userid = $results['userid'];

				// mysql query command
				$query = "LOAD DATA LOCAL INFILE '$full_path' ".
						 "INTO TABLE $table_name FIELDS TERMINATED BY ',' ".
						 "OPTIONALLY ENCLOSED BY '\"' ".
						 "($query_field) ".
						 "SET provider_id = '$userid'";

				$db->query($query);

				// display update success message
				$message .= "Successfully uploaded '$name'.";
				$smarty->assign('message', $message);
				$smarty->assign('status', 'uploaded');
			}
			else
			// could not find userid! show technical error message
			{
				$message .= "There is a technical problem, cannot upload file.";
				$smarty->assign('message', $message);
			}
		}
	}
}
else
// show input form
{
	$smarty->assign('status', 'inputform');
}
*/


// ******************************************************
// Have to rewrite from scratch!!!!! for complicate logic
// ******************************************************
if (isset($_POST['upload']))
// when 'Upload' button has been pressed
{
	if (empty($_POST['source']))
	// source has not selected
	{
		$message .= "Please select input source for upload";
		$smarty->assign('message', $message);
		$smarty->assign('status', 'inputform');
	}
	elseif (empty($_POST['selected_items']))
	// Data Columns have not been set
	{
		$message .= "Please select Data Columns Setting";
		$smarty->assign('message', $message);
		$smarty->assign('status', 'inputform');
	}
	else
	// source has selected and Data Columns has set
	{
		// check Data Columns Setting has selected the required fields

		// get required fields
		$required_fields = $taxa->required_fields();

		// get selected field name and clean it up
		$selected_items = $db->clean(trim($_POST['selected_items']), 400);

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
						"in 'Data Columns Setting and submit again.";
			$smarty->assign('message', $message);

			$smarty->assign('status', 'inputform');
		}

		// all the required Columns has selected, process file or URL
		elseif ($_POST['source'] == 'file' &&
					empty($_FILES['filename']['tmp_name']))
		// no file been selected for upload
		{
			$message .= "Please select file for uploading";
			$smarty->assign('message', $message);
			$smarty->assign('status', 'inputform');
		}
		elseif ($_POST['source'] == 'url' &&
					empty($_POST['url']))
		// no url in input box, 
		{
			$message .= "Please type in url for uploading";
			$smarty->assign('message', $message);
			$smarty->assign('status', 'inputform');
		}
		else
		// upload data from either file or URL
		{
			// $file_uploaded is 1 after file uploaded
			$file_uploaded = 0;

			if ($_POST['source'] == 'file')
			// process file
			{
				// setting up all the uploading parameters
				$name = $_FILES['filename']['name'];
				$full_path = '/var/tmp/' . $name;

				move_uploaded_file(
						$_FILES['filename']['tmp_name'],
						$full_path);

				$file_uploaded = 1;

			} // closing brace: process file

			else
			// process URL
			{
				// uploaded will be store here
				$full_path = '/var/tmp/url_input.txt';

				// clean url input
				$name = $db->clean($_POST['url'], 200);

				$url_data = file_get_contents($name);
				file_put_contents($full_path, $url_data);

				$file_uploaded = 1;

/*
				// open both remode and local file
				// remote file
				$fh_input = fopen($url, 'r') or die($php_errormsg);
				// local file
				$fh_output = fopen($full_path, 'w') or die($php_errormsg);

				// copy the file
				while (! feof($fh_input))
				{
					$char = fgets($fh_input);
					fput(
				}
*/

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
				{
					//echo $results['userid'];
					$userid = $results['userid'];

					// mysql query command
					$query = "LOAD DATA LOCAL INFILE '$full_path' ".
							 "INTO TABLE $table_name FIELDS ".
							 "TERMINATED BY ',' ".
							 "OPTIONALLY ENCLOSED BY '\"' ";

					// if ignore first row option is selected
					if (isset($_POST['no_first_row']))
						$query .= "IGNORE 1 LINES ";

					$query .= "($query_field) ";
					$query .= "SET provider_id = '$userid'";

					$db->query($query);

					// display update success message
					$message .= "Successfully uploaded '$name'.";
					$smarty->assign('message', $message);
					$smarty->assign('status', 'uploaded');
				}
				else
				// could not find userid! show technical error message
				{
					$message .= "There is a technical problem, ".
								"cannot upload file.";
					$smarty->assign('message', $message);
					$smarty->assign('status', 'inputform');
				}

				/////////////////////////////
				// end of mysql query section 
				/////////////////////////////

			} // closing brace: read the file into mysql

			else
			// file is not uploaded
			{
				$message .= "Cannot upload file";
				$smarty->assign('message', $message);
				$smarty->assign('status', 'inputform');
			}

		} // closing brace: upload data from either file or URL

	} // closing brace: source has selected and Data Columns has set

} // closing brace: when 'Upload' button has been pressed
else
// show input form
{
	$smarty->assign('status', 'inputform');
}

$smarty->display("master.tpl");

?>
