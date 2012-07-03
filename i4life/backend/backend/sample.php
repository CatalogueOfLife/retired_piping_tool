<html>
<head>
<title>CoL checklist harvester</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<img src = 'harvest/images/top_banner.jpg'>
<h1>Catalogue of Life Checklist Harvester</h1><hr>
<?php
ini_set('display_errors', 'On');     #errors to screen while debugging
set_time_limit(0); #prevents scipt from timing out
ini_set("memory_limit","265M"); #making sure there is enough memory
date_default_timezone_set('Europe/London');
alwaysFlush(); #flushes when necessary


#Specify database connection string here
$db = dbConnect("localhost", "root", "fourdforl", "phpharvester");
#Choose exposed directory
$exposed_dir = "/var/www/html/exposed/";
#$exposed_dir = "C:/htdocs/exposed/";
#$exposed_dir = "C:/xampp/htdocs/exposed/";
#--------------------------------------------------------------
if (isset($_GET['wrapper'])) {
$wrapperid=$_GET['wrapper'];
}
else {
$wrapperid=0;
}

print create_ui_menu($wrapperid);


#Checking if to continue with harvesting or do something else
if (!(isset($_GET['wrapper']) && isset($_GET['batch_size']) && $_GET['batch_size']>0 && isset($_GET['start_at'])))
  {
    print "<p>This script will attempt to harvest selected wrapper if both the <b>wrapper is selected</b> and both <b>batch size</b> and <b>start at</b> are specified.</p>";
    
    if (isset($_GET['initiate'])) {
    print create_ui_Form();
  }
 
  #Reseting cache
  if (isset($_GET['deltab'])) {
  print totalCleanUp()."Cache database has been reset.\n";
  }
  
  #Exposing harvested data set
  if (isset($_GET['expose'])) {
  print expose($exposed_dir, get_sectorname_by_wrapper_id($wrapperid))."\nDataset has been <a href = '../exposed/' target = '_blank'>exposed</a>";
  }

 #Displaying harvested data
  if (isset($_GET['datadisplay'])) {

  print "\nDATA DISPLAY";
  print " of data from ".get_sectorname_by_wrapper_id($wrapperid).":<br/>\n";
  print "<table><tr><td valign = 'top'>";
  print create_ui_TaxaList(0, 100, $wrapperid);
  print "</td><td valign = 'top'>";
  if (isset($_GET['taxaselected'])) {
    print "\n<b>Identifier from GSD:</b> ".$_GET['taxaselected'].get_stddata_by_identifier($_GET['taxaselected'],$wrapperid);       
     }  
  }

#Displaying list of wrappers and GSDs  
  if (isset($_GET['editsectors'])) {
 
  print "<table><tr><td valign = 'top'>";
  print create_ui_SectorsTable(0, 100);
  print "</td><td valign = 'top'>";
  if (isset($_GET['taxaselected'])) {
    print "\n<b>Identifier from GSD:</b> ".$_GET['taxaselected'].get_stddata_by_identifier($_GET['taxaselected']);       
     }  
  }

#Editing list of wrappers  
  if (isset($_GET['wrapper_id'])) {
    
  if (isset($_GET['remove']))
  {
    update_list_of_wrappers($_GET['wrapper_id'], 0, 0, 0, 0, $_GET['remove']);
  }  else {
    update_list_of_wrappers($_GET['wrapper_id'], $_GET['attachment_taxa_name'], $_GET['attachment_taxa_level'], $_GET['wrapper_url'], 0, 0);
  }
  print "<table><tr><td valign = 'top'>";
  print create_ui_SectorsTable(0, 100);
 print "</td><td valign = 'top'>";  
  if (isset($_GET['taxaselected'])) {
    print "\n<b>Identifier from GSD:</b> ".$_GET['taxaselected'].get_stddata_by_identifier($_GET['taxaselected']);       
     } 
  }
  
 #Adding new wrapper for an existing GSD
  if (isset($_GET['select_gsds'])) {  
  update_list_of_wrappers(0, $_GET['attachment_taxa_name'], $_GET['attachment_taxa_level'], $_GET['wrapper_url'], $_GET['select_gsds'], 0);  
  print "<table><tr><td valign = 'top'>";
  print create_ui_SectorsTable(0, 100);
  print "</td><td valign = 'top'>";  
  if (isset($_GET['taxaselected'])) {
    print "\n<b>Identifier from GSD:</b> ".$_GET['taxaselected'].get_stddata_by_identifier($_GET['taxaselected']);       
     } 
  } 

  #Editing list of GSDs 
  if (isset($_GET['gsd_id'])) {    
    if (isset($_GET['remove']))  {
    print update_list_of_gsds($_GET['gsd_id'], 0, 0, 0, 0, $_GET['remove']);
    }  else {  
    print update_list_of_gsds($_GET['gsd_id'], $_GET['gsd_short_name'], $_GET['gsd_long_name'], 'NULL', $_GET['notes'], 0);
    }
  print "<table><tr><td valign = 'top'>";
  print create_ui_SectorsTable(0, 100);
  print "</td><td valign = 'top'>";  
  if (isset($_GET['taxaselected'])) {
    print "\n<b>Identifier from GSD:</b> ".$_GET['taxaselected'].get_stddata_by_identifier($_GET['taxaselected']);       
     } 
  }
  
  #Adding new GSD
  if (isset($_GET['add_gsd'])) {  
  print update_list_of_gsds(0, $_GET['gsd_short_name'], $_GET['gsd_long_name'], 'NULL', $_GET['notes'], 0);  
  print "<table><tr><td valign = 'top'>";
  print create_ui_SectorsTable(0, 100);
  print "</td><td valign = 'top'>";  
  if (isset($_GET['taxaselected'])) {
    print "\n<b>Identifier from GSD:</b> ".$_GET['taxaselected'].get_stddata_by_identifier($_GET['taxaselected']);       
     } 
  }
  print "</td></tr></table>";
  #print create_ui_Form();	
	print "</body></html>";
	} else {#HARVESTING INITIATED
  print create_ui_Form();
  print "<br/>\nHarvesting initiated for ".get_sectorname_by_wrapper_id($_GET['wrapper'])."<br/>\n";
  print "<div name = 'form_output' id = 'form_output'>\n";
  do_spice_harvesting();
  
  }
        
mysql_close($link);

?>

</body>
</html>

