SELECT 'id', 'taxonID', 'genus', 'specificEpithet', 'scientificNameAuthorship', 'infraspecificEpithet', 'verbatimTaxonRank', 'taxonomicStatus', 'acceptedNameUsageID', 'parentNameUsageID', 'family', 'order', 'class', 'phylum', 'kingdom', 'higherClassification', 'namePublishedIn', 'taxonRemarks', 'source', 'updated', 'provider', 'gsd_comments', 'gsd_comments_predefined', 'gsd_short_name', 'gsd_status', 'history_status', 'history_comments', 'tag', 'scientificName', 'taxonRank', 'matched_by' UNION SELECT * FROM pipeline.protoGSD INTO OUTFILE '/var/www/piping2012/webservice/gsd/protoGSD/piping.txt' FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n';