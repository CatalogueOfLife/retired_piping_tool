<?php
// db.php hold mysql credentials and logincheck() function
// $Id: db.php,v 1.1 2011/06/02 11:23:15 kwok Exp kwok $

	// These are the DBMS credentials and the database name
	$DB_hostname     = "localhost";
	$DB_username	 = "i4life";
	$DB_password	 = "i4life";
	$DB_databasename = "piping_devel";

	$CoL_databasename = "Assembly_Global_Deploy";

/*
	// Show an error and stop the script
	function showerror($connection)
	{
		// Was there an error during connection?
		if(mysqli_connect_errno())
			// Yes;  display information about the connection error
			die("Error " . mysqli_connect_errno() .
				" : " .mysqli_connect_error());
		else
			// No;  display the error information for the active connection
			die("Error " .mysqli_errno($connection) . " : "
					     .mysqli_error($connection));
	}

	// Secure the user data by escaping characters and shortening the
	// input string
	function clean($input, $maxlength)
	{
		// Access the MySQL connection from outside this function.
		global $connection;

		// Limit the length of the string
		$input = substr($input, 0, $maxlength);

		// Escape semicolons and (if magic quotes are off) single and
		// double quotes
		if(get_magic_quotes_gpc())
			$input = stripslashes($input);

		$input = mysqli_real_escape_string($connection, $input);

		return $input;
	}
*/

	// Check if the user is logged in. If not, send them to the login
	// page
	function logincheck()
	{
		session_start();

		if (empty($_SESSION["username"]))
		{
			// redirect to the login page
			header("Location: index.php");
			exit;
		}
	}
?>