<?php
############################    FUNCTIONS    ##################
function do_spice_harvesting() {

#Defining place to download XML pieces next to the script
        $xml_store =  getcwd()."/stored.xml";
        #Adjusting if in case script is executed on MS Windows
        $xml_store = "'".strtr($xml_store, '\\' , '/')."'";        
        
        # CLEANING UP - preparing space for data to be harvested       
        cleanUp();                       
              
        # EXECUTING TYPE 0 REQUEST
        # If this request fails we assume that wrapper is faulty and stop harvesting
        print "<hr /><b>Sending type 0 request to wrapper:</b><br />\n"; 
        print "<pre>";
        exec_type0request(get_url_by_wrapper_id($_GET['wrapper']), $xml_store);
        print "</pre>";        
        
        # EXECUTING TYPE 3 REQUEST
        # If this request fails we assume that wrapper is faulty and stop harvesting
        print "<hr /><b>Sending type 3 request to wrapper:</b><br />\n"; 
        print "<pre>";
        exec_type3request(get_url_by_wrapper_id($_GET['wrapper']), $xml_store);
        print "</pre>";         
        
        # EXECUTING TYPE 1 REQUEST
        # here we harvest batches of species Names with Identifiers. 
        #The identifiers will be used later on to create type 2 (standard dataset) 
        #and 4/5 (traversing hierarchy up and down) requests
        print "<hr /><b>Sending type 1 requests to wrapper:</b><br />\n"; 
        print "<pre>";
        exec_type1request(get_url_by_wrapper_id($_GET['wrapper']), get_gsdid_by_wrapper_id($_GET['wrapper']), $xml_store);
        print "</pre>";
        
        # EXECUTING TYPE 2 REQUEST
        # harvests standard dataset for each species name for each Identifier collected
        # using the previous type 1 requests this part should actually update 3 tables
        # in the cache database             
        print "<hr /><b>Sending type 2 requests to wrapper:</b><br />\n"; 
        print "<pre>";
        exec_type2request(get_url_by_wrapper_id($_GET['wrapper']), $xml_store);
        print "</pre>"; 
        
        # EXECUTING TYPE 4 REQUEST
        # harvests taxonomy for each Identifier collected
        # using the previous type 1 requests and traversing the tree from the roots up         
        print "<hr /><b>Sending type 4 requests to wrapper:</b><br />\n"; 
        print "<pre>";
        exec_type4request(get_url_by_wrapper_id($_GET['wrapper']), get_gsdid_by_wrapper_id($_GET['wrapper']), $xml_store);
        print "</pre>";
        
        # EXECUTING TYPE 5 REQUEST
        # harvests taxonomy for each Identifier collected
        # using the previous type 1 requests and traversing the tree from the top down         
       # print "<hr /><b>Sending type 5 requests to wrapper:</b><br />\n"; 
        print "<pre>";
        exec_type5request(get_url_by_wrapper_id($_GET['wrapper']), get_gsdid_by_wrapper_id($_GET['wrapper']), $xml_store);
        print "</pre>";
        
print "<hr />Harvesting of ".$_GET['amount_rec']." taxons in batches of ".$_GET['batch_size']." records starting at id ".$_GET['start_at']." from ".get_sectorname_by_wrapper_id($_GET['wrapper'])." complete </div>";
}

function exec_type0request($url, $xml_store) {

        $http_request = $url."requesttype=0";
        print "<a href ='".$http_request."' target = '_blank'>".$http_request."</a><br />\n";
        
        print fsaveXML($http_request);
        
        $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE type0_tmp
                ROWS IDENTIFIED BY '<XMLRESPONSE>'";
            
        $type0Result = floadIntoDB($SQL);
        
        #checking if error occured and exits upon error
        if (strpos(strtolower($type0Result),"error")) {
         exit($type0Result." - stopping execution...");
        } else {
                print $type0Result;
              }
        #end error check
        return true;
}

function exec_type1request($url, $gsdID, $xml_store) {
global $type1TaxonCount;

        $parsed_xml_out = '';
        $node_value = '';
        $start_at = $_GET['start_at'];
        $batch_size = $_GET['batch_size'];
        
        
        
        if (isset($_GET['amount_rec'])) {
        $amount_rec =  $_GET['amount_rec'];
        } else {
        $amount_rec = $batch_size;
        }
        
        $sqlcount = 'SELECT COUNT(*)	FROM `type1cache_copy`';
        $type1RecordCount = 0;
        $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE type1cache_copy
                ROWS IDENTIFIED BY '<SPECIESNAME>'";
                        
        $total_rec = $start_at + $amount_rec;
        $batchCounted =0;
        
        for ($start_at = $start_at; $start_at<$total_rec; $start_at+=$batch_size)
        {
          $http_request = $url."requesttype=1&searchname=*&skip=".$start_at."&limit=".$batch_size;
        
          $batchCounted += $batch_size;
          print "\n".$http_request.": ".$batchCounted."/".$amount_rec."[".round($batchCounted/$amount_rec*100)."%]".fsaveXML($http_request);
          $type1Result = floadIntoDB($SQL);
          
          $prevcount = $type1RecordCount;
          $countresult = mysql_query($sqlcount) or die ('Invalid query: ' . mysql_error());
	        $countresultarr = mysql_fetch_row($countresult);
	        $type1RecordCount = $countresultarr[0];
	        mysql_free_result($countresult);
	        if ($prevcount == $type1RecordCount) {
	        print "<br>No more taxa to harvest in the source database, stopping at ".$type1RecordCount."<br/>" ;
          break;
          }
        }        
        
        $updateIDSQL  = 'UPDATE `type1cache_copy` SET `GSDID` ="'.$gsdID.'" WHERE `GSDID` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error());
	  
	      $sqlcount = 'SELECT COUNT(DISTINCT IDENTIFIER)	FROM `type1cache_copy`';
    
	      $countresult = mysql_query($sqlcount) or die ('Invalid query: ' . mysql_error());
	      $countresultarr = mysql_fetch_row($countresult);
	      $type1TaxonCount = $countresultarr[0];
	      mysql_free_result($countresult);
    		 
        print "\nNumber of records fetched: ".$type1RecordCount." for ".$type1TaxonCount." distinct taxon.\n";    
}



