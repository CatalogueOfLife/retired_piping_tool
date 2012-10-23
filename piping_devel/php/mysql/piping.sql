CREATE TABLE `piping_devel`.`user` (
	`userid` SMALLINT(5) UNSIGNED ZEROFILL NOT NULL ,
	`username` VARCHAR(16) NOT NULL ,
	`password` VARCHAR(16) NULL DEFAULT NULL ,
	`role` ENUM('admin', 'GBP', 'GSD') NOT NULL ,
	`down_load_url` VARCHAR(256) NULL DEFAULT NULL ,
	`taxa_file` VARCHAR(128) NULL DEFAULT NULL ,
	`inputField` varchar(512) NULL DEFAULT NULL ,
	`delimitor` ENUM('comma', 'semicolon', 'tab', 'space') NULL DEFAULT NULL ,
	`enclose_by` ENUM('d_quote', 's_quote', 'none') NULL DEFAULT NULL ,
	`no_first_row` tinyint(1) DEFAULT NULL ,
	`mysql_script` VARCHAR(32768) NULL DEFAULT NULL ,
	`mysql_where` VARCHAR(16384) NULL DEFAULT NULL ,
	PRIMARY KEY (`userid`) )
ENGINE = MyISAM
DEFAULT CHARSET = utf8 COLLATE utf8_general_ci;

