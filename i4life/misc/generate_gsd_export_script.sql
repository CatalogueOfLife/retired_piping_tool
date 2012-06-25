USE Assembly_Global_Deploy;

SELECT 'USE pipeline;'
UNION
SELECT CONCAT("SELECT 'id', 'taxonID', 'genus', 'specificEpithet', 'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks', 'source', 'updated', 'provider', 'gsd_comments', 'gsd_comments_predefined', 'gsd_short_name', 'gsd_status', 'history_status', 'history_comments', 'tag', 'scientificName', 'taxonRank', 'matched_by'",
" UNION SELECT * FROM pipeline.",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
" INTO OUTFILE '/var/www/piping2012/webservice/gsd/",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
"/piping.txt'  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '' LINES TERMINATED BY '\\n';"
)
FROM `databases` db
GROUP BY db.database_name
UNION
SELECT CONCAT("SELECT 'id', 'taxonID', 'genus', 'specificEpithet', 'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks', 'source', 'updated', 'provider', 'gsd_comments', 'gsd_comments_predefined', 'gsd_short_name', 'gsd_status', 'history_status', 'history_comments', 'tag', 'scientificName', 'taxonRank', 'matched_by' UNION SELECT * FROM pipeline.protoGSD INTO OUTFILE '/var/www/piping2012/webservice/gsd/protoGSD/piping.txt' FIELDS TERMINATED BY '\\t' ESCAPED BY '' LINES TERMINATED BY '\\n';")
INTO OUTFILE '/var/www/piping2012/misc/export_gsds_to_webservice.sql' FIELDS TERMINATED BY ' ' ESCAPED BY '' LINES TERMINATED BY '\n';