function exec_type2request($url, $xml_store) {
global $type1TaxonCount;
$progressCount = 0;		
		$sql = 'SELECT DISTINCT `IDENTIFIER`	FROM `type1cache_copy` t';
    
	  $sqlresult = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
	  
    while ($taxonID = mysql_fetch_row($sqlresult)) 
    {
          $http_request = $url."requesttype=2&taxonid=".$taxonID[0];
          print "\n".$http_request." ".fsaveXML($http_request);
          #print "\ntaxon id:".$taxonID[0].fsaveXML($http_request);
        
          #print "Updating Standarddata<br />\n";
        $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE standarddata_copy
                ROWS IDENTIFIED BY '<STANDARDDATA>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `standarddata_copy` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error());
        
        
          #print "Updating avcnameswithrefs<br />\n";
        $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE avcnameswithrefs_copy
                ROWS IDENTIFIED BY '<AVCNAMEWITHREFS>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `avcnameswithrefs_copy` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error());


          #print "test: Updating avcnames<br />\n";
        $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE avcnames
                ROWS IDENTIFIED BY '<AVCNAME>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `avcnames` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error());

          #print "test: Updating avcnamesrefs<br />\n";
        $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE avcnamesrefs
                ROWS IDENTIFIED BY '<AVCNAMEWITHREFS>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `avcnamesrefs` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error());        
         
          
          #print "Updating synonymswithrefs<br />\n";
                $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE synonymswithrefs_copy
                ROWS IDENTIFIED BY '<NAME>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `synonymswithrefs_copy` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error()); 

          #print "test: Updating synonyms<br />\n";
                $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE synonyms
                ROWS IDENTIFIED BY '<SYNONYM>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `synonyms` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error()); 

          #print "test: Updating synonymsrefs<br />\n";
                $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE synonymsrefs
                ROWS IDENTIFIED BY '<SYNONYMWITHREFS>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `synonymsrefs` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error());


          #print "Updating commonnames<br />\n";
                $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE commonnames
                ROWS IDENTIFIED BY '<COMMONNAME>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `commonnames` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error()); 

          #print "Updating commonnamesrefs<br />\n";
                $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE commonnamesrefs
                ROWS IDENTIFIED BY '<COMMONNAMEWITHREFS>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `commonnamesrefs` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error()); 



        
        #print "Updating placenameswithrefs<br />\n";
        $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE placenameswithrefs_copy
                ROWS IDENTIFIED BY '<PLACE>'";                
        $result = floadIntoDB($SQL);        
        $updateIDSQL  = 'UPDATE `placenameswithrefs_copy` SET `IDENTIFIER` ="'.$taxonID[0].'" WHERE `IDENTIFIER` IS NULL';        
        $updateIDResult = mysql_query($updateIDSQL) or die ('Update failed: ' . mysql_error());        
        
            
            $progressCount++;
            print " ".$progressCount."/".$type1TaxonCount." [".round($progressCount/$type1TaxonCount*100)."%]";
    }
 
    mysql_free_result($sqlresult);
    
    return  true;     		
}





function exec_type3request($url, $xml_store) {

        $parsed_xml_out = '';
        $node_value = '';
        $http_request = $url."requesttype=3";
        print "<a href ='".$http_request."' target = '_blank'>".$http_request."</a><br />\n";
        
        print fsaveXML($http_request);
        
        $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE type3_tmp
                ROWS IDENTIFIED BY '<TYPE3RESULT>'";
                
        $type3Result = floadIntoDB($SQL);
        
        #checking if error occured and exits upon error
        if (strpos(strtolower($type3Result),"error")) {
         exit($type3Result." - stopping execution...");
        } else {
                print $type3Result;
              }
        #end error check
}


function exec_type4request($url, $gsdID, $xml_store) {
global $type1TaxonCount;

$rankCount = 0;
$progressCount = $type1TaxonCount;
$thisTaxonCount = $type1TaxonCount;
 
    $getidsSQL = 'SELECT DISTINCT `IDENTIFIER`	FROM `type1cache_copy`';
    
    do {
    $movehierarchySQL = "INSERT INTO type4hierarchycache_copy SELECT NULL, `GSDID`, `CHILDRENID`, `IDENTIFIER`, `RANK`, `GENUS`, `SPECIFICEPITHET`, `TAXONNAME`, `AUTHORITY`, `VIEW`, `UPDATED`, `NOTES` FROM type4hierarchycache_tmp";
		$movehierarchyResult = mysql_query($movehierarchySQL) or die ('Failed to move hierachy: ' . mysql_error());  
		
		$sqlgetidsResult = mysql_query($getidsSQL);
    $cleanupSQL = "TRUNCATE TABLE type4hierarchycache_tmp";
    $cleanupResult = mysql_query($cleanupSQL) or die ('Cleanup failed: ' . mysql_error());
    	  
	  #print  "\n".$getidsSQL."\n no rec:".$progressCount."\n";
	  
	  $progressCount = 0;
	  
    while ($taxonID = mysql_fetch_row($sqlgetidsResult)) 
    {    
          $http_request = $url."requesttype=4&taxon=".$taxonID[0];
          print "\n ".$http_request." ".fsaveXML($http_request);
          
          #was ROWS IDENTIFIED BY '<TYPE4RESULT>'                
          $SQL = "LOAD XML INFILE $xml_store
                INTO TABLE type4hierarchycache_tmp
                ROWS IDENTIFIED BY '<TAXON>'";                                
        $result = floadIntoDB($SQL);
        
        $updateParentIDSQL  = 'UPDATE `type4hierarchycache_tmp` SET `CHILDRENID` ="'.$taxonID[0].'" WHERE `CHILDRENID` IS NULL';        
        $parentUpdateResult = mysql_query($updateParentIDSQL) or die ('taxonid Update failed for taxon '.$taxonID[0].": " . mysql_error());
        
        $updateParentIDSQL  = 'UPDATE `type4hierarchycache_tmp` SET `GSDID` ="'.$gsdID.'" WHERE `GSDID` IS NULL';        
        $parentUpdateResult = mysql_query($updateParentIDSQL) or die ('GSDID Update failed: ' . mysql_error());
          
        $progressCount++;
          
          print " at rank level No: ".$rankCount.": ".$progressCount."/".$thisTaxonCount." [".round($progressCount/$thisTaxonCount*100)."%]";
     }
     
     
     mysql_free_result($sqlgetidsResult);     
     
     $getidsSQL = 'SELECT DISTINCT `IDENTIFIER`	FROM `type4hierarchycache_tmp`';
     $countidsSQL = 'SELECT COUNT(DISTINCT `IDENTIFIER`)	FROM `type4hierarchycache_tmp`';
     $thisTaxonCountResult = mysql_query($countidsSQL);
     $thisTaxonCountArr = mysql_fetch_row($thisTaxonCountResult);
     $thisTaxonCount = $thisTaxonCountArr[0];
     mysql_free_result($thisTaxonCountResult);
     $rankCount++;
     
     $checkDuplicateIDSQL = "SELECT COUNT(*) FROM type4hierarchycache_tmp WHERE CHILDRENID = IDENTIFIER";
    $checkDuplicateIDResult = mysql_query($checkDuplicateIDSQL);
    $checkDuplicateIDArr = mysql_fetch_row($checkDuplicateIDResult);
    
              
     } while ($rankCount < 20 AND $progressCount >= 1 AND $checkDuplicateIDArr[0]==0); 
#quit the loop either when rank count goes above 20, no more taxa comes into type4hierarchycache_copy
#or children id comes same as id used in type4 query type4hierarchycache_copy

return  true;

}


