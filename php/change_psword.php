<?php
// chnage_psword.php: Piping Tools change password page
// $Id: change_psword.php,v 1.1 2011/06/01 14:26:43 kwok Exp kwok $

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

// Pre-process the message date for security
if (isset($_GET['message']))
	$message = $db->clean($_GEET["message"], 128);
else
	$message = "";

$smarty->assign('username', $_SESSION['username']);

// initialise menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

// set up page title and unique template
$smarty->assign('page_title', 'Piping Tools Change Password');
$smarty->assign('template', 'change_psword.tpl');

// Pre-process data from the form and assign o_psword, n_psword
// and c_psword to local variables
if(count($_POST))
{
	$o_psword = $db->clean($_POST["o_psword"], 32);
	$n_psword = $db->clean($_POST["n_psword"], 32);
	$c_psword = $db->clean($_POST["c_psword"], 32);
//echo "o: $o_psword, n: $n_psword, c: $c_psword";

	// Check $o_psword, $n_psword and $c_psword is not empty
	if(empty($o_psword) || empty($n_psword) || empty($c_psword))
	{
		$message .= "Some of the boxes are empty, please fill in the form".
					" and submit again";
	}
	else
	{
		// Check old password is correct
		$query = "SELECT password FROM user
				WHERE username='{$_SESSION["username"]}'";

		$db->query($query);

		// if there is no password in the user table
		if ($db->num_rows() == 0)
			die("We've just experience a technical problem - ".
				"please notify the adminstrator.");
			
		// or if there is more then one entry for password
		// from the user table
		for ($matchedrows=0; ($tmprow=$db->fetch()); $matchedrows++)
			$row = $tmprow;
		if($matchedrows!=1)
			die("We've just experience a technical problem - ".
				"please notify the adminstrator.");

		// Does the old password match the passord in the table?
		if (crypt($o_psword, substr($_SESSION["username"], 0, 2)) !=
		$row["password"])
			$message = "Old password does not match, please type in
						the correct old password.";
		else
		{
			if($n_psword == $o_psword)
				$message = "Your new password is the same as the old one,
					please type in a new password.";
			else
			{
				if($n_psword != $c_psword)
					$message = "The new password and the confirm password do
						not match, please try again.";
				else
				{
					if(strlen($n_psword) < 6)
						$message = "Please choose a new password that are
							at least six characters long.";
					else
					{
						// change password here
						$query =
						"UPDATE user SET password = '".
						crypt($n_psword,substr($_SESSION["username"],0,2)).
						"' WHERE username = '{$_SESSION["username"]}'";

						$db->query($query);
						$status_message = "Yours password has channged.";
					}
				}
			}
		}
	}
}

if (isset($message))
	$smarty->assign('message', $message);

if (isset($status_message))
	$smarty->assign('status_message', $status_message);

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");
?>