-- Set admin as first username with default password same as username
-- Initialise default settings for all the users
INSERT INTO `piping_devel`.`user` VALUES 
	(0, 'admin', 'adpexzg3FUZAk', 'admin',
	'',
	'upload.csv',
	'taxonID:genus:specificEpithet:scientificNameAuthorship:taxonomicStatus:acceptedNameUsageID:tag',
	'tab', 'd_quote', '1',
	'INSERT INTO taxa (
		`taxonID`,
		`genus`,
		`specificEpithet`,
		`scientificName`,
		`scientificNameAuthorship`, `taxonomicStatus`, `acceptedNameUsageID`,
		`history_status`,
		`tag`, `provider_id`)
	SELECT
		`taxonID`,
		CONCAT(	UCASE(LEFT(`genus`,1)),
				LOWER(SUBSTRING(`genus`,2))),
		`specificEpithet`, 
		CONCAT_WS(	" ",
					CONCAT(	UCASE(LEFT(`genus`,1)),
					LOWER(SUBSTRING(`genus`,2))),
					`specificEpithet`),
		`scientificNameAuthorship`, `taxonomicStatus`, `acceptedNameUsageID`,
		1,
		`tag`, `provider_id`
	FROM xmap
	ON DUPLICATE KEY UPDATE
		`history_status`=`history_status`+1,
		`history_comments`=`history_comments`,
		`gsd_comments`=`gsd_comments`,
		`gsd_short_name`=`gsd_short_name`,
		`gsd_status`=`gsd_status`,
		`in_col`=`in_col`',
	''),

	(1, 'ENA', 'ENeKNcUZ6h1Eg', 'GBP',
	'ftp://ftp.ebi.ac.uk/pub/databases/ena/taxonomy/sdwca/ena.zip',
	'taxa.txt',
	'taxonID:scientificName:acceptedNameUsageID:parentNameUsageID:higherClassification:superKingdom:kingdom:superphylum:phylum:subphylum:superclass:class:subclass:infraclass:superorder:order:suborder:infraorder:parvorder:superfamily:family:subfamily:tribe:subtribe:genus:subgenus:specificEpithet:infraspecificEpithet:infrasubspecificEpithet:identificationQualifier:taxonRank:verbatimTaxonRank:scientificNameAuthorship:taxonomicStatus',
	'tab', 'none', '1',
	'INSERT INTO taxa (
		`taxonID`,
		`scientificName`,
		`acceptedNameUsageID`,
		`parentNameUsageID`, `higherClassification`,
		`kingdom`,
		`phylum`,
		`class`,
		`order`,
		`family`, 
		`genus`,
		`specificEpithet`, 
		`infraspecificEpithet`, `taxonRank`, `verbatimTaxonRank`,
		`scientificNameAuthorship`, `taxonomicStatus`,
		`history_status`,
		`tag`, `provider_id`)
	 SELECT 
		`taxonID`,
		CONCAT(	UCASE(LEFT(`scientificName`,1)),
				LOWER(SUBSTRING(`scientificName`,2))),
		`acceptedNameUsageID`,
		`parentNameUsageID`, `higherClassification`,
		CONCAT(	UCASE(LEFT(`kingdom`,1)),
				LOWER(SUBSTRING(`kingdom`,2))),
		CONCAT(	UCASE(LEFT(`phylum`,1)),
				LOWER(SUBSTRING(`phylum`,2))),
		CONCAT(	UCASE(LEFT(`class`,1)),
				LOWER(SUBSTRING(`class`,2))),
		CONCAT(	UCASE(LEFT(`order`,1)),
				LOWER(SUBSTRING(`order`,2))),
		CONCAT(	UCASE(LEFT(`family`,1)),
				LOWER(SUBSTRING(`family`,2))),
		CONCAT(	UCASE(LEFT(`genus`,1)),
				LOWER(SUBSTRING(`genus`,2))),
		LOWER(`specificEpithet`),
		LOWER(`infraspecificEpithet`), `taxonRank`, `verbatimTaxonRank`,
		`scientificNameAuthorship`, `taxonomicStatus`,
		1,
		`tag`, `provider_id`
	FROM ENA
	WHERE `taxonRank` IN ("species", "subspecies", "strain", "no rank",
						  "varietas", "forma", "species group",
						  "species subgroup")
					  AND `scientificName` NOT LIKE "% sp."
	ON DUPLICATE KEY UPDATE
		`history_status`=`history_status`+1,
		`history_comments`=`history_comments`,
		`gsd_comments`=`gsd_comments`,
		`gsd_short_name`=`gsd_short_name`,
		`gsd_status`=`gsd_status`,
		`in_col`=`in_col`',
	'WHERE `taxonRank` IN ("species", "subspecies", "strain", "no rank",
						  "varietas", "forma", "species group",
						  "species subgroup")
					  AND `scientificName` NOT LIKE "% sp." '),

	(2, 'CBOL', 'CB0whgZAKeI2M', 'GBP',
	'http://i4life.museum.miiz.eu/piping/LATEST',
	'taxa.txt',
	'taxonID:datasetID:datasetName:scientificName:genus:specificEpithet:scientificNameAuthorship:verbatimTaxonRank:taxonomicStatus:taxonRank:acceptedNameUsageID:family:order',
	'tab', 'none', '1',
	'INSERT INTO taxa (
		`taxonID`,
		`scientificName`,
		`acceptedNameUsageID`,
		`order`,
		`family`,
		`genus`,
		`specificEpithet`, `taxonRank`, `verbatimTaxonRank`,
		`scientificNameAuthorship`, `taxonomicStatus`,
		`history_status`,
		`tag`, `provider_id`)
	 SELECT DISTINCT
		`taxonID`,
		CONCAT(	UCASE(LEFT(`scientificName`,1)),
				LOWER(SUBSTRING(`scientificName`,2))),
		`acceptedNameUsageID`,
		CONCAT(	UCASE(LEFT(`order`,1)),
				LOWER(SUBSTRING(`order`,2))),
		CONCAT(	UCASE(LEFT(`family`,1)),
				LOWER(SUBSTRING(`family`,2))),
		CONCAT(	UCASE(LEFT(`genus`,1)),
				LOWER(SUBSTRING(`genus`,2))),
		LOWER(`specificEpithet`), `taxonRank`, `verbatimTaxonRank`,
		`scientificNameAuthorship`, `taxonomicStatus`,
		1,
		`tag`, `provider_id`
	FROM CBOL
	ON DUPLICATE KEY UPDATE
		`history_status`=`history_status`+1,
		`history_comments`=`history_comments`,
		`gsd_comments`=`gsd_comments`,
		`gsd_short_name`=`gsd_short_name`,
		`gsd_status`=`gsd_status`,
		`in_col`=`in_col`',
	''),

	(3, 'GBIF', 'GBkc/wg1v/zMg', 'GBP',
	'http://ecat-dev.gbif.org/repository/export/checklist1-noncol.zip',
	'taxon.txt',
	'taxonID:parentNameUsageID:acceptedNameUsageID:scientificName:canonicalName:taxonRank:taxonomicStatus:nomenclaturalStatus:genus:specificEpithet:infraspecificEpithet:namePublishedIn:nameAccordingTo:kingdom:phylum:class:order:family:indexedOccurrenceCount:datasetCount:countryCount',
	'tab', 'none', '0',
	'INSERT INTO taxa (
		`taxonID`,
		`scientificName`,
		`taxonomicStatus`, `acceptedNameUsageID`, `parentNameUsageID`,
		`kingdom`,
		`phylum`,
		`class`,
		`order`,
		`family`,
		`genus`,
		`specificEpithet`, `infraspecificEpithet`, 
		`namePublishedIn`, `taxonRank`,
		`history_status`,
		`tag`, `provider_id`)
	 SELECT
		`taxonID`,
		CONCAT(	UCASE(LEFT(`scientificName`,1)),
				LOWER(SUBSTRING(`scientificName`,2))),
		`taxonomicStatus`, `acceptedNameUsageID`, `parentNameUsageID`,
		CONCAT(	UCASE(LEFT(`kingdom`,1)),
				LOWER(SUBSTRING(`kingdom`,2))),
		CONCAT(	UCASE(LEFT(`phylum`,1)),
				LOWER(SUBSTRING(`phylum`,2))),
		CONCAT(	UCASE(LEFT(`class`,1)),
				LOWER(SUBSTRING(`class`,2))),
		CONCAT(	UCASE(LEFT(`order`,1)),
				LOWER(SUBSTRING(`order`,2))),
		CONCAT(	UCASE(LEFT(`family`,1)),
				LOWER(SUBSTRING(`family`,2))),
		CONCAT(	UCASE(LEFT(`genus`,1)),
				LOWER(SUBSTRING(`genus`,2))),
		LOWER(`specificEpithet`), LOWER(`infraspecificEpithet`),
		`namePublishedIn`, `taxonRank`,
		1,
		`tag`, `provider_id`
	FROM GBIF
	ON DUPLICATE KEY UPDATE
		`history_status`=`history_status`+1,
		`history_comments`=`history_comments`,
		`gsd_comments`=`gsd_comments`,
		`gsd_short_name`=`gsd_short_name`,
		`gsd_status`=`gsd_status`,
		`in_col`=`in_col`',
	''),

	(4, 'IUCN', 'IUWYwHMqLgqtg', 'GBP',
	'http://map3d.iucn.org:8080/ipt/archive.do?r=redlist',
	'taxon.txt',
	'taxonID:class:genus:phylum:family:acceptedNameUsageID:bibliographicCitation:taxonRank:order:scientificName:scientificNameAuthorship:kingdom',
	'tab', 'none', '0',
	'UPDATE IUCN SET taxonomicStatus = "accepted"
	WHERE acceptedNameUsageID = "" ;
	UPDATE IUCN SET taxonomicStatus = "synonym"
	WHERE acceptedNameUsageID != "" ;
	UPDATE IUCN SET acceptedNameUsageID = taxonID
	WHERE acceptedNameUsageID = "" ;
	INSERT INTO taxa (
		`taxonID`,
		`scientificName`,
		`acceptedNameUsageID`,
		`kingdom`,
		`phylum`,
		`class`,
		`order`,
		`family`,
		`genus`,
		`taxonRank`,
		`scientificNameAuthorship`, `taxonRemarks`,
		`history_status`,
		`tag`,
		`provider_id`, `taxonomicStatus`)
	 SELECT
		`taxonID`,
		CONCAT(	UCASE(LEFT(`scientificName`,1)),
				LOWER(SUBSTRING(`scientificName`,2))),
		`acceptedNameUsageID`,
		CONCAT(	UCASE(LEFT(`kingdom`,1)),
				LOWER(SUBSTRING(`kingdom`,2))),
		CONCAT(	UCASE(LEFT(`phylum`,1)),
				LOWER(SUBSTRING(`phylum`,2))),
		CONCAT(	UCASE(LEFT(`class`,1)),
				LOWER(SUBSTRING(`class`,2))),
		CONCAT(	UCASE(LEFT(`order`,1)),
				LOWER(SUBSTRING(`order`,2))),
		CONCAT(	UCASE(LEFT(`family`,1)),
				LOWER(SUBSTRING(`family`,2))),
		CONCAT(	UCASE(LEFT(`genus`,1)),
				LOWER(SUBSTRING(`genus`,2))),
		`taxonRank`,
		`scientificNameAuthorship`, `bibliographicCitation`,
		1,
		`tag`,
		`provider_id`, `taxonomicStatus`
	FROM IUCN
	ON DUPLICATE KEY UPDATE
		`history_status`=`history_status`+1,
		`history_comments`=`history_comments`,
		`gsd_comments`=`gsd_comments`,
		`gsd_short_name`=`gsd_short_name`,
		`gsd_status`=`gsd_status`,
		`in_col`=`in_col`',
	''),

	(5, 'Mycobank', 'MyHCa9rzBeDPk', 'GBP',
	'', '', '', '', '', '1', '', ''),

	(6, 'BOLD', 'BOgQCnq7OW9e6', 'GBP',
	'',
	'upload.csv',
	'IDPhylum:phylum:IDClass:class:IDOrder:order:IDFamily:family:IDSubfamily:subfamily:IDGenus:genus:IDSpecies:species',
	'tab', 'none', '0',
	'INSERT INTO taxa (
		`taxonID`, `genus`, `phylum`, `class`, `order`, `family`, 
		`scientificName`,
		`history_status`,
		`tag`, `provider_id`)
	SELECT DISTINCT
		`IDspecies`, `genus`, `phylum`, `class`, `order`, `family`, 
		`species`,
		1,
		`tag`, `provider_id`
	FROM BOLD
	WHERE IDSpecies > 0 
	ON DUPLICATE KEY UPDATE
		`history_status`=`history_status`+1,
		`history_comments`=`history_comments`,
		`gsd_comments`=`gsd_comments`,
		`gsd_short_name`=`gsd_short_name`,
		`gsd_status`=`gsd_status`,
		`in_col`=`in_col`',
	'WHERE IDSpecies > 0 '),

	(7, 'EoL', 'Eo0HA9IhNIWRE', 'GBP',
	'https://dl.dropbox.com/u/1355101/eol_trees_and_links.txt.tar.gz',
	'eol_trees_and_links.txt',
	'EoLPageID:hierarchyNodeID:name:parentEoLPageID:parentHierarchyNodeID:EoLPageRichnessScore:rank:partnerTaxonIdentifier:partnerName:partnerURL',

	'tab', 'none', '0',
	'INSERT INTO taxa (
		`taxonID`, `genus`, `phylum`, `class`, `order`, `family`, 
		`scientificName`,
		`history_status`,
		`tag`, `provider_id`)
	SELECT DISTINCT
		`IDspecies`, `genus`, `phylum`, `class`, `order`, `family`, 
		`species`,
		1,
		`tag`, `provider_id`
	FROM EoL
	WHERE IDSpecies > 0 
	ON DUPLICATE KEY UPDATE
		`history_status`=`history_status`+1,
		`history_comments`=`history_comments`,
		`gsd_comments`=`gsd_comments`,
		`gsd_short_name`=`gsd_short_name`,
		`gsd_status`=`gsd_status`,
		`in_col`=`in_col`',
	'');

