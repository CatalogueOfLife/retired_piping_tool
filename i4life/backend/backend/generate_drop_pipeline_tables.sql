USE Assembly_Global_Deploy;
SELECT 'USE pipeline;'
UNION
SELECT CONCAT('DROP TABLE IF EXISTS  ', 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
';'
) 
FROM `databases` db
GROUP BY db.database_name 
UNION
SELECT 'DROP TABLE IF EXISTS protoGSD;'
INTO OUTFILE '/var/www/piping/backend/drop_pipeline_tables.sql' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';