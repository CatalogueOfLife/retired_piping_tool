<?php
define ('SMARTY_DIR', '/usr/local/lib/Smarty/libs/');

// load Smarty library
require(SMARTY_DIR . 'Smarty.class.php');

class Smarty_GuestBook extends Smarty {

	function Smarty_GuestBook()
	{
		parent::__construct();

		$this->template_dir	= '/var/www/i4life/templates/';
		$this->compile_dir	= '/var/www/i4life/templates_c/';
		$this->config_dir	= '/var/www/i4life/configs/';
		$this->cache_dir	= '/var/www/i4life/cache/';

		$this->caching = Smarty::CACHING_LIFETIME_CURRENT;
		$this->assign('app_name', 'Guest Book');
	}
}
?>
