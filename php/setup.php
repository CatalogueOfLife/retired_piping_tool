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
define ('SMARTY_DIR', '/usr/local/lib/php/Smarty/');

// define server root directory
define ('ROOT_DIR', '/var/www/piping_devel/php/');

// define user's base directory
define ('USER_BASE_DIR', '/var/www/piping_devel/');

// define mysqlScripts directory which store automatic generated
// scripts for piping
define ('MYSQLSCRIPTS', '/var/www/piping_devel/php/mysql/');

// define GSD webservice directory
define ('GSD_WEB', '/var/www/piping_devel/webservice/gsd/');

// define GSD prototype directory
define ('GSD_WEB_PROTO', '/var/www/piping_devel/shell/skel/new_gsd/');

// define GBP webservice directory
define ('GBP_WEB', '/var/www/piping_devel/webservice/gbp/');

// define GBP prototype directory
define ('GBP_WEB_PROTO', '/var/www/piping_devel/shell/skel/new_gbp/');

// define RSS webservice directory
define ('RSS_WEB', '/var/www/piping_devel/webservice/rss/');

// define scheduler debug file and path
define ('DEBUG', '/var/www/piping_devel/php/debug/debug.txt');

// define scheduler log file and path
define ('LOG', '/var/www/piping_devel/php/log/scheduler.log');

// define scheduler log file URL.
define ('LOG_URL', '/piping_devel/log/scheduler.log');

// define scheduler_pmonit debug file and path
define ('DEBUG_PM', '/var/www/piping_devel/php/debug/debug_pm.txt');

// define scheduler_pmonit log file and path
define ('LOG_PM', '/var/www/piping_devel/php/log/scheduler_pm.log');

// define scheduler_pmonit log file URL.
define ('LOG_PM_URL', '/piping_devel/log/scheduler_pm.log');

// define dwc log file and path
define ('LOG_DWC', '/var/www/piping_devel/php/log/dwc.log');

// define dwc loading log file URL.
define ('LOG_DWC_URL', '/piping_devel/log/dwc.log');

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

		// The following four lines is old setup for Smarty-3.0.7
//		$this->template_dir	= ROOT_DIR . 'templates/';
//		$this->compile_dir	= ROOT_DIR . 'templates_c/';
//		$this->config_dir	= ROOT_DIR . 'configs/';
//		$this->cache_dir	= ROOT_DIR . 'cache/';

		// The following two lines would not work, as
		// /var/www/i4life is a soft link, this seem to cause problem
//		$this->setTemplateDir(ROOT_DIR . 'templates/');
//		$this->setTemplateDir('/var/www/i4life/templates/');

		// This line would work.
//		$this->setTemplateDir('/home/kwok/works/i4life/templates/');

		$this->setTemplateDir('./templates/');
		$this->setCompileDir('./templates_c/');
		$this->setConfigDir('./configs/');
		$this->setCacheDir('./cache/');

		// no caching
//		$this->caching = Smarty::CACHING_LIFETIME_CURRENT;

		$this->assign('app_name', 'Piping Tools');
	}
}
?>
