CREATE TABLE `pro_piping_tools`.`user` (
  `userid` SMALLINT(5) UNSIGNED ZEROFILL NOT NULL ,
  `username` VARCHAR(16) NOT NULL ,
  `password` VARCHAR(16) NULL DEFAULT NULL ,
  `role` ENUM('admin', 'GBP', 'GSD') NOT NULL ,
  PRIMARY KEY (`userid`) )
ENGINE = MyISAM
DEFAULT CHARSET = utf8;

-- Set admin as first username with default password same as username
INSERT INTO `pro_piping_tools`.`user` VALUES (0, 'admin', 'adpexzg3FUZAk', 'admin');


CREATE TABLE `pro_piping_tools`.`taxa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `genus` varchar(45) NOT NULL,
  `species_epithet` varchar(45) NOT NULL,
  `infraspecies` varchar(50) DEFAULT NULL,
  `infraspecies_marker` varchar(50) DEFAULT NULL,
  `author_string` varchar(45) DEFAULT NULL,
  `family` varchar(45) DEFAULT NULL,
  `order` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `phylum` varchar(45) DEFAULT NULL,
  `kingdom` varchar(50) DEFAULT NULL,
  `provider_hints` varchar(255) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of the last update',
  `provider_id` tinyint(3) unsigned NOT NULL COMMENT 'ID of provider as in providers table',
  `gsd_comments` text COMMENT 'feedback from gsds',
  `gsd_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of GSD for which the name has been assigned',
  `gsd_status` tinyint(1) DEFAULT NULL COMMENT 'Accepter or Rejected. Explanation of decision is stored in gsd_comments',
  `history_status` integer(10) DEFAULT NULL COMMENT 'Indicates how many times species name appeared in providers list (even if it was accepted or rejected by GSDs before)',
  `history_comments` varchar(255) DEFAULT NULL COMMENT 'Explains history_status - possibly discussion between provider, GSD and the COL)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
