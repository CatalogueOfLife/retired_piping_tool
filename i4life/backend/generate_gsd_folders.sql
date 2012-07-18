USE Assembly_Global_Deploy;

SELECT 'rm -r ../webservice/gsd/* ;'
UNION
SELECT CONCAT("mkdir ../webservice/gsd/",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
"; #cp -p ../shell/skel/new_gsd/piping.txt ../webservice/gsd/",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
"/;\n"
)
FROM `databases` db
GROUP BY db.database_name
UNION
SELECT CONCAT('mkdir ../webservice/gsd/protoGSD; cp -p ../shell/skel/new_gsd/.htaccess ../webservice/gsd/protoGSD/;')
UNION
SELECT 'find ../webservice/gsd -type d -print0 | xargs -0 chmod 777;'
UNION
SELECT CONCAT(" cp -p ../shell/skel/new_gsd/.htaccess ../webservice/gsd/",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
"/;")
FROM `databases` db
GROUP BY db.database_name
INTO OUTFILE '/var/www/piping/backend/create_gsd_folders.sh' FIELDS TERMINATED BY ' ' ESCAPED BY '' LINES TERMINATED BY '\n';