function exec_type5request($url, $xml_store) {
global $type1TaxonCount;

return  true;
}

#####   FILE I/O OPERATIONS  #######

function fsaveXML($url){
      #getting
      $ch = curl_init();
       $timeout = 15; // set to zero for no timeout
       curl_setopt ($ch, CURLOPT_URL, $url);
       curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
       curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
       $contents = curl_exec($ch);
       curl_close($ch);
       
       if (!$contents) {
       return 'Error: no data fetched or wrapper timeout!<br \>\n';
       }

       #storing
       $handle = fopen( 'stored.xml', 'w' ) or die ('Error: failed to open file for writing!');
       $result = fwrite($handle, $contents) or die ('Error: failed to write data!');
       fclose($handle);
       return "*";
}

function expose($exposed_dir, $wrapper) {
$replace = array("(", ")", " ");
$file = str_replace($replace, '_',$wrapper);

$file2 = $exposed_dir.$file."_synonyms.txt";

@unlink($file2);
$SQL = "SELECT
'AcceptedNameID',
'Genus',
'SpeciesEpithet',
'AuthorString',
'GSDNameStatus',
'Sp2000NameStatus'
UNION
SELECT
`IDENTIFIER` as `AcceptedNameID`,
`GENUS` as `Genus`,
`SPECIFICEPITHET` as `SpeciesEpithet`,
`AUTHORITY` as `AuthorString`,
`STATUS` as `GSDNameStatus`,
`STATUS` as `Sp2000NameStatus`
INTO OUTFILE '".$file2."'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
FROM synonymswithrefs_copy WHERE STATUS != 'accepted'";
$q1= floadIntoDB($SQL);

$file2 = $exposed_dir.$file."_gsdinfo.txt";
@unlink($file2);
$SQL = "SELECT
'DatabaseShortName',
'DatabaseFullName',
'DatabaseVersion',
'ReleaseDate',
'HomeURL',
'SearchURL',
'LogoURL',
'StandardAbstract',
'Custodian'
UNION
SELECT
`GSDSHORTNAME` as `DatabaseShortName`,
`GSDTITLE` as `DatabaseFullName`,
`VERSION` as `DatabaseVersion`,
`DATE` as `ReleaseDate`,
`HOMELINK` as `HomeURL`,
`SEARCHLINK` as `SearchURL`,
`LOGOLINK` as `LogoURL`,
`DESCRIPTION` as `StandardAbstract`,
`CONTACTLINK` as `Custodian`
INTO OUTFILE '".$file2."'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
FROM type3_tmp";
$q2= floadIntoDB($SQL);


$file2 = $exposed_dir.$file."_acceptednames.txt";
@unlink($file2);
$SQL = "SELECT
'ID',
'Genus',
'Species',
'AuthorString',
'InfraSpecies',
'InfraSpMarker',
'InfraSpecificAuthorString',
'GSDNameStatus',
'Sp2000NameStatus',
'Distribution'
UNION
SELECT
`t`.`IDENTIFIER` as `ID`,
`t`.`GENUS` as `Genus`,
`t`.`SPECIFICEPITHET` as `Species`,
`t`.`AUTHORITY` as `AuthorString`,
`t`.`InfraspecificEpithet` as `InfraSpecies`,
`t`.`InfraspecificMarker` as `InfraSpMarker`,
`t`.`InfraspecificAuthorString` as `InfraSpecificAuthorString`,
`t`.`STATUS` as `GSDNameStatus`,
`t`.`STATUS` as `Sp2000NameStatus`,
`p`.`PLACENAME` as `Distribution`
INTO OUTFILE '".$file2."'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
FROM type1cache_copy t
LEFT JOIN placenameswithrefs_copy p ON t.IDENTIFIER = p.IDENTIFIER";
#later was WHERE `t`.`STATUS` = 'accepted'"; 
#was AND `p`.`PLACENAME` IS NOT NULL
$q3 =  floadIntoDB($SQL);


$file2 = $exposed_dir.$file."_taxa.txt";
@unlink($file2);
$SQL = "SELECT
'TaxonIdentifier',
'ChildrenID',
'Rank',
'TaxonName',
'InfraspecificGenus',
'InfraspecificEpithet',
'Authority'
UNION
SELECT
`IDENTIFIER` as `TaxonIdentifier`,
`CHILDRENID` as `ChildrenID`,
`RANK` as `Rank`,
`TAXONNAME` as `TaxonName`,
`GENUS` as `InfraspecificGenus`,
`SPECIFICEPITHET` as `InfraspecificEpithet`,
`AUTHORITY` as `Authority`
INTO OUTFILE '".$file2."'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
FROM type4hierarchycache_copy";
$q4 =  floadIntoDB($SQL);

$file2 = $exposed_dir.$file."_references.txt";
@unlink($file2);
$SQL = "SELECT
'Identifier',
'Author',
'Year',
'Title',
'Details'
UNION
SELECT
`IDENTIFIER` as `Identifier`,
`AUTHOR` as `Author`,
`YEAR` as `Year`,
`TITLE` as `Title`,
`DETAILS` as `Details`
INTO OUTFILE '".$file2."'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
FROM avcnameswithrefs_copy";
$q5 =  floadIntoDB($SQL);

$file2 = $exposed_dir.$file."_commonnames.txt";
@unlink($file2);
$SQL = "SELECT
'Identifier',
'Common name',
'Country',
'Language',
'Reftype',
'Author',
'Year',
'Title',
'Details'
UNION
SELECT cn.IDENTIFIER, 
cn.VERNAME,
cn.COUNTRY,
cn.LANGUAGE,
cnr.REFTYPE, 
cnr.AUTHOR, 
cnr.YEAR,
cnr.TITLE, 
cnr.DETAILS 
INTO OUTFILE '".$file2."'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
FROM commonnames cn
LEFT JOIN commonnamesrefs cnr ON 
cnr.IDENTIFIER = cn.IDENTIFIER AND cnr.ID = cn.ID";
$q6 =  floadIntoDB($SQL);

return $q1.$q2.$q3.$q4.$q5.$q6;


}