CREATE TABLE `piping_devel`.`taxa` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`taxonID` varchar(12) CHARACTER SET utf8 DEFAULT NULL
		COMMENT 'We do not know what type of identifiers are used by
		providers. Providers may refuse to provide their identifiers.',
	`genus` varchar(255) NOT NULL,
	`specificEpithet` varchar(255) NOT NULL,
	`scientificNameAuthorship` varchar(255) CHARACTER SET utf8
		COLLATE utf8_general_ci DEFAULT NULL,
	`infraspecificEpithet` varchar(255) DEFAULT NULL,
	`verbatimTaxonRank` varchar(12) DEFAULT NULL,
	`taxonomicStatus` varchar(45) DEFAULT NULL,
	`acceptedNameUsageID` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin
		DEFAULT NULL,
	`parentNameUsageID` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin
		DEFAULT NULL,
	`family` varchar(255) DEFAULT NULL,
	`order` varchar(255) DEFAULT NULL,
	`class` varchar(255) DEFAULT NULL,
	`phylum` varchar(255) DEFAULT NULL,
	`kingdom` varchar(255) DEFAULT NULL,
	`higherClassification` varchar(500) DEFAULT NULL,
	`namePublishedIn` varchar(500) DEFAULT NULL,
	`taxonRemarks` varchar(500) DEFAULT NULL,
	`source` varchar(255) DEFAULT NULL,
	`updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE
		CURRENT_TIMESTAMP
		COMMENT 'timestamp of the last update',
	`provider_id` tinyint(3) unsigned NOT NULL
		COMMENT 'ID of provider as in providers table',
	`gsd_comments` varchar(500) DEFAULT NULL COMMENT 'feedback from gsds',
	`gsd_comments_predefined` varchar(500) DEFAULT NULL,
	`gsd_short_name` varchar(150) DEFAULT NULL
		COMMENT 'abbreviation of GSD for which the name has been assigned',
	`gsd_status` varchar(45) DEFAULT NULL
		COMMENT 'Accepter or Rejected. Explanation of decision is stored
		in gsd_comments',
	`history_status` int(10) DEFAULT NULL
		COMMENT 'Indicates how many times species name appeared in providers
		list (even if it was accepted or rejected by GSDs before)',
	`history_comments` varchar(255) DEFAULT NULL
		COMMENT 'Explains history_status - possibly discussion between
		provider, GSD and the COL',
	`tag` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
	`scientificName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci
		DEFAULT NULL,
	`taxonRank` varchar(24) DEFAULT NULL,
	`in_col` tinyint(3) unsigned DEFAULT NULL,
	`matched_by` varchar(8) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `scname_provider` (`scientificName`,`provider_id`),
	KEY `scientificName10` (`scientificName`(10)),
	KEY `genera` (`genus`),
	KEY `families` (`family`),
	KEY `orders` (`order`),
	KEY `classes` (`class`),
	KEY `phyla` (`phylum`),
	KEY `taxonID` (`taxonID`) 
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

