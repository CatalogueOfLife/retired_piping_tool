UPDATE taxa SET genus = CONCAT(UCASE(LEFT(genus, 1)), LCASE(SUBSTRING(genus, 2)));
UPDATE taxa SET scientificName = CONCAT(UCASE(LEFT(scientificName, 1)), LCASE(SUBSTRING(scientificName, 2)));
UPDATE taxa SET scientificNameAuthorship 	= CONCAT(UCASE(LEFT(scientificNameAuthorship, 1)), LCASE(SUBSTRING(scientificNameAuthorship, 2)));
UPDATE taxa SET family 	= CONCAT(UCASE(LEFT(family, 1)), LCASE(SUBSTRING(family, 2)));
UPDATE taxa SET `order` = CONCAT(UCASE(LEFT(`order`, 1)), LCASE(SUBSTRING(`order`, 2)));
UPDATE taxa SET class = CONCAT(UCASE(LEFT(class, 1)), LCASE(SUBSTRING(class, 2)));
UPDATE taxa SET phylum = CONCAT(UCASE(LEFT(phylum, 1)), LCASE(SUBSTRING(phylum, 2)));
UPDATE taxa SET kingdom = CONCAT(UCASE(LEFT(kingdom, 1)), LCASE(SUBSTRING(kingdom, 2)));