#Flush buffer without the need for flush() after each line
	function alwaysFlush() {
		@ini_set('zlib.output_compression', 0);
		@ini_set('implicit_flush', 1);
		for ($i = 0; $i < ob_get_level(); $i++) { ob_end_flush(); }
		ob_implicit_flush(1);
		set_time_limit(0);
	}

#####  User Interface (Forms)  ########

function create_ui_Form()
{

  if (isset($_GET['batch_size'])) {
  $batch_size =  $_GET['batch_size'];
  } else {
  $batch_size = 10;
  }
  
  if (isset($_GET['start_at'])) {
  $start_at =  $_GET['start_at'];
  } else {
  $start_at = 0;
  }
  
  if (isset($_GET['amount_rec'])) {
  $amount_rec =  $_GET['amount_rec'];
  } else {
  $amount_rec = $batch_size;
  }
  
  
    return "\n<div name = 'selector' id = 'selector'><table><tr><td valign = 'top'>
    <form name = 'select_wrapper' id = 'select_wrapper'  method = 'get'>    
    <b>Choose target wrapper:</b><br />\n".
    create_ui_WrappersList().
    "</td><td valign = 'top' align = 'right'><b>Batch size:</b><br/><input type = 'text' size = '10' name = 'batch_size' id = 'batch_size' value ='".$batch_size."'><br/>\n
    <b>Start at:</b><br/><input type = 'text' size = '10' name = 'start_at' id = 'start_at' value ='".$start_at."'><br/>\n<b>Number of taxa:<br/></b><input type = 'text' size = '10' name = 'amount_rec' id = 'amount_rec' value ='".$amount_rec."'></td></tr></table>\n
    <input type = 'submit' value = 'Harvest from GSD'>\n</form></div>\n";    
}

function create_ui_menu($wrapperid) {
if ($wrapperid)
{
$out = "<div id = 'menu'>
<a href='help.html' target = '_blank'>How to use</a> ||\n
  <a href='?initiate=1&wrapper=".$wrapperid."'>Harvest data</a> |\n
  <a href='?initiate=1&wrapper=".$wrapperid."'>Stop harvesting</a> || \n
   <a href='?datadisplay=1&wrapper=".$wrapperid."'>Display harvested data</a> | \n
    <a href='?expose=1&wrapper=".$wrapperid."'>Expose data for QAW</a> ||\n
<a href='?deltab=1'>Reset cache</a> ||\n 
    <a href='?editsectors=1&wrapper=".$wrapperid."'>Edit sectors (wrappers)</a> ||\n     
    </div><hr/>\n";
}
else
{
$out = "<div id = 'menu'>
<a href='help.html' target = '_blank'>How to use</a> ||\n
  <a href='?initiate=1&wrapper=".$wrapperid."'>Harvest data</a> |\n
  <a href='?initiate=1&wrapper=".$wrapperid."'>Stop harvesting</a> |\n
<a href='?deltab=1'>Reset cache</a> || \n  
   <a href='?editsectors=1&wrapper=".$wrapperid."'>Edit sectors (wrappers)</a> ||\n    
    </div><hr/>\n";
}

  return $out;
}


