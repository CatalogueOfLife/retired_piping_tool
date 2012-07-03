USE piping;

SELECT 'USE piping;'
UNION
SELECT CONCAT("SELECT 'id', 'taxonID', 'scientificName', 'taxonRank', 'genus', 'specificEpithet', 'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks', 'source', 'updated', 'provider', 'gsd_comments', 'gsd_short_name', 'gsd_status', 'matched_by'",
" UNION SELECT 'id', 'taxonID', 'scientificName', 'taxonRank', 'genus', 'specificEpithet', 'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks', 'source', 'updated', 'provider', 'gsd_comments', 'gsd_short_name', 'gsd_status', 'matched_by' FROM piping.taxa WHERE  provider_id =",
userid * 1,
" INTO OUTFILE '/var/www/piping/webservice/gbp/",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(us.username, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
"/all/all.txt'  FIELDS TERMINATED BY '\\t' ESCAPED BY '' LINES TERMINATED BY '\\n';"
)
FROM `user` us WHERE username != 'admin'
GROUP BY us.username
UNION
SELECT CONCAT("SELECT 'id', 'taxonID', 'scientificName', 'taxonRank', 'genus', 'specificEpithet', 'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks', 'source', 'updated', 'provider', 'gsd_comments', 'gsd_short_name', 'gsd_status', 'matched_by'",
" UNION SELECT 'id', 'taxonID', 'scientificName', 'taxonRank', 'genus', 'specificEpithet', 'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks', 'source', 'updated', 'provider', 'gsd_comments', 'gsd_short_name', 'gsd_status', 'matched_by' 
FROM piping.taxa WHERE ('gsd_comments' IS NOT NULL OR 'gsd_status' IS NOT NULL) AND provider_id =",
userid * 1,
" INTO OUTFILE '/var/www/piping/webservice/gbp/",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(us.username, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
"/annotated/annotated.txt'  FIELDS TERMINATED BY '\\t' ESCAPED BY '' LINES TERMINATED BY '\\n';"
)
FROM `user` us WHERE username != 'admin'
GROUP BY us.username
INTO OUTFILE '/var/www/piping/backend/export_gbps_to_webservice.sql' FIELDS TERMINATED BY ' ' ESCAPED BY '' LINES TERMINATED BY '\n';;