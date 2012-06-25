<?php
// setup.php: set up include files and smarty directories
// $Id: setup.php,v 1.1 2011/06/02 10:01:00 kwok Exp kwok $
// List of include files:
//		db.php			mysql database parameters
//		objects.php		Piping Tools objects definition

///////////////////////////////////////////////////////////////
// Server setting, the following lines need to configure for //
// server specific environment ////////////////////////////////
///////////////////////////////////////////////////////////////

// define Smarty lib directory
define ('SMARTY_DIR', '/usr/share/php/smarty3/');

// define server root directory
define ('ROOT_DIR', '/var/www/piping/php/');
//define ('ROOT_DIR', '/var/www/piping2012/php/');

// define user's base directory
define ('USER_BASE_DIR', '/var/www/piping/');
//define ('USER_BASE_DIR', '/var/www/piping2012/');

///////////////////////////////////////////////////////////////
// End of server setting for //////////////////////////////////
// server specific environment ////////////////////////////////
///////////////////////////////////////////////////////////////

// define include directory
define ('INCLUDE_DIR', ROOT_DIR . 'include/');

// load Smarty library
require_once(SMARTY_DIR . 'Smarty.class.php');

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

		// $this->template_dir	= '/var/www/i4life/templates/';
		// $this->compile_dir	= '/var/www/i4life/templates_c/';
		// $this->config_dir	= '/var/www/i4life/configs/';
		// $this->cache_dir	= '/var/www/i4life/cache/';

		$this->template_dir	= ROOT_DIR . 'templates/';
		$this->compile_dir	= ROOT_DIR . 'templates_c/';
		$this->config_dir	= ROOT_DIR . 'configs/';
		$this->cache_dir	= ROOT_DIR . 'cache/';

//		$this->caching = Smarty::CACHING_LIFETIME_CURRENT;
		$this->assign('app_name', 'Piping Tools');
	}
}
?>
