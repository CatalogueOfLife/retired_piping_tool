<?php
// index.php: User login page.
// $Id: index.php,v 1.1 2011/06/01 15:35:51 kwok Exp kwok $

// load setup.php file
require_once("setup.php");

// initialise smarty object for display html template
$smarty = new Smarty_PipingTools();
$smarty->assign('page_title', 'Piping Tools Sign In');
$smarty->assign('template', 'index.tpl');

// Check if the user is logged in, if s/he is login, send them to home.php
session_start();
if (!empty($_SESSION["username"]))
{
	header("Location: home.php");
	exit;
}

// Connect to the MySQL DBMS and use piping_tools database - 
// credentials are in the file db.php
// Notes: $db is an object of class DB, and it is NOT directly link to
// mysqli connection.
$db = new DB($DB_hostname, $DB_username, $DB_password, $DB_databasename);

// Pre-process the authentication data from the form for security
// and assign the username and password to local variables
if(count($_POST))
{
	$username = $db->clean($_POST["username"], 32);
	$password = $db->clean($_POST["password"], 32);
}

// Pre-process the message data for security
if(count($_GET))
	$message = $db->clean($_GET["message"], 128);

// If no username or password has been entered, or there's a message
// to display, show the login page
if(	empty($username) || empty($password) || isset($message) ) 
{
	if (isset($message))
		$smarty->assign('message', $message);
}
else 
{
	// Refill the $username in the form,
	// don't need to check whether $username is empty of not
	// as empty just give empty string
	$smarty->assign('username', $username);

	// Create a query to find any rows that match the provided username
	$query = "SELECT userid, username, password, role FROM user
		WHERE username = '$username'";

	// Run the query through the connection
	$db->query($query);

	// Were there any matching rows?
	if ($db->num_rows() == 0)
	{
		// Wrong user name
		$message = "Username and password do not match.";
		$smarty->assign('message', $message);
		$smarty->display("master.tpl");
		exit;
	}
	else
	{
		// Yes, so check that the supplied password is correct

		// Fetch the matching row
		// If we don't get exactly one answer, then we have a problem
		for($matchedrows=0;($tmprow = $db->fetch());$matchedrows++)
			$row=$tmprow;
		if($matchedrows!=1)
			die("We've just experienced a technical problem - ".
				"please notify the administrator.");

		// Does the user-supplied password match the password in the table?
		if (crypt($password, substr($username, 0, 2)) != $row["password"])
		{
			// No, redirect the browser to the login page with a message
			$message = "Username and password do not match.";
			$smarty->assign('message', $message);
			$smarty->display("master.tpl");
			exit;
		}
	}

	// Everything went OK. Start a session, store the username in a
	// session variable, and redirect the browser to the home
	// page with a welcome message.
	$_SESSION['username']=$username;
	$_SESSION['role']=$row["role"];
	$message = "Welcome to Piping Tools, {$_SESSION['username']}! ";

//	header("Location: home.php?message=" . urlencode($message));

	// show help page right after login
	header("Location: help.php?message=" . urlencode($message));
	exit;
} 

// this is needed at start or the page will be blank!
$smarty->display("master.tpl");
?>
