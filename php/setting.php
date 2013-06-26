<?php
// home.php: Setting page of Piping Tools
// $Id$

// load setup.php file
require_once("setup.php");

// initialise smarty object for display html template
$smarty = new Smarty_PipingTools();

// Check if the user is logged in
// (this also starts the session)
logincheck();

// Connect to the MySQL DBMS
// credentials are in the file db.php
// Notes: $db is an object of class DB, and it is NOT directly link to
// mysqli connection.
$db = new DB ($DB_hostname, $DB_username, $DB_password, $DB_databasename);

// Connect to CoL database
$CoL_db = new DB ($DB_hostname, $DB_username, $DB_password, $CoL_databasename);

// Create a Taxa object with no_of_taxa set to 1 to make it run a bit efficient
$taxa = new Taxa(
					$db,
					$_SESSION['username'],
					$_SESSION['role'],
					'',			// where
					'',			// order_by
					1,			// no_of_taxa
					''			// offset
				);

// when 'Reset Piping Tools' button is pressed and username is 'admin'
if (isset($_POST['reset_piping_tools']) && $_SESSION['username'] == 'admin')
{
	// ask user for confirmation of deleting all taxa data
	$smarty->assign('status', 'confirm_reset');
}
elseif (isset($_POST['confirm_reset']) && $_SESSION['username'] == 'admin')
{
	if ($taxa->clear_taxa_table($db))
		$message = "There is a technical problem, records cannot be clear.";
	else
		$message = "All the taxa records are deleted.";

	$smarty->assign('message', $message);

	$smarty->assign('logFile', LOG_URL);

	// go back to the setting form input page
	$smarty->assign('status', 'display');
}
elseif (isset($_POST['scheduler']) && $_SESSION['username'] == 'admin')
{
	// define URL link on the web page
//	$smarty->assign('logFile', LOG_URL);

	// set up variables used in sys call
	$log = LOG;
	$scheduler = ROOT_DIR . 'php/scheduler.php';
	`/usr/bin/php $scheduler > $log &`;

	// go back to the setting form input page
	$smarty->assign('status', 'display');
}
elseif (isset($_POST['scheduler_pmonit']) && $_SESSION['username'] == 'admin')
{
	// define URL link on the web page
//	$smarty->assign('logPMFile', LOG_PM_URL);

	// set up variables used in sys call
	$log = LOG_PM;
	$scheduler = ROOT_DIR . 'php/scheduler_pmonit.php';
	`/usr/bin/php $scheduler > $log &`;

	// go back to the setting form input page
	$smarty->assign('status', 'display');
}
elseif (isset($_POST['load_col_data']) && $_SESSION['username'] == 'admin')
{
	// some magical mysql commend suggested by Viktor!
	$query = "SET SESSION group_concat_max_len = 3048576";

	$CoL_db->query($query);


	///////////////////////////////////////////////////////////////////
	// mysql scripts generating codes for matching GSDs started here //
	///////////////////////////////////////////////////////////////////

	$taxonLevels = array('family', 'order', 'class', 'phylum', 'genus');
//	$taxonLevels = array('family', 'order', 'class', 'phylum');

	// goes through all five taxon hierarchy
	foreach ($taxonLevels as $taxonLevel)
	{
		$outputFile = MYSQLSCRIPTS . $taxonLevel . ".sql";

		// do some clean up first
		if (file_exists($outputFile))
			unlink($outputFile);

		$mysql_file_h =
				fopen($outputFile, 'w') or die ("Can't open $outputFile.");

		if ($taxonLevel != 'genus')
			$query =
				"SELECT db.database_name, ".
				// var $taxonLevel
				"GROUP_CONCAT(DISTINCT fm.$taxonLevel) ".
				// This bit copy from the origianl Viktor's script
				"FROM families fm ".
				"LEFT JOIN `databases` db ON db.record_id = fm.database_id ".
				"GROUP BY db.database_name ";
		else
			$query =
				"SELECT db.database_name, ".
				// var $taxonLevel
				"GROUP_CONCAT(DISTINCT sn.$taxonLevel) ".
				// This bit copy from the origianl Viktor's script
				"FROM scientific_names sn ".
				"LEFT JOIN `databases` db ON db.record_id = sn.database_id ".
				"WHERE sn.genus NOT LIKE '%\"%' ".
				"GROUP BY db.database_name ";

//				 "GROUP BY db.database_name ".
//				 "INTO OUTFILE '$outputFile' ".		// var $outputFile
//				 "FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n'";

		$CoL_db->query($query);

		// common mysql instruction components
	//	$txt1 = "UPDATE $DB_databasename" . '.taxa SET taxa.matched_by = "' .
	//			$taxonLevel . '", taxa.gsd_short_name = CONCAT_WS(", ", "';
		$txt1 = "UPDATE $DB_databasename" . '.taxa SET ' .
				'taxa.gsd_short_name = CONCAT_WS(", ", "';
		$txt2 = '", taxa.gsd_short_name) WHERE taxa.matched_by IS NULL AND `' .
				$taxonLevel . '` IN(';
		$txt3 = ');' . "\n";
		$txt4 = "UPDATE $DB_databasename" .
				'.taxa SET taxa.matched_by = "no match", '.
				'taxa.gsd_short_name = "Unplaced_Names" '.
				'WHERE (taxa.matched_by IS NULL) AND '.
				'(taxa.gsd_short_name IS NULL);' . "\n";
		$txt5 = "UPDATE $DB_databasename" .  '.taxa SET taxa.matched_by = "' .
				$taxonLevel . '" WHERE taxa.gsd_short_name IS NOT NULL AND '.
				'taxa.matched_by IS NULL;' . "\n";

		for($i = 0 ; $i < $CoL_db->num_rows(); $i++)
		{
			$results = $CoL_db->fetch();

			////////////////
			// database_name
			////////////////
			// replace characters
			$patterns = array();
			$replacements = array();
			$patterns[0]		= '/\s/';
			$replacements[0]	= '_';
			$patterns[1]		= '/-/';
			$replacements[1]	= '_';
			$patterns[2]		= '/\./';
			$replacements[2]	= '_';
			$patterns[3]		= '/&_/';
			$replacements[3]	= '';
			$patterns[4]		= '/\(/';
			$replacements[4]	= '';
			$patterns[5]		= '/\)/';
			$replacements[5]	= '';

			$database_name = 
				preg_replace($patterns, $replacements, $results[0]);

			/////////////////////////////
			// value of $taxonLevel lists
			/////////////////////////////
			// need to remove any empty elements
			$taxonListsUnclean = explode(',', $results[1]);

			// initialize $taxonLists
			$taxonLists = array();

			// remove any empty value and 'Not assigned'
			foreach($taxonListsUnclean as $element)
				if ( $element &&
					($element != 'Not assigned') &&
					($element != 'Not Assigned')
				)
					$taxonLists[] = $element;

			// Make sure $taxonLists is not empty
			if (count($taxonLists) > 0)
			{
				// Write out matching rule mysql script for this taxon
				fwrite($mysql_file_h, $txt1);

				fwrite($mysql_file_h, $database_name);
				fwrite($mysql_file_h, $txt2);

				// first element of the lists treated differently
				fwrite($mysql_file_h, '"' . array_shift($taxonLists) . '"');

				// rest of the list and this foreach loop should not execute if
				// there is only one element on the $taxonLists array
				foreach($taxonLists as $list)
					fwrite($mysql_file_h, ', "' . $list . '"');

				// end of the line
				fwrite($mysql_file_h, $txt3);
			}
		}

		// This two lines are taken out as we no longer assign record
		// which is unplaced as gsd_short_name:'Unplaced_Names' and
		// matched_by:'no match'.
		//if ($taxonLevel == 'genus')
			//fwrite($mysql_file_h, $txt4);

		fwrite($mysql_file_h, $txt5);

		fclose($mysql_file_h);
	}

	///////////////////////////////////////////////////////////////////
	// mysql scripts generating codes for checking record already in //
	// CoL started here ///////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////

	$speciesFile = MYSQLSCRIPTS . "in_col_species.sql";
	$infraspeciesFile = MYSQLSCRIPTS . "in_col_infraspecies.sql";

	// do some clean up first
	if (file_exists($speciesFile))
		unlink($speciesFile);
	if (file_exists($infraspeciesFile))
		unlink($infraspeciesFile);

	// species section
	$speciesFile_h =
		fopen($speciesFile, 'w') or die ("Can't open $speciesFile.");

	$query =	"SELECT sn.genus, sn.species ".
				"FROM scientific_names sn ".
				"WHERE infraspecies IS NULL AND genus IS NOT NULL AND ".
				"species NOT LIKE '%\"%' AND genus NOT LIKE '%\"%'";

	$CoL_db->query($query);

	// common mysql instruction components
	$txt1 = 'UPDATE taxa SET in_col = 1 WHERE genus = "';
	$txt2 = '" AND specificEpithet = "';
	$txt3 = '" AND in_col IS NULL;' . "\n";

	for($i = 0 ; $i < $CoL_db->num_rows(); $i++)
	{
		$results = $CoL_db->fetch();

		// ignore any empty genus and species
		if ($results['genus'] && $results['species'])
		{
			fwrite($speciesFile_h, $txt1);
			fwrite($speciesFile_h, $results['genus'] );
			fwrite($speciesFile_h, $txt2);
			fwrite($speciesFile_h, $results['species'] );
			fwrite($speciesFile_h, $txt3);
		}
	}
	fclose($speciesFile_h);

	// infraspecies section
	$infraspeciesFile_h =
		fopen($infraspeciesFile, 'w') or die ("Can't open $infraspeciesFile.");

	$query =	"SELECT sn.genus, sn.species, sn.infraspecies ".
				"FROM scientific_names sn ".
				"WHERE LENGTH(infraspecies) > 1 AND genus IS NOT NULL AND ".
				"infraspecies NOT LIKE '%\"%' AND ".
				"species NOT LIKE '%\"%' AND ".
				"genus NOT LIKE '%\"%'";

	$CoL_db->query($query);

	// common mysql instruction components
	$txt1 = 'UPDATE taxa SET in_col = 1 WHERE genus = "';
	$txt2 = '" AND specificEpithet = "';

	$txt3 = '" AND infraspecificEpithet = "';
	$txt4 = '" AND in_col IS NULL;' . "\n";

	for($i = 0 ; $i < $CoL_db->num_rows(); $i++)
	{
		$results = $CoL_db->fetch();

		// ignore any empty genus and species
		if ($results['genus'] && $results['species'])
		{
			fwrite($infraspeciesFile_h, $txt1);
			fwrite($infraspeciesFile_h, $results['genus'] );
			fwrite($infraspeciesFile_h, $txt2);
			fwrite($infraspeciesFile_h, $results['species'] );
			fwrite($infraspeciesFile_h, $txt3);
			fwrite($infraspeciesFile_h, $results['infraspecies'] );
			fwrite($infraspeciesFile_h, $txt4);
		}
	}
	fclose($infraspeciesFile_h);

	$smarty->assign('status', 'loaded_CoL_data');
}
else
{
	// when 'Cancel' button is press, it goes here as well.
	$smarty->assign('status', 'display');
}

	// need to define log files urls before page with links is display
	$smarty->assign('logFile', LOG_URL);
	$smarty->assign('logPMFile', LOG_PM_URL);

// Pre-process the message data for security
if(isset($_GET['message']))
	$message  = $db->clean($_GET["message"], 128);

if (isset($message))
	$smarty->assign('message', $message);

$smarty->assign('username', $_SESSION['username']);

// initialise menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

$smarty->assign('page_title', 'Piping Tools Settings');
$smarty->assign('template', 'setting.tpl');

// Get the name of the current script file, and have the specific page's
// Menu Links disable 
$currentPath = $_SERVER["PHP_SELF"];
$currentPath = Explode('/', $currentPath);
$currentFile = $currentPath[count($currentPath) - 1];
$smarty->assign('currentFile', $currentFile);

$smarty->display("master.tpl");

?>
