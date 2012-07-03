USE Assembly_Global_Deploy;
SELECT 'USE pipeline;'
UNION
SELECT CONCAT(
'DROP TRIGGER IF EXISTS  `', 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
'`;'
) 
FROM `databases` db
GROUP BY db.database_name 
UNION
SELECT 'DROP TRIGGER IF EXISTS  `protoGSD`;'
UNION
SELECT 'DELIMITER $$'
UNION
SELECT CONCAT('CREATE TRIGGER `',
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
'` AFTER UPDATE ON `',
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.database_name, ' ', '_'), '-', '_'),'\.', '_'), '&_', ''), '\(', ''), '\)', ''),
'` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;'
)
FROM `databases` db
GROUP BY db.database_name
UNION
SELECT 'CREATE TRIGGER protoGSD AFTER UPDATE ON protoGSD FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT_WS(OLD.gsd_comments, "\n protoGSD [", NOW(),"]: ",NEW.gsd_comments), 
gsd_status = CONCAT_WS(OLD.gsd_status, " protoGSD: ", NEW.gsd_status, ";"),
WHERE piping.taxa.id = OLD.id;

END;'
UNION
SELECT '$$'
INTO OUTFILE '/var/www/piping/backend/create_pipeline_triggers.sql' FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n';