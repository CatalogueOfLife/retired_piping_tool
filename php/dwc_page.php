<?php
// dwc_page.php: DwC Uploading page of Piping Tools
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


// log file
$log = LOG_DWC;
$dwc = ROOT_DIR . 'php/dwc.php';

// when 'Reset Piping Tools' button is pressed and username is 'admin'
if (isset($_POST['cbol']) && $_SESSION['username'] == 'admin')
{
	`/usr/bin/php $dwc CBOL > $log &`;
	$smarty->assign('status', 'display');
}
elseif (isset($_POST['ena']) && $_SESSION['username'] == 'admin')
{
	`/usr/bin/php $dwc ENA > $log &`;
	$smarty->assign('status', 'display');
}
elseif (isset($_POST['gbif']) && $_SESSION['username'] == 'admin')
{
	`/usr/bin/php $dwc GBIF > $log &`;
	$smarty->assign('status', 'display');
}
elseif (isset($_POST['iucn']) && $_SESSION['username'] == 'admin')
{
	`/usr/bin/php $dwc IUCN > $log &`;
	$smarty->assign('status', 'display');
}
elseif (isset($_POST['eol']) && $_SESSION['username'] == 'admin')
{
	// at the moment EoL is not supported
	$smarty->assign('status', 'display');
}
else
	// when 'Cancel' button is press, it goes here as well.
	$smarty->assign('status', 'display');

// Pre-process the message data for security
if(isset($_GET['message']))
	$message  = $db->clean($_GET["message"], 128);

$smarty->assign('logFile', LOG_DWC_URL);

if (isset($message))
	$smarty->assign('message', $message);

$smarty->assign('username', $_SESSION['username']);

// initialise menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

$smarty->assign('page_title', 'Piping Tools DwC-A Uploading');
$smarty->assign('template', 'dwc.tpl');

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");
?>
