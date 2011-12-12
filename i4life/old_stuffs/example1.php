<?php
define ('SMARTY_DIR', '/usr/local/lib/Smarty/libs/');

require_once(SMARTY_DIR . 'Smarty.class.php');

$smarty = new Smarty();

$smarty->template_dir	= '/var/www/i4life/templates/';
$smarty->compile_dir	= '/var/www/i4life/templates_c/';
$smarty->config_dir		= '/var/www/i4life/configs/';
$smarty->cache_dir		= '/var/www/i4life/cache/';

$smarty->assign('name', 'Ned');

$smarty->debugging = ture;

$smarty->display('index.tpl');
?>
