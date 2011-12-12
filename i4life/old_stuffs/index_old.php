<?php
	// index.php: User login page.

	// Include database parameters and related functions
	require_once("db.php");

	// Include objects' definitions
	require_once("objects.php");

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

//	if(!($connection= @ mysqli_connect(
//		$DB_hostname, $DB_username, $DB_password, $DB_databasename)))
//		showerror($connection);

	// Pre-process the authentication data from the form for security
	// and assign the username and password to local variables
	if(count($_POST))
	{
//		$username = clean($_POST["username"], 32);
//		$password = clean($_POST["password"], 32);

		$username = $db->clean($_POST["username"], 32);
		$password = $db->clean($_POST["password"], 32);
	}

	// Pre-process the message data for security
	if(count($_GET))
	{
//		$message  = clean($_GET["message"], 128);
		$message = $db->clean($_GET["message"], 128);
	}

	// If no username or password has been entered, or there's a message
	// to display, show the login page
	if(	empty($username) ||
		empty($password) ||
		isset($message) ) 
	{
		?>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" 
			"http://www.w3.org/TR/html4/loose.dtd">
		<html>
			<head>
				<title>Piping Tools</title>
    			<LINK href="style.css" rel="stylesheet" type="text/css">
<!--
				<base href="http://salx9.rdg.ac.uk/i4life/" />
-->
			</head>
			<body>
				<h1 style="text-align:center">Piping Tools</h1>
				<hr/>
				<?php
					// If an error message is stored, show it...
					if (isset($message))
						echo "<h3><font color=\"red\">{$message}</font></h3>";
				?>
					<form action="<?php echo $_SERVER["PHP_SELF"];?>" method="POST">
					<table>
					<tr>
						<td> Username: </td>
						<td> <input type="text" name="username"
								value="<?php if(isset($_POST['username']))
												echo $_POST['username'];?>" />
						</td>
					</tr>
					<tr>
						<td> Password: </td>
						<td> <input type="password" name="password" /> </td>
					</tr>
					</table>
					<br /><input type="submit" value="Sign In"> 
				</form>
				<br />
			<?php require "disclaimer"; ?>
			<br />
			<hr />
<!--
			<a href="http://salx9.rdg.ac.uk/i4life">
-->
			<a href=".">
			<img src="pics/i4life_logo_sm.jpg"
				BORDER=0 alt="i4life Logo" />
			</a>
			<p style="font-size:50%"> \$Id$ </p>
			</body>
		</html>
		<?php
	}
	else 
	{
		// Create a query to find any rows that match the provided username
		$query = "SELECT userid, username, password, role FROM user
			WHERE username = '$username'";

		// Run the query through the connection
//		if (($result = @ mysqli_query($connection, $query))==FALSE)
//			showerror($connection);
		$db->query($query);

		// Were there any matching rows?
//		if (mysqli_num_rows($result) == 0)
		if ($db->num_rows() == 0)
		{
			// Wrong user name
			$message = "Username and password do not match.";
			header("Location: index.php?message=" . urlencode($message));
			exit;
		}
		else
		{
			// Yes, so check that the supplied password is correct
			
			// Fetch the matching row
			// If we don't get exactly one answer, then we have a problem
//			for($matchedrows=0;($tmprow = @ mysqli_fetch_array($result));$matchedrows++)
			for($matchedrows=0;($tmprow =  $db->fetch());$matchedrows++)
				$row=$tmprow;
			if($matchedrows!=1)
				die("We've just experienced a technical problem - ".
					"please notify the administrator.");

			// Does the user-supplied password match the password in the table?
			if (crypt($password, substr($username, 0, 2)) != $row["password"])
			{
				// No, so redirect the browser to the login page with a
				// message
				$message = "Username and password do not match.";
				header("Location: index.php?message=" . urlencode($message));
				exit;
			}
		}

		// Everything went OK. Start a session, store the username in a
		// session variable, and redirect the browser to the home
		// page with a welcome message.
//		session_start();	// This is not need, session already started!
		$_SESSION['username']=$username;
		$_SESSION['role']=$row["role"];
		$message = "Welcome to the myProbes Database, {$_SESSION['username']}! ";
		header("Location: home.php?message=" . urlencode($message));
		exit;
	} 
?>
