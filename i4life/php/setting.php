<?php
// home.php: Setting page of Piping Tools
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
if (isset($_POST['reset_piping_tools']) && $_SESSION['username'] == 'admin')
{
	// ask user for confirmation of deleting all taxa data
	$smarty->assign('status', 'confirm_reset');
}
elseif (isset($_POST['confirm_reset']) && $_SESSION['username'] == 'admin')
{
	if ($taxa->clear_taxa_table($db))
		$message = "There is a technical problem, records cannot be clear.";
	else
		$message = "All the taxa records are deleted.";

	$smarty->assign('message', $message);

	// go back to the setting form input page
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

$smarty->assign('page_title', 'Piping Tools Setting Page');
$smarty->assign('template', 'setting.tpl');

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");

?>
