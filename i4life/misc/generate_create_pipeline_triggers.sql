USE Assembly_Global_Deploy;
SELECT 'USE pipeline;'
UNION
SELECT CONCAT(
'CREATE TABLE IF NOT EXISTS `', 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
'` ( `id` int(10) unsigned NOT NULL,
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,
 `genus` varchar(255) COLLATE utf8_general_ci NOT NULL, 
`specificEpithet` varchar(255) COLLATE utf8_general_ci NOT NULL,
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `kingdom` varchar(255) COLLATE uutf8_general_ci DEFAULT NULL, 
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `updated` timestamp NOT NULL,
 `provider_id` tinyint(3) unsigned NOT NULL,
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,
 `history_status` int(10) DEFAULT NULL,
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
`tag` varchar(32) COLLATE utf8_bin NOT NULL,
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, 
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;'
) 
FROM `databases` db
GROUP BY db.database_name 
INTO OUTFILE '/var/www/piping2012/misc/create_pipeline_tables.sql' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';