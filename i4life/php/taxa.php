<?php
// taxa.php: Taxa Table page of Piping Tools
// $Id: taxa.php,v 1.3 2011/10/10 10:11:41 kwok Exp kwok $

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

// Set sorting order of records in Uploaded Data listing
if ($_SESSION['username'] == 'admin')
	// Two different data providers might use the same taxonID
	// hence need to separate by provider_id first
	$order_by = 'provider_id, tag, cast(acceptedNameUsageID as unsigned), '.
				'taxonomicStatus';
//	$order_by = 'provider_id, acceptedNameUsageID, '.
//				'taxonomicStatus';
//	$order_by = 'index1';
else
	// only one data provide record will be shown
	$order_by =	'tag, cast(acceptedNameUsageID as unsigned), taxonomicStatus';

// Really have to create this object first, as we need to know
// total number of taxa to handle paging corectly.
// Note no_of_taxa is set to 1 to make it run a bit more efficient
$taxa = new Taxa(
					$db,
					$_SESSION['username'],
					$_SESSION['role'],
					'',			// where
					'',			// order_by
					1,			// no_of_taxa
					''			// offset
				);

////////////////////////////////////////////////////////////////////////
// Paging Logic Section ////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

// initial default values for paging variables
//$order_by = 'id';
// Set this up already earlier
//$order_by = 'cast(acceptedNameUsageID as unsigned), taxonomicStatus';
$taxa_per_page = 15;

$totalRecordNo = $taxa->totalRecordNo($db);

// total page number has to be integer
$totalPageNo = ceil($totalRecordNo / $taxa_per_page);

if(
	isset($_POST['toPage'    ]) or	// 'To Page' button
	isset($_POST['selectAll' ]) or	// 'Select All' button
	isset($_POST['clearAll'  ]) or	// 'Unselect All' button
	isset($_POST['edit'      ]) or	// 'Edit Selected Taxa' button
	isset($_POST['editSave'  ]) or	// 'Save' button in edit page
	isset($_POST['editCancel']) or 	// 'Cancel' button in edit page
	isset($_GET['pageNo'     ])	or	// 'Navigating Arrow' links
	// 'Delete Selected Taxa' button without any taxa selected
	(isset($_POST['delete']) and empty($_POST['taxa']))
)
// set current page number
{
	if (isset($_GET['pageNo']))
		// from navigating arrow links
		$pageNo = $db->clean($_GET['pageNo'], 5);
	else
		// from stored hidden input on web page
		$pageNo = $db->clean($_POST['pageNo'], 5);
	
	// need to make sure it is an integer
	// for non-number input, $pageNo will be 0
	$pageNo = floor($pageNo);

	// 1 is the lowest page number we can have
	if ($pageNo <= 0)
		$pageNo = 1;
	// $pageNo cannot be bigger than $totalPageNo
	// $totalPageNo has been calculated earlier in the code
	elseif ($totalPageNo != 0 and $pageNo > $totalPageNo)
		$pageNo = $totalPageNo;
}
else
// this give default page no as 1, when the page is first visited
	$pageNo = 1;

// set previous and next page nubmers for navigating arrows
if ($pageNo == 1)
	$pre_page = 0; // this will dissable showing of left arrow
else 
	$pre_page = $pageNo - 1;
if ($pageNo == $totalPageNo)
	$next_page = 0; // this will dissable showing of right arrow
else
	$next_page = $pageNo + 1;

// store current previous and next page numbers in the web page
$smarty->assign('pageNo', $pageNo);
$smarty->assign('pre_page', $pre_page);
$smarty->assign('next_page', $next_page);

// offset calculation
$offset = $taxa_per_page * ($pageNo - 1);

// refresh object with pagination information
$taxa->refresh($db, $order_by, $taxa_per_page, $offset);

$totalRecordNo = $taxa->totalRecordNo($db);

// total page number has to be integer
$totalPageNo = ceil($totalRecordNo / $taxa_per_page);

$smarty->assign('totalPageNo', $totalPageNo);

