<?php
// admin_pw.php is use to print out the encryted default password for admin

	echo "admin:";
	echo crypt('admin', 'ad');
	echo "\n";
?>
