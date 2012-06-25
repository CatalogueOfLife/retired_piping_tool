USE Assembly_Global_Deploy;
SELECT 'USE pipeline';
UNION
SELECT CONCAT('DROP TABLE IF EXISTS  ', 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
 ' SELECT * FROM taxa WHERE gsd_short_name LIKE "%',
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
'%;'
) 
FROM `databases` db
GROUP BY db.database_name 
INTO OUTFILE '/var/www/piping2012/misc/gsdpipe.sql' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';