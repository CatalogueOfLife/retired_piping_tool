USE Assembly_Global_Deploy;
SELECT "USE pipeline;"
UNION
SELECT CONCAT('INSERT INTO pipeline.', 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
' SELECT `id`, `taxonID`, `genus`, `specificEpithet`, `scientificNameAuthorship`, `infraspecificEpithet`, `verbatimTaxonRank`, `taxonomicStatus`, `acceptedNameUsageID`, `parentNameUsageID`, `family`, `order`, `class`, `phylum`, `kingdom`, `higherClassification`, `namePublishedIn`, `taxonRemarks`, `source`, `updated`, `u`.`username`, `gsd_comments`, `gsd_comments_predefined`, `gsd_short_name`, `gsd_status`, `history_status`, `history_comments`, `tag`, `scientificName`, `taxonRank`, `matched_by` 
FROM piping.taxa pt LEFT JOIN piping.`user` u ON pt.provider_id = `u`.`userid` WHERE gsd_short_name LIKE "%',
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
'%";'
) 
FROM `databases` db
GROUP BY db.database_name
UNION
SELECT 'INSERT INTO pipeline.protoGSD SELECT `id`, `taxonID`, `genus`, `specificEpithet`, `scientificNameAuthorship`, `infraspecificEpithet`, `verbatimTaxonRank`, `taxonomicStatus`, `acceptedNameUsageID`, `parentNameUsageID`, `family`, `order`, `class`, `phylum`, `kingdom`, `higherClassification`, `namePublishedIn`, `taxonRemarks`, `source`, `updated`, `u`.`username`, `gsd_comments`, `gsd_comments_predefined`, `gsd_short_name`, `gsd_status`, `history_status`, `history_comments`, `tag`, `scientificName`, `taxonRank`, `matched_by` 
FROM piping.taxa pt LEFT JOIN piping.`user` u ON pt.provider_id = `u`.`userid` WHERE gsd_short_name = "protoGSD";' 
INTO OUTFILE '/var/www/piping2012/misc/insert_into_pipeline_tables.sql' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';