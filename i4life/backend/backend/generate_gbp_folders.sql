USE piping;

SELECT 'rm -r ../webservice/gbp/* ;'
UNION
SELECT CONCAT('mkdir ../webservice/gbp/', usr.username, '; cp -rp ../shell/skel/new_gbp/*', ' ../webservice/gbp/',usr.username,'/;')
FROM `user` usr WHERE username != 'admin'
UNION
SELECT 'find ../webservice/gbp -type d -print0 | xargs -0 chmod 777;'
UNION
SELECT CONCAT(" cp -p ../shell/skel/new_gbp/.htaccess ../webservice/gbp/",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(usr.username, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
"/;") FROM `user` usr WHERE username != 'admin'
INTO OUTFILE '/var/www/piping/backend/create_gbp_folders.sh' FIELDS TERMINATED BY ' ' ESCAPED BY '' LINES TERMINATED BY '\n';