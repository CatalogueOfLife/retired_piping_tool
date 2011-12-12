<?php
// setup.php: set up include files and smarty directories
// $Id: setup.php,v 1.1 2011/06/02 10:01:00 kwok Exp $
// List of include files:
//		db.php			mysql database parameters
//		objects.php		Piping Tools objects definition

// define Smarty lib directory
define ('SMARTY_DIR', '/usr/local/lib/Smarty/libs/');

// load Smarty library
require_once(SMARTY_DIR . 'Smarty.class.php');

// define server root directory
define ('ROOT_DIR', '/var/www/i4life/');

// define include directory
define ('INCLUDE_DIR', ROOT_DIR . 'include/');

// initialise the include directory path
ini_set('include_path', ini_get('include_path').':'.INCLUDE_DIR.':');

// load database parameters and related functions
require_once("db.php");

// load objects definitions
require_once("objects.php");

// Set up Smarty directory for Piping Tools
class Smarty_PipingTools extends Smarty {

	function Smarty_PipingTools()
	{
		parent::__construct();

		$this->template_dir	= '/var/www/i4life/templates/';
		$this->compile_dir	= '/var/www/i4life/templates_c/';
		$this->config_dir	= '/var/www/i4life/configs/';
		$this->cache_dir	= '/var/www/i4life/cache/';

//		$this->caching = Smarty::CACHING_LIFETIME_CURRENT;
		$this->assign('app_name', 'Piping Tools');
	}
}
?>