function create_ui_WrappersList () {
		
		$sql = 'SELECT h.wrapper_id, g.gsd_short_name	FROM `hierarchyindex` h 
    INNER JOIN `gsds` g ON g.gsd_id = h.gsd_id';    
	  $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
	  $output = "<select name = 'wrapper' id = 'wrapper' size = '10'>";
    while ($row = mysql_fetch_row($result)) 
    {
      if (isset($_GET['wrapper']) && $row[0]==$_GET['wrapper']){
         $output.= "<option selected value = $row[0]>$row[1]</option>\n";
      }
      else {
          $output.= "<option value = $row[0]>$row[1]</option>\n";
      }
      
    }
    $output.= "</select>";
    mysql_free_result($result);
    
    return  $output;
     		
	}
	
	
	function create_ui_TaxaList($start,$limit,$wrapperid) {
		  
    $taxaListSQL = 'SELECT DISTINCT `IDENTIFIER`, NULL, `GENUS`, `SPECIFICEPITHET`, `InfraspecificEpithet`,
    `InfraspecificAuthorString`, `InfraspecificMarker`, `AUTHORITY`
    FROM type1cache_copy ORDER BY `GENUS`, `SPECIFICEPITHET`, `AUTHORITY`';
    
	  $taxaListResult = mysql_query($taxaListSQL) or die ('Invalid query: ' . mysql_error());
	  $output = "<form name = 'select_taxa' id = 'select_taxa'  method = 'get'>
    <input type = 'hidden' name = 'datadisplay' id = 'datadisplay' value = '1'>
    <input type = 'hidden' name = 'wrapper' id = 'wrapper' value = '".$wrapperid."'>
    <select name = 'taxaselected' id = 'taxaselected' size = '20' onchange='this.form.submit();'>";
    while ($taxaListRow = mysql_fetch_row($taxaListResult)) 
    {     
    if (isset($_GET['taxaselected']) && $taxaListRow[0]==$_GET['taxaselected']){
          $output.= "<option selected value = ".$taxaListRow[0].">".$taxaListRow[2]." ".$taxaListRow[3]." ".$taxaListRow[4]." ".$taxaListRow[6]." ".$taxaListRow[4]." ".$taxaListRow[7]."</option>\n";
      }
      else {
          $output.= "<option value = ".$taxaListRow[0].">".$taxaListRow[2]." ".$taxaListRow[3]." ".$taxaListRow[4]." ".$taxaListRow[6]." ".$taxaListRow[4]." ".$taxaListRow[7]."</option>\n";
      }
    }
    $output.= "</select></form>\n";
    mysql_free_result($taxaListResult);

    return  $output;
     		
	}	

  
  
  function create_ui_SectorsTable() {
  
  $gsdsSQL = 'SELECT DISTINCT g.gsd_id, g.gsd_short_name  FROM gsds g ORDER BY g.gsd_short_name';
  $gsdsSQLResult = mysql_query($gsdsSQL) or die ('Invalid query: ' . mysql_error());
  $cnt = 1;
  $gsdlist = "<select name = 'select_gsds' id = 'select_gsds' size = '1' style='width: 150px'>\n";
  while ($gsdsListRow = mysql_fetch_row($gsdsSQLResult)) 
    {
      $gsdlist .= "<option value = '".$gsdsListRow[0]."'>".$gsdsListRow[1]."</option>\n";
    }  
  mysql_free_result($gsdsSQLResult);  
 $gsdlist .= "</select>\n";
  
  $sectorsSQL = 'SELECT DISTINCT h.wrapper_id, g.gsd_short_name, h.attachment_taxa_name, h.attachment_taxa_level, h.wrapper_url, g.gsd_id  FROM hierarchyindex h LEFT JOIN gsds g ON h.gsd_id = g.gsd_id  ORDER BY g.gsd_short_name';
  
  $sectorsSQLResult = mysql_query($sectorsSQL) or die ('Invalid query: ' . mysql_error());
  
  $output = "<b>EDIT SECTORS</b><br/><form><nobr><input name ='gsd_short_name' size = '10' type = 'text' value ='GSD name' disabled style= 'margin-left: 25px;'>&nbsp;<input name = 'attachment_taxa_name' size = '7' type = 'text' value ='At point' disabled>&nbsp;<input name = 'attachment_taxa_level' size = '7' type = 'text' value ='At level' disabled>&nbsp;<input name = 'wrapper_url' size = '60' type = 'text' value ='Wrapper URL' disabled></nobr></form>";

 
  
  while ($sectorsListRow = mysql_fetch_row($sectorsSQLResult)) 
    {     
      $output.= "<nobr><form name = 'edit_wrapper' id = 'edit_wrapper'  method = 'get'><a href='?remove=1&wrapper_id=".$sectorsListRow[0]."'><img src='harvest/images/delete.png' border='0' alt = 'delete'></a>".$cnt.".&nbsp;<input name ='wrapper_id' id ='wrapper_id' type = 'hidden' value ='".$sectorsListRow[0]."'><input name ='gsd_short_name' size = '15' type = 'text' value ='".$sectorsListRow[1]."' disabled>&nbsp;<input name = 'attachment_taxa_name' size = '7' type = 'text' value ='".$sectorsListRow[2]."'>&nbsp;<input name = 'attachment_taxa_level' size = '7' type = 'text' value ='".$sectorsListRow[3]."'>&nbsp;<input name = 'wrapper_url' size = '60' type = 'text' value ='".$sectorsListRow[4]."'><input type = 'image' src = 'harvest/images/store.png' value = 'submit' alt = 'save'></form></nobr>";
      $cnt++;
    }
    mysql_free_result($sectorsSQLResult);
    
    $output .= "<b>Insert NEW sector</b><br/><form name = 'add_wrapper' id = 'add_wrapper'  method = 'get'><nobr>&nbsp;&nbsp;".$gsdlist."&nbsp;<input name = 'attachment_taxa_name' size = '7' type = 'text' value ='NEW'>&nbsp;<input name = 'attachment_taxa_level' size = '7' type = 'text' value ='NEW'>&nbsp;<input name = 'wrapper_url' size = '60' type = 'text' value ='NEW'><input type = 'image' src = 'harvest/images/insert.png' value = 'submit' alt = 'insert'></nobr></form>";
    
    
    $gsdsSQL = 'SELECT gsd_id, gsd_short_name, gsd_long_name, date_of_gsd_insertion, notes FROM gsds g ORDER BY g.gsd_short_name';
    $gsdsSQLResult = mysql_query($gsdsSQL) or die ('Invalid query: ' . mysql_error());
    $output .= "<br/><b>EDIT GSDs</b><br/><form><nobr><input name ='gsd_short_name' size = '10' type = 'text' value ='Short name' disabled style= 'margin-left: 25px;'>&nbsp;<input name = 'gsd_long_name' size = '75' type = 'text' value ='Long name' disabled>&nbsp;<input name = 'date_of_gsd_insertion' size = '7' type = 'text' value ='Date GSD added' disabled></nobr><input name = 'notes' size = '106' type = 'text' value ='Notes' disabled></form>";
    $cnt =1;
    
    while ($gsdsListRow = mysql_fetch_row($gsdsSQLResult)) 
    {     
      $output.= "<form name = 'edit_gsd' id = 'edit_wrapper'  method = 'get'><nobr><a href='?remove=1&gsd_id=".$gsdsListRow[0]."'><img id = 'imdelete' src='harvest/images/delete.png' border='0' alt = 'delete'></a>".$cnt.".&nbsp;<input name ='gsd_id' id ='gsd_id' type = 'hidden' value ='".$gsdsListRow[0]."'><input name ='gsd_short_name' size = '10' type = 'text' value ='".$gsdsListRow[1]."'>&nbsp;<input name = 'gsd_long_name' size = '75' type = 'text' value ='".$gsdsListRow[2]."'>&nbsp;<input name = 'date_of_gsd_insertion' size = '7' type = 'text' value ='".$gsdsListRow[3]."' disabled>&nbsp;</nobr><input name = 'notes' size = '106' type = 'text' value ='".$gsdsListRow[4]."'><input type = 'image' src = 'harvest/images/store.png' value = 'submit' alt = 'save'></form>";
      $cnt++;
    }
    mysql_free_result($gsdsSQLResult);
    $output .= "<form name = 'add_gsd' id = 'add_gsd'  method = 'get'><b>Insert NEW GSD</b><br/><nobr><input type = 'hidden' name = 'add_gsd' value = '1'><input name = 'gsd_short_name' size = '15' type = 'text' value ='NEW short name'>&nbsp;<input name = 'gsd_long_name' size = '86' type = 'text' value ='NEW long name'></nobr><input name = 'notes' size = '106' type = 'text' value ='Notes...'><input type = 'image' src = 'harvest/images/insert.png' value = 'submit' alt = 'insert'></form>";
    
      return $output;
  }

#####  Database operations  #######

function dbConnect($server, $user, $password, $database)
{
global $link;
 
    $link = mysql_connect($server,$user,$password) 
		or die("Error: connection failure: " . mysql_error());
		
		mysql_select_db($database) 
		or die("Error: could not select database: " . mysql_error());
		
		return $database;
}

function get_url_by_wrapper_id($wrapper_id)
{
     $sql = 'SELECT h.wrapper_url  FROM `hierarchyindex` h WHERE h.wrapper_id = '.$wrapper_id;
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
		 return $row[0];                  
}

function get_gsdid_by_wrapper_id($wrapper_id)
{
     $sql = 'SELECT h.gsd_id  FROM `hierarchyindex` h WHERE h.wrapper_id = '.$wrapper_id;
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
		 return $row[0];
}

function get_sectorname_by_wrapper_id($wrapper_id)
{
  $sql = 'SELECT g.gsd_short_name, h.attachment_taxa_name, h.attachment_taxa_level 
  FROM `hierarchyindex` h 
  LEFT JOIN `gsds` g ON g.gsd_id = h.gsd_id
  WHERE h.wrapper_id = '.$wrapper_id;
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
		 return $row[0]." (".$row[1]." ".$row[2].")";
}

