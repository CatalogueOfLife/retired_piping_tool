USE pipeline;
DROP TRIGGER IF EXISTS  `protoGSD`;
DELIMITER $$
CREATE TRIGGER protoGSD AFTER UPDATE ON protoGSD FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET taxonRemarks = CONCAT_WS(taxonRemarks, "\n protoGSD ", NOW(),": ",NEW.gsd_comments), 
gsd_status = CONCAT_WS(gsd_status, "\n protoGSD: ", NEW.gsd_status, ";\n"), 
gsd_comments_predefined = CONCAT(NOW(), ": ", NEW.gsd_comments_predefined) WHERE piping.taxa.id = OLD.id;
END;
$$