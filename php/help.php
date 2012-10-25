<?php
// help.php: Help page of Piping Tools
// $Id$

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


//////////////////////////////////////////////////////////////////////////
// At the moment this page just a dummy page. Later in the project, this
// page will display useful status information for each user. i.e. summary
// of changes of their input data for data provider, number of newly
// assign taxa for GSD and some useful summary highlight for admin etc.
//////////////////////////////////////////////////////////////////////////


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

$smarty->assign('page_title', 'Piping Tools Help');
$smarty->assign('template', 'help.tpl');

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");

?>
