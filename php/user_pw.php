<?php
// user_pw.php is use to print out the encryted default password for a given
// username

	//$username = readline("Type in user password\n");
	echo "Type in username: ";
	$username = fgets(STDIN);
	$username = trim($username);
	echo "Type in password: ";
	$password = fgets(STDIN);
	$password = trim($password);
	echo crypt($password, substr($username, 0, 2));
	// echo crypt('admin', 'ad');
	//echo crypt($username, substr($username, 0, 2));
	echo "\n";
?>