function get_stddata_by_identifier($identifier, $wrapperid)
{
      
      #HIERARCHY
     $sql = 'SELECT hc1.CHILDRENID, hc1.IDENTIFIER, hc1.RANK, hc1.GENUS, hc1.SPECIFICEPITHET, hc1.TAXONNAME, hc1.AUTHORITY, hc1.NOTES,  hc2.CHILDRENID, hc2.RANK, hc2.GENUS, hc2.SPECIFICEPITHET, hc2.TAXONNAME, hc2.AUTHORITY, hc2.NOTES, hc3.CHILDRENID, hc3.RANK, hc3.TAXONNAME, hc3.NOTES, hc4.CHILDRENID, hc4.RANK, hc4.TAXONNAME, hc4.NOTES, hc5.CHILDRENID, hc5.RANK, hc5.TAXONNAME, hc5.NOTES, hc6.CHILDRENID, hc6.RANK, hc6.TAXONNAME, hc6.NOTES, hc7.CHILDRENID, hc7.RANK, hc7.TAXONNAME, hc7.NOTES, hc8.CHILDRENID, hc8.RANK, hc8.TAXONNAME, hc8.NOTES, hc9.CHILDRENID, hc9.RANK, hc9.TAXONNAME, hc9.NOTES, hc10.CHILDRENID, hc10.RANK, hc10.TAXONNAME, hc10.NOTES FROM type4hierarchycache_copy hc1
     LEFT JOIN type4hierarchycache_copy hc2 ON hc2.CHILDRENID = hc1.IDENTIFIER 
     LEFT JOIN type4hierarchycache_copy hc3 ON hc3.CHILDRENID = hc2.IDENTIFIER
     LEFT JOIN type4hierarchycache_copy hc4 ON hc4.CHILDRENID = hc3.IDENTIFIER
     LEFT JOIN type4hierarchycache_copy hc5 ON hc5.CHILDRENID = hc4.IDENTIFIER
     LEFT JOIN type4hierarchycache_copy hc6 ON hc6.CHILDRENID = hc5.IDENTIFIER
     LEFT JOIN type4hierarchycache_copy hc7 ON hc7.CHILDRENID = hc6.IDENTIFIER
     LEFT JOIN type4hierarchycache_copy hc8 ON hc8.CHILDRENID = hc7.IDENTIFIER
     LEFT JOIN type4hierarchycache_copy hc9 ON hc9.CHILDRENID = hc8.IDENTIFIER
     LEFT JOIN type4hierarchycache_copy hc10 ON hc10.CHILDRENID = hc9.IDENTIFIER
     WHERE hc1.CHILDRENID = "'.$identifier.'"';       
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
     
     #$out = "<table><tr><td>\n";
     #$out = " <br/>\n<b>(".get_sectorname_by_wrapper_id($wrapperid).")</b>";  
		 $out = "<br />\n<br />\n<b>Hierarchy: </b><br /> ";

     $out .= "| ".$row[2].": ".$row[3]." ".$row[4]." ".$row[5]." ".$row[6]." ".$row[7]." | ".$row[9].": ".$row[10]." ".$row[11]." ".$row[12]." ".$row[13]." ".$row[14]." | ".$row[16].": ".$row[17]." ".$row[18]." | ".$row[20].": ".$row[21]." ".$row[22]." | ".$row[24].": ".$row[25]." ".$row[26]." | ".$row[28].": ".$row[29]." ".$row[30]." | ".$row[32].": ".$row[33]." ".$row[34]." | ".$row[36].": ".$row[37]." ".$row[38]." | ".$row[40].": ".$row[41]." ".$row[42]." | ".$row[44].": ".$row[45]." ".$row[46]."<br />\n";
     
     #$out .= "</td><td>\n";
     
     mysql_free_result($result);
      
      #AVC NAME
      $sql = 'SELECT `STATUS`, `GENUS`, `SPECIFICEPITHET`, `InfraspecificEpithet`,
    `InfraspecificAuthorString`, `InfraspecificMarker`, `AUTHORITY`, `ID`
    FROM type1cache_copy WHERE `IDENTIFIER` = "'.$identifier.'"';    
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
     $out .= "<b>Taxon:<b><br/>\n<table><tr><td>STATUS</td><td>GENUS</td><td>SPECIFICEPITHET</td><td>AUTHORITY</td><td></tr><tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><td>".$row[6]."</td></tr></table>";
		 /*$out .= "<br />\n<b>TAXON:</b><br />\nSTATUS: ".$row[0].
     "<br />\nGENUS: ".$row[1].
     "<br />\nSPECIFICEPITHET: ".$row[2].
     "<br />\nAUTHORITY: ".$row[6]; */
     mysql_free_result($result);
   
     #INFRASPECIFIC PART
      $sql = 'SELECT `InfraspecificEpithet`, `InfraspecificAuthorString`, `InfraspecificMarker` FROM type1cache_copy WHERE `IDENTIFIER` = "'.$identifier.'"';
		  $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
     mysql_free_result($result);
     $out .= "<b>Infraspecific portion:</b><br/>\n<table><tr><td>EPITHET</td><td>AUTHOR</td><td>MARKER</td></tr><tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td></tr></table>";
     
     /*$out .= "<br />\n<br />\nInfraspecific : ".$row[0]."<br />\nInfraspecific : ".$row[1]."<br />\nInfraspecific : ".$row[2];*/ 
    
     #AVC REFERENCES
     $sql = 'SELECT `REFTYPE`, `AUTHOR`, `YEAR`, `TITLE`, `DETAILS`  FROM avcnameswithrefs_copy WHERE `IDENTIFIER` = "'.$identifier.'"';       
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
     mysql_free_result($result);
     
     $out .= "<br />\n<b>Reference:</b><br />\n<table><tr><td>REFTYPE</td><td>AUTHOR</td><td>YEAR</td><td>TITLE</td><td>DETAILS</td></tr><tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><td>".$row[3]."</td><td>".$row[4]."</td></tr></table>";    
		 /*$out .= "<br />\n<br />\n<b>REFERENCE:</b><br />\n".$row[0].":<br/>\n ".$row[1]." ".$row[2]." ".$row[3]."<br/>\n ".$row[4];*/
		 
		 #SYNONYMS
     $sql = 'SELECT STATUS, GENUS, SPECIFICEPITHET, AUTHORITY  FROM synonymswithrefs_copy WHERE STATUS != "accepted" AND `IDENTIFIER` = "'.$identifier.'"';       
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     #$row = mysql_fetch_row($result);  
     $out .= "<br />\n<b>Synonyms:</b><br />\n<table><tr><td>STATUS</td><td>GENUS</td><td>SPECIFICEPITHET</td><td>AUTHORITY</td></tr>";
     while ($row = mysql_fetch_row($result)) 
    {        
       $out .= "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><td>".$row[3]."</td></tr>";
    }
    $out .= "</td></tr></table>";
     mysql_free_result($result);
     
     #COMMON NAMES WITH REFS
     $sql = 'SELECT cn.VERNAME, cn.COUNTRY, cn.LANGUAGE, cnr.REFTYPE,  cnr.AUTHOR, cnr.YEAR, cnr.TITLE, cnr.DETAILS 
FROM commonnames cn LEFT JOIN commonnamesrefs cnr ON cnr.IDENTIFIER = cn.IDENTIFIER AND cnr.ID = cn.ID WHERE `cnr`.`IDENTIFIER` = "'.$identifier.'"';       
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     #$row = mysql_fetch_row($result);  
     $out .= "<br />\n<b>Common names with references:</b><br />\n<table><tr><td>NAME</td><td>COUNTRY</td><td>LANGUAGE</td><td>REFTYPE</td><td>AUTHOR</td><td>YEAR</td><td>TITLE</td><td>DETAILS</td></tr>";
     while ($row = mysql_fetch_row($result)) 
    {        
       $out .= "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><td>".$row[3]."</td><td>".$row[4]."</td><td>".$row[5]."</td><td>".$row[6]."</td><td>".$row[7]."</td></tr>";
    }
    $out .= "</td></tr></table>";
     mysql_free_result($result);
		 
		 #DISTRIBUTION
     $sql = 'SELECT `PLACENAME`, `COUNTRY`, `LANGUAGE`  FROM placenameswithrefs_copy WHERE `IDENTIFIER` = "'.$identifier.'"';       
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
     mysql_free_result($result);
     $out .= "<br />\n<b>Distribution:</b><br />\n<table><tr><td>PLACENAME</td><td>COUNTRY</td><td>LANGUAGE</td></tr><tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td></tr></table>";     
		/* $out .= "<br />\n<b>Distribution:</b><br /> ".$row[0]." ".$row[1]." ".$row[2]; */
		 
		 #STD DATA COMMENTS
     $sql = 'SELECT `COMMENT`, `FAMILY`  FROM standarddata_copy WHERE `IDENTIFIER` = "'.$identifier.'"';    
     $result = mysql_query($sql) or die ('Invalid query: ' . mysql_error());
     $row = mysql_fetch_row($result);
     mysql_free_result($result);     
		 $out .= "<br />\n<br />\n<b>Comments:</b> ".$row[0]."  ".$row[1];     
     
     #$out .= "</td></tr></table>\n";
      return $out;

}


