USE Assembly_Global_Deploy;
SELECT "USE pipeline;"
UNION
SELECT CONCAT('TRUNCATE TABLE ', 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
';'
) 
FROM `databases` db
GROUP BY db.database_name 
UNION
SELECT 'TRUNCATE TABLE protoGSD;'
INTO OUTFILE '/var/www/piping/backend/truncate_pipeline_tables.sql' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';