////////////////////////////////////////////////////////////////////////
// End of Paging Logic Section /////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

// initialise $message
$message = "";

if (isset($_POST['edit']) && isset($_POST['taxa']))
// edit selected taxa
// here is the section which shows the editing input form
{
	// initialise $where
	$where = "";

	// get list of selected taxa
	foreach($_POST['taxa'] as $id)
		// transform the list into mysql query WHERE clause
		$where .= "id=$id OR ";

	// remove the last "OR"
	$where = preg_replace("/OR $/", "", $where);

	// refresh taxa object with selected id for editing
	// $no_of_taxa is left blank, $offset set to 0
	$taxa->refresh($db, $order_by, '', 0, $where);

	// display edit input form for selected taxa
	if ($taxa->num_rows() == 0)
	{
		$message = 'The systems have a technical problem, '.
					'please call the adminstrator.';
		$smarty->assign('status', 'emptytable');
	}
	else
	{
		$smarty->assign('edit_name', $taxa->edit_name());
		$smarty->assign('f2d', $taxa->f2d_name());
		$smarty->assign('taxa', $taxa->get_result());
		$smarty->assign('status', 'edit');
	}
}
elseif (isset($_POST['delete']) && isset($_POST['taxa']))
// delete selected taxa
{
	$count = 0;				// count number of record been deleted
	$deleted = '';			// storing record id which been deleted
	$syn_ids = array ();	// all synonyms' ID of a given taxon

	foreach ($_POST['taxa'] as $id)
	{
		$id = $db->clean($id, 10);

		// check record for synonym
		if($syn_ids = $taxa->get_synonym($db, $id))
		{
			// get all the synonyms and delete them as well
			foreach ($syn_ids as $s_id)
			{
				// if delete does not have error, it will return 0
				if (!$taxa->delete($db, $s_id, $order_by, $taxa_per_page,
					$offset))
				{
					$count++;
					$deleted .= "$s_id ";
				}
			}
		}

		// else carry on delete the $id's record

		// if delete does not have error, it will return 0
		if (!$taxa->delete($db, $id, $order_by, $taxa_per_page, $offset))
		{
			$count++;
			$deleted .= "$id ";
		}
	}

	// reset id number
	$taxa->reset_id($db);

	// deleted selected taxa
//	$message = "Deleted $count record with ID: $deleted. <br />";
	if ($count > 1)
		$message = "Deleted $count records.<br />";
	else
		$message = "Deleted $count record.<br />";

	/////////////////////////////////////////////
	// calculate pageNo and offset after deletion
	/////////////////////////////////////////////

	// calculate the new totalPageNo
	$totalRecordNo = $taxa->totalRecordNo($db);
	// total page number has to be integer
	$totalPageNo = ceil($totalRecordNo / $taxa_per_page);

	// get current page number
	$pageNo = $db->clean($_POST['pageNo'], 5);
	
	// need to make sure it is an integer
	// for non-number input, $pageNo will be 0
	$pageNo = floor($pageNo);

	// $pageNo cannot be bigger than $totalPageNo
	if ($pageNo > $totalPageNo)
		$pageNo = $totalPageNo;

	// but if there is not taxa left, then pageNo will be 1
	// 1 is the lowest page number we can have
	if ($pageNo <= 0)
		$pageNo = 1;

	// set previous and next page nubmers for navigating arrows
	if ($pageNo == 1)
		$pre_page = 0; // this will dissable showing of left arrow
	else 
		$pre_page = $pageNo - 1;
	if ($pageNo == $totalPageNo)
		$next_page = 0; // this will dissable showing of right arrow
	else
		$next_page = $pageNo + 1;

	// store current previous and next page numbers in the web page
	$smarty->assign('pageNo', $pageNo);
	$smarty->assign('totalPageNo', $totalPageNo);
	$smarty->assign('pre_page', $pre_page);
	$smarty->assign('next_page', $next_page);

	// offset calculation
	$offset = $taxa_per_page * ($pageNo - 1);


	// refresh Taxa object with new paging
	$taxa->refresh($db, $order_by, $taxa_per_page, $offset);


	// display the resulting taxa list
	if ($taxa->num_rows() == 0)
	{
		$message .= 'No taxon datum in Piping Tools. ';
		$smarty->assign('status', 'emptytable');
	}
	else
	{
		$smarty->assign('taxa', $taxa->get_result());
		$smarty->assign('totalRecordNo', $taxa->totalRecordNo($db));
		$smarty->assign('status', 'display');
	}
}
elseif (isset($_POST['editSave']))
// save edited taxa
{
	// get all the info needed in this section of code
	$required_fields = $taxa->required_fields();
	$d2f_name = $taxa->d2f_name();

	$error_id = '';	// store ids which cannot write
	$saved_id = ''; // store ids which have been saved

	// process each $id one at a time
	foreach ($_POST['id'] as $id)
	{
		// get and clean taxa inputs
		// and remove any space before and after
		foreach ($taxa->edit_name() as $field => $editable)
		{
			if ($editable)
			{
				$input[$field] =
					trim(
						$db->clean(
							$_POST[$field][$id],
							$taxa->fieldSize($field)
						)
					);
				// The line below is for debugging and it lists 
				// all inputs from the input form
				// echo "$field: $input[$field] <br />";
			}
		}

		// check the required field are not empty
		$missing_required_fields = "";
		foreach ($required_fields as $field => $value)
		{
			if (empty($input[$d2f_name[$field]]))
				$missing_required_fields .= "'$field' ";
		}

		if ($missing_required_fields)
		{
			$message .= "There is no input in $missing_required_fields ";
			$message .= "for the entry with ID: $id. <br />";
		}
		else
		// if everything ok, update mysql
		{
			// the checking of user privilege of writing to this taxa
			// is carried out in the $taxa->update() method
			if ($taxa->update(
								$db,
								$id,
								$input,
								$order_by,
								$taxa_per_page,
								$offset
						)
			)
				// saved $id which cannot be saved
				$error_id .= "$id ";
			else
				// everything o.k.
				$saved_id .= "$id ";
		}

	} // ending brace: process each $id one at a time

	if (!empty($error_id))
		$message .= "You do not have privilege to edit taxa ".
					"with ID: $error_id. <br />";

	if (!empty($saved_id))
		$message .= "Saved edited record with internal ID: $saved_id. <br />";

	// after write to mysql, need to refresh taxa object properties
	$taxa->refresh($db, $order_by, $taxa_per_page, $offset);

	if ($taxa->num_rows() == 0)
	{
		$message .= 'No taxon datum in Piping Tools. ';
		$smarty->assign('status', 'emptytable');
	}
	else
	{
		$smarty->assign('taxa', $taxa->get_result());
		$smarty->assign('totalRecordNo', $taxa->totalRecordNo($db));
		$smarty->assign('status', 'display');
	}
}
else
// display taxa table
{
	if ($taxa->num_rows() == 0)
	{
		$message = 'No taxon datum in Piping Tools. ';
		$smarty->assign('status', 'emptytable');
	}
	else
	{
		$smarty->assign('taxa', $taxa->get_result());
		$smarty->assign('totalRecordNo', $taxa->totalRecordNo($db));
		$smarty->assign('status', 'display');

		if (isset($_POST['selectAll']))
			// display taxa table with all taxa selected
			$smarty->assign('allSelected', 'allSelected');
	}
}

// Pre-process the message data for security
if(isset($_GET['message']))
{
	if (isset($message))
		$message = $message . $db->clean($_GET["message"], 400);
	else
		$message = $db->clean($_GET["message"], 400);

	// remove extra slashes before single quotes
	$message = stripslashes($message);
}

if (isset($message))
	$smarty->assign('message', $message);
$smarty->assign('username', $_SESSION['username']);

// initialise menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

$smarty->assign('page_title', 'Piping Tools Uploaded Data');
$smarty->assign('template', 'taxa.tpl');

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");
?>
