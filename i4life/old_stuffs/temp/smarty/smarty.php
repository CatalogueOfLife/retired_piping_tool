<?php // smarty.php
$path = $_SERVER['DOCUMENT_ROOT'];
require "$path/Smarty/Smarty.class.php";

$smarty = new Smarty();
$smarty->template_dir = "$path/i4life/temp/smarty/templates";
$smarty->compile_dir = "$path/i4life/temp/smarty/templates_c";
$smarty->cache_dir = "$path/i4life/temp/smarty/cache";
$smarty->config_dir = "$path/i4life/temp/smarty/configs";

$smarty->assign('title', 'Test Web Page');
$smarty->display("index.tpl");
?>
