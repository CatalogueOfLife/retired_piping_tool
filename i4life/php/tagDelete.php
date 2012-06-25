<?php
// tagDelete.php: Page for batch deleting tagged records
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

// Set sorting order of records in taxa records
if ($_SESSION['username'] == 'admin')
	$order_by = 'provider_id, tag';
else
	$order_by = 'tag';

// Create a Taxa object with no_of_taxa set to 1 to make it run a bit efficient
$taxa = new Taxa(
					$db,
					$_SESSION['username'],
					$_SESSION['role'],
					'',			// where
					'', 		// order_by
					1,			// no_of_taxa
					''			// offset
				);

// when 'Delete Selected Tag' button is pressed
if (isset($_POST['delete']) && isset($_POST['tags']))
{
	$deleted_records_total = 0;		// store running total of deleted records

	foreach($_POST['tags'] as $tag_n_providerID)
	{
		// clean the input first, it is 41 chars long because
		// 32 chars for tag name, 5 chars for provider_id and 4 for separator
		$tag_n_providerID = $db->clean($tag_n_providerID, 41);

		// '#*^@' separates tag and provider_id
		$tag_n_providerID = explode('#*^@', $tag_n_providerID);

		$tag			= $tag_n_providerID[0];
		$provider_id	= $tag_n_providerID[1];

		$deleted_records_total +=
			$taxa->delete_tagged_records($db, $tag, $provider_id);
	}
	$message = "Deleted $deleted_records_total records.<br />";
}

// display tags list
	$tags = $taxa->tags($db);

	if (empty($tags))
	{
		$smarty->assign('status', 'emptytable');
		if (isset($message))
			$message = $message . "No taxon datum in Piping Tools.";
		else
			$message = "No taxon datum in Piping Tools.";
	}
	else
	{
		$smarty->assign('status', 'display');
		$smarty->assign('tags', $tags);
	}

// Pre-process the message data for security
if(isset($_GET['message']))
{
	if (isset($message))
		$message  = $message . $db->clean($_GET["message"], 400);
	else
		$message  = $db->clean($_GET["message"], 400);

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

$smarty->assign('page_title', 'Piping Tools Delete Tagged Data');
$smarty->assign('template', 'tagDelete.tpl');

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");

?>
