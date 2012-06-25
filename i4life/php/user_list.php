<?php
// user_list.php: Piping Tools user editing page
// $Id: user_list.php,v 1.1 2011/06/02 11:10:10 kwok Exp kwok $

// load setup.php file
require_once("setup.php");

// initialise smarty object for display html template
$smarty = new Smarty_PipingTools();

// Check if the user is logged in
// (this also starts the session)
logincheck();

// check that the user is admin, only admin can access to this page
if ($_SESSION['username'] != 'admin')
{
	// send the user back to the home page
	header("Location: home.php");
	exit;
}

// Connect to the MySQL DBMS
// credentials are in the file db.php
// Notes: $db is an object of class DB, and it is NOT directly link to
// mysqli connection.
$db = new DB ($DB_hostname, $DB_username, $DB_password, $DB_databasename);

// add new user form
if (isset($_POST['addUser']))
	// show add user input form
	$smarty->assign('status', 'adduser');
// save new user
elseif (isset($_POST['addNew']))
{
	// where the 'Save' button is press in add user input form
	// need to check all the box is filled
	if (!empty($_POST['name']) && !empty($_POST['password']))
	{
		$name = $db->clean($_POST['name'], 16);

		// remove any space before and after
		$name = trim($name);

		// check $name is not empty
		if (empty($name))
		{
			$message ="User Name is blank, please refill the form.";

			// re-display the add user input form
			$smarty->assign('status', 'adduser');
		}
		else
		{
			// initialise User object
			$user = new User($db);

			// check new name has not been used
			if ($user->is_name_exist($db, $name))
			{
				$message = "'$name' already been used, ".
						   "please use a different name.";

				// re-display the add user input form
				$smarty->assign('status', 'adduser');
			}
			else
			// then ... add new user
			{
				$password = $db->clean($_POST['password'], 32);
				$c_password = crypt($password, substr($name, 0, 2));

				// this is disable
		//		$role = $db->clean($_POST['role'], 8);
				$role = 'GBP';

				$user->insert_user($db, $name, $c_password, $role);

				// after new user been added.
				$message = "Added new user: $name";

				// display user names
				$smarty->assign('status', 'display');

				if ($user->num_rows() == 0)
					$message = 'User table has no data';
				else
					$smarty->assign('user', $user->get_result());
			}
		}
	}
	else
	{
		// ask the user to refill the form
		$message = 'Some boxes are empty, please refill the form.';
		// re-display the add user input form
		$smarty->assign('status', 'adduser');
	}
}
// edit selected users
// here is the part which show the editing input form
elseif (isset($_POST['editUser']) && isset($_POST['users']))
{
	// initialise $where to an empty string
	$where = '';

	// get list of selected users
	foreach($_POST['users'] as $userid)
		// make sure admin does not get edited
		if ($userid != 0)
			// tranform the list into mysql query where clause
			$where .= "userid=$userid OR ";

	// remove the last "OR"
	$where = preg_replace("/OR $/", "", $where);

	// initialise User object with only selected userid
	$user = new User($db, $where);


	// display edit form for selected users
	if ($user->num_rows() == 0)
	{
		$message = 'The system has a technical problem, '.
					'please call the adminstrator.';
		$smarty->assign('status', 'emptytable');
	}
	else
	{
		$smarty->assign('user', $user->get_result());
		$smarty->assign('status', 'edit');
	}
}
// save edited users
// here is where the edited users' information is being saved
elseif (isset($_POST['editSave']))
{
	// initialise User object
	$user = new User($db);

	// process each $userid one at a time
	foreach($_POST['userid'] as $userid)
	{
		// get and clean user inputs
		$userid =	$db->clean($userid, 6);
		$username =	$db->clean($_POST['username'][$userid], 16);

		// disabled this feature
	//	$role =		$db->clean($_POST['role'    ][$userid], 3);
		$role =		'GBP';

		$password =	$db->clean($_POST['password'][$userid], 32);

		// remove any space before and after
		$username = trim($username);

		// check $username is not empty
		if (empty($username))
			$message .="User ID:$userid User Name is blank.<br />";

		// check user name have not been used else where?
		elseif ($user->is_name_used_elsewhere($db, $username, $userid))
			$message .= "$username has already been used else where.<br />";
		else
		{
			// check if password going to be changed
			if (!empty($password))
			// change password
			{
				// encrypt password
				$c_password = crypt($password, substr($username, 0, 2));

				// update database
				$user->update_user($db,$userid,$username,$role,$c_password);

				$message .= "Saved edited userid: $userid.<br />";
			}
			else
			// just update database without changing password
			{
				// update database
				$user->update_user($db, $userid, $username, $role);

				//$message .= "Saved edited userid: $userid.<br />";

				// This is changed to suppress error message
				$message = "Saved edited userid: $userid.<br />";
			}
		}

		// re-display the user table
		$smarty->assign('status', 'display');

		if ($user->num_rows() == 0)
			$message = 'User table has no data';
		else
			$smarty->assign('user', $user->get_result());
	}
}
// delete selected users
elseif (isset($_POST['deleteUser']) && isset($_POST['users']))
{
	// initialise User object
	$user = new User($db);

	$count = 0;		// count number of users been deleted
	foreach($_POST['users'] as $id)
	{
		$c_id = $db->clean($id, 6);

		// if delete does not have error, it will return 0
		if (!$user->delete($db, $c_id))
			$count++;
	}

	// deleted selected users
	$message = "Deleted $count users. ";

	// display the resulting user list
	if ($user->num_rows() == 0)
	{
		$message .= 'User table has no data';
		$smarty->assign('status', 'emptytable');
	}
	else
	{
		$smarty->assign('user', $user->get_result());
		$smarty->assign('status', 'display');
	}
}
else
{
	// display usernames table
	$user = new User($db);

	if ($user->num_rows() == 0)
	{
		$message = 'User table has no data';
		$smarty->assign('status', 'emptytable');
	}
	else
	{
		$smarty->assign('user', $user->get_result());
		$smarty->assign('status', 'display');
	}
}

// Pre-process the message data for security
if(isset($_GET['message']))
	$message  = $message . $db->clean($_GET["message"], 128);

// pass mesaage to template
if (isset($message))
	$smarty->assign('message', $message);

// pass username to template
$smarty->assign('username', $_SESSION['username']);

// initialise menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

// pass title page to tempalte
$smarty->assign('page_title', 'Piping Tools User List');

// definite the specific template section
$smarty->assign('template', 'user_list.tpl');

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

// call the master template
$smarty->display("master.tpl");
?>
