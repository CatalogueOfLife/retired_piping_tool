SET SESSION group_concat_max_len = 3048576;
USE Assembly_Global_Deploy;
SELECT CONCAT(
'UPDATE piping.taxa SET taxa.gsd_short_name = CONCAT_WS(", ", "',

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),

'", taxa.gsd_short_name',

') WHERE taxa.matched_by IS NULL AND `family` IN("',

 GROUP_CONCAT(DISTINCT REPLACE(fm.family, '\"', '') SEPARATOR '", "'),

'");'

) 
FROM families fm
LEFT JOIN `databases` db ON db.record_id = fm.database_id
GROUP BY db.database_name 
UNION
SELECT 'UPDATE piping.taxa SET taxa.matched_by = "family" WHERE (taxa.matched_by IS NULL) AND (taxa.gsd_short_name IS NOT NULL);'
/*------------------------------------------------------------------------*/
UNION
SELECT CONCAT(
'UPDATE piping.taxa SET taxa.gsd_short_name = CONCAT_WS(", ", "',

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),

'", taxa.gsd_short_name',

') WHERE taxa.matched_by IS NULL AND `order` IN("',

 GROUP_CONCAT(DISTINCT REPLACE(fm.`order`, '\"', '') SEPARATOR '", "'),

'");'

) 
FROM families fm
LEFT JOIN `databases` db ON db.record_id = fm.database_id
GROUP BY db.database_name 
UNION
SELECT 'UPDATE piping.taxa SET taxa.matched_by = "order" WHERE (taxa.matched_by IS NULL) AND (taxa.gsd_short_name IS NOT NULL);'
/*-----------------------------------------------------------------------*/
UNION
SELECT CONCAT(
'UPDATE piping.taxa SET taxa.gsd_short_name = CONCAT_WS(", ", "',

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),

'", taxa.gsd_short_name',

') WHERE taxa.matched_by IS NULL AND `class` IN("',

 GROUP_CONCAT(DISTINCT REPLACE(fm.`class`, '\"', '') SEPARATOR '", "'),

'");'

) 
FROM families fm
LEFT JOIN `databases` db ON db.record_id = fm.database_id
GROUP BY db.database_name 
UNION
SELECT 'UPDATE piping.taxa SET taxa.matched_by = "class" WHERE (taxa.matched_by IS NULL) AND (taxa.gsd_short_name IS NOT NULL);'
/*---------------------------------------------------------------------------*/
UNION
SELECT CONCAT(
'UPDATE piping.taxa SET taxa.gsd_short_name = CONCAT_WS(", ", "',

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),

'", taxa.gsd_short_name',

') WHERE taxa.matched_by IS NULL AND `phylum` IN("',

 GROUP_CONCAT(DISTINCT REPLACE(fm.`phylum`, '\"', '') SEPARATOR '", "'),

'");'

) 
FROM families fm
LEFT JOIN `databases` db ON db.record_id = fm.database_id
GROUP BY db.database_name 
UNION
SELECT 'UPDATE piping.taxa SET taxa.matched_by = "phylum" WHERE (taxa.matched_by IS NULL) AND (taxa.gsd_short_name IS NOT NULL);'
/*-----------------------------------------------------------------------*/
UNION
SELECT CONCAT(
'UPDATE piping.taxa SET taxa.gsd_short_name = CONCAT_WS(", ", "',

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),

'", taxa.gsd_short_name',

') WHERE taxa.matched_by IS NULL AND genus IN("',

 GROUP_CONCAT(DISTINCT REPLACE(sn.genus, '\"', '') SEPARATOR '", "'),

'");'

) 
FROM scientific_names sn
LEFT JOIN `databases` db ON db.record_id = sn.database_id
GROUP BY db.database_name 
UNION
SELECT 'UPDATE piping.taxa SET taxa.matched_by = "genus" WHERE (taxa.matched_by IS NULL) AND (taxa.gsd_short_name IS NOT NULL);'
UNION
SELECT 'UPDATE piping.taxa SET taxa.matched_by = "no match", taxa.gsd_short_name = "protoGSD" WHERE (taxa.matched_by IS NULL) AND (taxa.gsd_short_name IS NULL);'
INTO OUTFILE '/var/www/piping/backend/gsdmatch.sql' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';