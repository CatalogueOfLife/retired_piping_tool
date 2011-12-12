<?php
// server_files.php: Piping Tools server files loading page
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

// Pre-process the message data for security
if(isset($_GET['message']))
	$message  = $db->clean($_GET["message"], 128);

$smarty->assign('message', $message);
$smarty->assign('username', $_SESSION['username']);

// initialise menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

$smarty->assign('page_title', 'Piping Tools Server Files Page');

// put code in here

foreach (new DirectoryIterator('/var/tmp') as $file)
{
	$fullpath = $file->getPathname();
	if (is_file($fullpath))
	{
		$basename = basename($fullpath);
		$files[$basename] = $fullpath;
		$filenames[] = $basename;
	}
}

sort($filenames, SORT_STRING);

$smarty->assign('filenames', $filenames);
$smarty->assign('files',$files);


$smarty->assign('template', 'server_files.tpl');
$smarty->display("master.tpl");

?>