/*
ALTER TABLE taxa ADD CONSTRAINT scname_provider UNIQUE (
	`scientificName`,
	`provider_id`
);
*/

/*
CREATE TABLE `piping_devel`.`CBOL` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`taxonID` varchar(12) DEFAULT NULL
		COMMENT 'We do not know what type of identifiers are used by
		providers. Providers may refuse to provide their identifiers.',
	`genus` varchar(255) NOT NULL,
	`specificEpithet` varchar(255) NOT NULL,
	`scientificNameAuthorship` varchar(255) DEFAULT NULL,
	`infraspecificEpithet` varchar(255) DEFAULT NULL,
	`verbatimTaxonRank` varchar(12) DEFAULT NULL,
	`taxonomicStatus` varchar(45) DEFAULT NULL,
	`acceptedNameUsageID` varchar(12) DEFAULT NULL,
	`parentNameUsageID` varchar(12) DEFAULT NULL,
	`family` varchar(255) DEFAULT NULL,
	`order` varchar(255) DEFAULT NULL,
	`class` varchar(255) DEFAULT NULL,
	`phylum` varchar(255) DEFAULT NULL,
	`kingdom` varchar(255) DEFAULT NULL,
	`higherClassification` varchar(500) DEFAULT NULL,
	`namePublishedIn` varchar(500) DEFAULT NULL,
	`taxonRemarks` varchar(500) DEFAULT NULL,
	`source` varchar(255) DEFAULT NULL,
	`provider_id` tinyint(3) unsigned NOT NULL,
	`tag` varchar(32) NOT NULL,
	`scientificName` varchar(255) DEFAULT NULL,
	`taxonRank` varchar(24) DEFAULT NULL,
	`datasetID` varchar(32) DEFAULT NULL,
	`datasetName` varchar(32) DEFAULT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `piping_devel`.`ENA` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`taxonID` varchar(12) DEFAULT NULL
		COMMENT 'We do not know what type of identifiers are used by
		providers. Providers may refuse to provide their identifiers.',
	`genus` varchar(255) NOT NULL,
	`specificEpithet` varchar(255) NOT NULL,
	`scientificNameAuthorship` varchar(255) DEFAULT NULL,
	`infraspecificEpithet` varchar(255) DEFAULT NULL,
	`verbatimTaxonRank` varchar(12) DEFAULT NULL,
	`taxonomicStatus` varchar(45) DEFAULT NULL,
	`acceptedNameUsageID` varchar(12) DEFAULT NULL,
	`parentNameUsageID` varchar(12) DEFAULT NULL,
	`family` varchar(255) DEFAULT NULL,
	`order` varchar(255) DEFAULT NULL,
	`class` varchar(255) DEFAULT NULL,
	`phylum` varchar(255) DEFAULT NULL,
	`kingdom` varchar(255) DEFAULT NULL,
	`higherClassification` varchar(500) DEFAULT NULL,
	`namePublishedIn` varchar(500) DEFAULT NULL,
	`taxonRemarks` varchar(500) DEFAULT NULL,
	`source` varchar(255) DEFAULT NULL,
	`provider_id` tinyint(3) unsigned NOT NULL,
	`tag` varchar(32) NOT NULL,
	`scientificName` varchar(255) DEFAULT NULL,
	`taxonRank` varchar(24) DEFAULT NULL,
	`acceptedNameUsage` varchar(255) DEFAULT NULL,
	`parentNameUsage` varchar(255) DEFAULT NULL,
	`superKingdom` varchar(255) DEFAULT NULL,
	`subgenus` varchar(255) DEFAULT NULL,
	`identificationQualifier` varchar(255) DEFAULT NULL,
	`vernacularName` varchar(255) DEFAULT NULL,
	`superphylum` varchar(255) DEFAULT NULL,
	`subphylum` varchar(255) DEFAULT NULL,
	`superclass` varchar(255) DEFAULT NULL,
	`subclass` varchar(255) DEFAULT NULL,
	`infraclass` varchar(255) DEFAULT NULL,
	`superorder` varchar(255) DEFAULT NULL,
	`suborder` varchar(255) DEFAULT NULL,
	`infraorder` varchar(255) DEFAULT NULL,
	`parvorder` varchar(255) DEFAULT NULL,
	`superfamily` varchar(255) DEFAULT NULL,
	`subfamily` varchar(255) DEFAULT NULL,
	`tribe` varchar(255) DEFAULT NULL,
	`subtribe` varchar(255) DEFAULT NULL,
	`infrasubspecificEpithet` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `piping_devel`.`GBIF` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`taxonID` varchar(12) DEFAULT NULL
		COMMENT 'We do not know what type of identifiers are used by
		providers. Providers may refuse to provide their identifiers.',
	`genus` varchar(255) NOT NULL,
	`specificEpithet` varchar(255) NOT NULL,
	`scientificNameAuthorship` varchar(255) DEFAULT NULL,
	`infraspecificEpithet` varchar(255) DEFAULT NULL,
	`verbatimTaxonRank` varchar(12) DEFAULT NULL,
	`taxonomicStatus` varchar(45) DEFAULT NULL,
	`acceptedNameUsageID` varchar(12) DEFAULT NULL,
	`parentNameUsageID` varchar(12) DEFAULT NULL,
	`family` varchar(255) DEFAULT NULL,
	`order` varchar(255) DEFAULT NULL,
	`class` varchar(255) DEFAULT NULL,
	`phylum` varchar(255) DEFAULT NULL,
	`kingdom` varchar(255) DEFAULT NULL,
	`higherClassification` varchar(500) DEFAULT NULL,
	`namePublishedIn` varchar(500) DEFAULT NULL,
	`taxonRemarks` varchar(500) DEFAULT NULL,
	`source` varchar(255) DEFAULT NULL,
	`provider_id` tinyint(3) unsigned NOT NULL,
	`tag` varchar(32) NOT NULL,
	`scientificName` varchar(255) DEFAULT NULL,
	`taxonRank` varchar(24) DEFAULT NULL,
	`canonicalName` varchar(255) NOT NULL,
	`nomenclaturalStatus` varchar(45) DEFAULT NULL,
	`nameAccordingTo` varchar(500) DEFAULT NULL,
	`indexedOccurrenceCount` int(10) unsigned DEFAULT NULL,
	`datasetCount` int(10) unsigned DEFAULT NULL,
	`countryCount` int(10) unsigned DEFAULT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `piping_devel`.`IUCN` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`taxonID` varchar(12) DEFAULT NULL
		COMMENT 'We do not know what type of identifiers are used by
		providers. Providers may refuse to provide their identifiers.',
	`genus` varchar(255) NOT NULL,
	`specificEpithet` varchar(255) NOT NULL,
	`scientificNameAuthorship` varchar(255) DEFAULT NULL,
	`infraspecificEpithet` varchar(255) DEFAULT NULL,
	`verbatimTaxonRank` varchar(12) DEFAULT NULL,
	`taxonomicStatus` varchar(45) DEFAULT NULL,
	`acceptedNameUsageID` varchar(12) DEFAULT NULL,
	`parentNameUsageID` varchar(12) DEFAULT NULL,
	`family` varchar(255) DEFAULT NULL,
	`order` varchar(255) DEFAULT NULL,
	`class` varchar(255) DEFAULT NULL,
	`phylum` varchar(255) DEFAULT NULL,
	`kingdom` varchar(255) DEFAULT NULL,
	`higherClassification` varchar(500) DEFAULT NULL,
	`namePublishedIn` varchar(500) DEFAULT NULL,
	`taxonRemarks` varchar(500) DEFAULT NULL,
	`source` varchar(255) DEFAULT NULL,
	`provider_id` tinyint(3) unsigned NOT NULL,
	`tag` varchar(32) NOT NULL,
	`scientificName` varchar(255) DEFAULT NULL,
	`taxonRank` varchar(24) DEFAULT NULL,
	`bibliographicCitation` varchar(500) DEFAULT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `piping_devel`.`xmap` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`taxonID` varchar(12) DEFAULT NULL
		COMMENT 'We do not know what type of identifiers are used by
		providers. Providers may refuse to provide their identifiers.',
	`genus` varchar(255) NOT NULL,
	`specificEpithet` varchar(255) NOT NULL,
	`scientificNameAuthorship` varchar(255) DEFAULT NULL,
	`taxonomicStatus` varchar(45) DEFAULT NULL,
	`acceptedNameUsageID` varchar(12) DEFAULT NULL,
	`tag` varchar(32) NOT NULL,
	`provider_id` tinyint(3) unsigned NOT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
*/

