<?php
define ('INCLUDE_DIR', '/var/www/i4life/include/');
ini_set('include_path', ini_get('include_path').':'.INCLUDE_DIR.':');

require('setup.php');

$smarty = new Smarty_GuestBook();

$smarty->assign('name', 'Ned');

$smarty->display('index.tpl');
?>