function update_list_of_wrappers($wrapper_id, $attachment_taxa_name, $attachment_taxa_level, $wrapper_url, $gsd_id, $remove) {
if ($wrapper_id) {
  if ($remove) {$SQL = "DELETE FROM hierarchyindex WHERE wrapper_id = ".$wrapper_id;}
  else {$SQL = "UPDATE hierarchyindex SET attachment_taxa_name = '".$attachment_taxa_name."', attachment_taxa_level = '".$attachment_taxa_level."', wrapper_url = '".$wrapper_url."' WHERE wrapper_id = ".$wrapper_id;}
} else {
  #wrapper_id, gsd_id, attachment_taxa_name, attachment_taxa_level, date_of_point_insertion, wrapper_url, notes
  $SQL = "INSERT INTO hierarchyindex VALUES (NULL, ".$gsd_id.", '".$attachment_taxa_name."', '".$attachment_taxa_level."', NULL, '". $wrapper_url."', NULL)";
}
#return $SQL.floadIntoDB($SQL);
return   floadIntoDB($SQL);
}

function update_list_of_gsds($gsd_id, $gsd_short_name, $gsd_long_name, $date_of_gsd_insertion, $notes, $remove) {
if ($gsd_id) {
  if ($remove) {$SQL = "DELETE FROM gsds WHERE gsd_id = ".$gsd_id;}
  else {$SQL = "UPDATE gsds SET gsd_short_name = '".$gsd_short_name."', gsd_long_name = '".$gsd_long_name."', notes = '".$notes."' WHERE gsd_id = ".$gsd_id;}
} else {
  #gsd_id, gsd_short_name, gsd_long_name, date_of_gsd_insertion, notes
  $SQL = "INSERT INTO gsds(gsd_id, gsd_short_name, gsd_long_name, notes) VALUES (NULL, '".$gsd_short_name."', '".$gsd_long_name."', '".$notes."')";
}
return "Output:".$SQL.floadIntoDB($SQL);
#return   floadIntoDB($SQL);
}

function floadIntoDB($SQL) {

      mysql_query($SQL);
      if (!mysql_error()) {
         return ".";
       } else {
          return "MySQL Error: ".mysql_error()."<br \>\n";
        }
}


function totalCleanUp() {
#truncating COPY tables so they are clean before harvesting starts
#truncating harvested data tables so they are completely reset
return cleanUp().cleanThis(array("standarddata", "type1cache", "avcnameswithrefs", "synonymswithrefs", "type4hierarchycache", "type5hierarchycache", "type3_tmp", "type0_tmp", "harvesting_history", "placenameswithrefs", "commonnameswithrefs", "commonnames", "commonnamesrefs", "avcnamesrefs", "avcnames", "synonyms", "synonymsrefs"));
}

function cleanUp(){
#truncating COPY tables so they are clean before harvesting starts
return cleanThis(array("standarddata_copy", "type1cache_copy", "avcnameswithrefs_copy", "synonymswithrefs_copy", "type4hierarchycache_copy", "type5hierarchycache_copy", "placenameswithrefs_copy", "commonnameswithrefs_copy", "type4hierarchycache_tmp", "type3_tmp", "commonnames", "commonnamesrefs", "avcnamesrefs", "avcnames", "synonyms", "synonymsrefs"));
}

function cleanThis($tables_list) {
$result = "";
foreach ($tables_list as $table)
 {
  $SQL = "TRUNCATE TABLE ".$table; 
  mysql_query($SQL);
  if (!mysql_error()) {
  $result .=  "Table ".$table." cleaned successfully.<br \>\n ";
  } else {
  $result .= "MySQL Error: ".mysql_error()."<br \>\n";
  }
  }
return $result;

}




  
?>