CREATE TABLE `piping_devel`.`BOLD` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`IDPhylum` int(10) unsigned DEFAULT NULL,
	`phylum` varchar(255) DEFAULT NULL,
	`IDClass` int(10) unsigned DEFAULT NULL,
	`class` varchar(255) DEFAULT NULL,
	`IDOrder` int(10) unsigned DEFAULT NULL,
	`order` varchar(255) DEFAULT NULL,
	`IDFamily` int(10) unsigned DEFAULT NULL,
	`family` varchar(255) DEFAULT NULL,
	`IDSubfamily` int(10) unsigned DEFAULT NULL,
	`subfamily` varchar(255) DEFAULT NULL,
	`IDGenus` int(10) unsigned DEFAULT NULL,
	`genus` varchar(255) NOT NULL,
	`IDSpecies` int(10) unsigned DEFAULT NULL,
	`species` varchar(255) DEFAULT NULL,
	`provider_id` tinyint(3) unsigned NOT NULL,
	`tag` varchar(32) NOT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `piping_devel`.`EoL` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`EoLPageID` int(10) unsigned DEFAULT NULL,
	`hierarchyNodeID` int(10) unsigned DEFAULT NULL,
	`name` varchar(255) DEFAULT NULL,
	`parentEoLPageID` int(10) unsigned DEFAULT NULL,
	`parentHierarchyNodeID` int(10) unsigned DEFAULT NULL,
	`EoLPageRichnessScore` float(5,2) unsigned DEFAULT NULL,
	`rank` varchar(255) DEFAULT NULL,
	`partnerTaxonIdentifier` varchar(255) DEFAULT NULL,
	`partnerName` varchar(255) DEFAULT NULL,
	`partnerURL` varchar(255) DEFAULT NULL,
	`provider_id` tinyint(3) unsigned NOT NULL,
	`tag` varchar(32) NOT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `piping_devel`.`taxa_available` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`genus` varchar(50) NOT NULL,
	`genus_index` varchar(50) NOT NULL,
	`specificEpithet` varchar(60) NOT NULL,
	`scientificName` varchar(255) NOT NULL,
	`family` varchar(50) DEFAULT NULL,
	`order` varchar(50) DEFAULT NULL,
	`class` varchar(50) DEFAULT NULL,
	`phylum` varchar(50) DEFAULT NULL,
	`kingdom` varchar(50) DEFAULT NULL,
	`gsd_id` int(10) unsigned NOT NULL,
	`gsd_short_name` varchar(150) DEFAULT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `piping_devel`.`taxa_available_compressed` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`genus` varchar(50) NOT NULL,
	`gsd_id` int(10) unsigned NOT NULL,
	`gsd_short_name` varchar(150) DEFAULT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `piping_devel`.`taxa_gsd` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`tax_id` int(10) unsigned NOT NULL,
	`scientificName` varchar(255) DEFAULT NULL,
	`genus` varchar(50) NOT NULL,
	`gsd_id` int(10) unsigned NOT NULL,
	`gsd_short_name` varchar(150) DEFAULT NULL,
	`gsd_comments` varchar(500) COMMENT 'feedback from gsds',
	PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
