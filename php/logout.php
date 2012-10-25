<?php
// logout.php: log out of the system by ending the session and redirect to
// the main page
// $Id: logout.php,v 1.1 2011/06/01 15:38:46 kwok Exp $

session_start();
session_destroy();

// Redirect to the main page
$message = "Thank you for using this system - you have now signed out.";
header("Location: index.php?message=" . urlencode($message));
?>
