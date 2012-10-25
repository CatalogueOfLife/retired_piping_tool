<?php
// dwcLib.php: contain function which use to input DwC core
// $Id$

require_once("db.php");

// inputDwCtoBuffer2(), read in taxa data file from unzipped DwC and
// put into a temporary buffer, then clean it up before move the data into
// taxa table. The DwC data structure is either define by meta.xml file or
// the header of the data file.
function inputDwCtoBuffer2(
							DB			$db,		// db base handle
							Taxa		$taxa,		// taxa table object
							UserInfo	$gbp_info,	// info of data provider
										$tag='',	// tag name, optional

										// This last parameter is mainly
										// use during importing of data
										// from X-map tools to set
										// who is the data provider
										$dataProviderID=''	// optiional
)
{
	$gbp		= $gbp_info->username;
	$taxa_file	= $gbp_info->taxa_file;
	$meta_file	= USER_BASE_DIR . $gbp . "/meta.xml";

	// full path to the input data file
	// data file name might be runtime depend and this line might need
	// to change
	$full_path = USER_BASE_DIR . $gbp . "/" . $taxa_file;

	// get starting id in taxa table
	$s_id = $taxa->next_id($db);

	// if $tag is empty, generate a default tag
	if (empty($tag))
		// use date and starting ID as $tag
		$tag = date('Y_m_d') . "SID" . $s_id;

	// initialise $fieldNames
	$fieldNames = array();

	////////////////////////////////////////////////////////////////
	// Get info about data structure, from meta.xml or data header /
	////////////////////////////////////////////////////////////////

	// Check meta file exist
	if (file_exists($meta_file))
	{
		// Open meta.xml file which define the data file format
		$metaFileObject = simplexml_load_file($meta_file);
		$core = $metaFileObject->core;
		$delimit_char = $core[fieldsTerminatedBy];
		$enclose_char = $core[fieldsEnclosedBy];
		$no_first_row = $core[ignoreHeaderLines];

		// read in all the field names
		foreach ($core->field as $field)
		{
			$fieldNames[] = basename($field[term]);
		}

		// check does it have taxonID field, if no taxonID put this
		// field at the front.
		// This line is needed as there is different between ENA
		// and GBIF/IUCN meta.xml files
		if (!in_array('taxonID', $fieldNames))
			$fieldNames = array_merge(array('taxonID'), $fieldNames);
	}
	else
	// use data file header info for DwC structure
	{
		// set all the predefined parameters
		// I hope all data providers would adhere to this
		// or we would be screwed!!!!
		$delimit_char = "\t";	// tab
		$enclose_char = "";		// none
		$no_first_row = 1;		// ignore 1st line of data file

		/////////////////////////////////////////////////////
		// process header of data file here /////////////////
		/////////////////////////////////////////////////////

		$d_file_h = fopen($full_path, 'r') or die("Can't open $full_path.");

		// remove spaces before and end of the line
		$header = trim(fgets($d_file_h));

		fclose($d_file_h);

		$fieldNames = explode($delimit_char, $header);

		// This is needed for Xmap tools, their 'id' is taxonID
		$position = array_search('id', $fieldNames);
		if ($position !== false)
			$fieldNames[$position] = 'taxonID';
	}

	// remove the buffer table if one already exist
	$query = 'DROP TABLE IF EXISTS buffer';
	$db->query($query);



	// Create temporary buffer in mysql
	$query_field = '';
	$query =	'CREATE TABLE buffer ('.
				'id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, '.
				'provider_id TINYINT(3) UNSIGNED NOT NULL, '.
				'tag VARCHAR(32) NOT NULL, ';

	foreach ($fieldNames as $field)
		$query_field .= "`" . $field . "` " .
						"VARCHAR(512) DEFAULT NULL, ";
	$query .= $query_field;
	$query .= 'PRIMARY KEY (id))';
	$db->query($query);

	// read raw data into buffer table
	$query_field = '';
	foreach ($fieldNames as $field)
		$query_field .= "`" . $field . "`,";
	// remove the last ','
	$query_field = preg_replace("/,$/", "", $query_field);

	$query = "LOAD DATA LOCAL INFILE '$full_path' ".
			 "INTO TABLE buffer FIELDS ".
			 "TERMINATED BY '$delimit_char' ".
			 "OPTIONALLY ENCLOSED BY '$enclose_char' ";

	// if ignore first row option is selected
	if ($no_first_row)
		$query .= "IGNORE 1 LINES ";

	$query .= "($query_field) ";

	// If $dataProvdierID is set, as during the import of Xmap Tools'
	// data, it would use the $dataProviderID parameter value instead
	if ($dataProviderID)
		$query .= "SET provider_id = '$dataProviderID',";
	else
		$query .= "SET provider_id = '$gbp_info->userid',";

	$query .= "tag = '$tag'";

	$db->query($query);
//echo $query;
//return;

	//////////////////////////////////////////////
	// move data from buffer table to taxa table /
	//////////////////////////////////////////////

	// create list of taxa fields and buffer fields for mysql query
	$taxa_field = '';
	$buffer_field = '';
	foreach ($taxa->fields() as $tFieldName => $tFieldValue)
	{
		$taxa_field .= "`" . $tFieldName . "`,";

		// $fieldName contain fields provided by data provider
		// we check to see if taxa table fields are provided by data provider
		// if any field is not provided, just fill it with NULL
		if (in_array($tFieldName, $fieldNames))
			switch ($tFieldValue)
			{
				case 0:
					// no need to change any character case
					$buffer_field .= "`" . $tFieldName . "`,";
					break;
				case 1:
					// change the first letter to uppper case
					$buffer_field .= "CONCAT(UCASE(LEFT(`$tFieldName`,1)),".
									 "LOWER(SUBSTRING(`$tFieldName`,2))), ";
					break;
				case -1:
					// change all letters to lower case
					$buffer_field .= "LOWER(`$tFieldName`), ";
					break;
			}
		else
			$buffer_field .= 'NULL,';
	}

	// this fields are not providered by data provider as they are generated
	// by Piping Tools so it need to add by hardwiring.
	// we set the history_status to initial value of '1'
	$taxa_field .= "`provider_id`,`tag`,`history_status`";
	$buffer_field .= "`provider_id`,`tag`,1";

	// create query to transfer data from buffer to taxa table
	$query  = "INSERT INTO taxa (" . $taxa_field . ") ";
	$query .= "SELECT " . $buffer_field . " FROM buffer ";
	$query .= $gbp_info->mysql_where;	// put in the condition clause
	$query .= "ON DUPLICATE KEY UPDATE " .
			  "`history_status`=`history_status`+1,".
			  "`history_comments`=`history_comments`,".
			  "`gsd_comments`=`gsd_comments`,".
			  "`gsd_short_name`=`gsd_short_name`,".
			  "`gsd_status`=`gsd_status`,".
			  "`in_col`=`in_col`";
//echo $query;
	$db->query($query);

/*
	// generate mysql query field input
	$query_field = '';
	foreach ($gbp_info->inputField as $field)
		$query_field .= "`" . $field . "`,";
	// remove the last ','
	$query_field = preg_replace("/,$/", "", $query_field);

	// set up some hard-coded option and will change to runtime dependent in
	// later days

	// set up other uploading options

	//$delimit_char = "\t";
	switch ($gbp_info->delimitor)
	{
		case "comma"		: $delimit_char = ",";
			break;
		case "semicolon"	: $delimit_char = ";";
			break;
		case "tab"			: $delimit_char = "\t";
			break;
		case "space"		: $delimit_char = " ";
			break;
	}

	//$enclose_char = "";
	switch ($gbp_info->enclose_by)
	{
		case "d_quote"		: $enclose_char = '"';
			break;
		case "s_quote"		: $enclose_char = "\'";
			break;
		case "none"			: $enclose_char = "";
			break;
	}

	// clear user buffer table first
	// if don't clear it first, all the previous record would import
	// into taxa table.
	$query = "TRUNCATE TABLE $gbp";
	$db->query($query);

	// mysql query command to uploading input buffer
	$query = "LOAD DATA LOCAL INFILE '$full_path' ".
			 "INTO TABLE $gbp FIELDS ".
			 "TERMINATED BY '$delimit_char' ".
			 "OPTIONALLY ENCLOSED BY '$enclose_char' ";

	// if ignore first row option is selected
	if ($gbp_info->no_first_row)
		$query .= "IGNORE 1 LINES ";

	$query .= "($query_field) ";
	$query .= "SET provider_id = '$gbp_info->userid',";
	$query .= "tag = '$tag'";

	$db->query($query);

	//////////////////////////////////////////////////////
	// Transformation section, from buffer to taxa table /
	//////////////////////////////////////////////////////

	$query = $gbp_info->mysql_script;
	$db->query($query);

	// The above two lines have been changed so now it can
	// have multiple queries. Note queries are separated
	// by ';'.
	$queries = explode(';', $gbp_info->mysql_script);
	foreach ($queries as $query)
	{
		$db->query($query);
	}
*/
}
?>
