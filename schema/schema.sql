CREATE TABLE `piping_tools`.`taxa` (
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
/*Table stores input of names from providers and feedback from GSDs.
Data from providers are appended to the table. Later on processing is done to find if there are repeating names.
During the processing redundant (new names only) records should be deleted, and history_status for the original name updated.';*/

CREATE TABLE  `piping_tools`.`gsds` (
  `gsd_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gsd_name` varchar(255) NOT NULL,
  `gsd_short_name` varchar(48) NOT NULL COMMENT 'i.e. abreviation',
  `notes` varchar(255) DEFAULT NULL,
  `inclusion_date` date NOT NULL COMMENT 'Date when GSD has been included into the Catalogue of Life for the first time',
  PRIMARY KEY (`gsd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*Table stores list of GSDs - entities that are responsible for making decisions on name inclusion into their and the Catalogue of Life database'*/


CREATE TABLE  `piping_tools`.`gsds_taxa_assignment` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gsd_id` smallint(5) unsigned NOT NULL COMMENT 'ID of GSD',
  `taxa_name` varchar(45) NOT NULL COMMENT 'Name of family, class, phylum or kindom GSs deal with',
  `taxa_level` varchar(45) NOT NULL COMMENT 'Taxonomic level of taxa_name: identifies it as kindom, phylum, class',
  `notes` varchar(255) DEFAULT NULL COMMENT 'General notes on GSDs taxa assignement',
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*Defines many-to-many relations between different taxonomic levels in taxa table AND GSDs in gsds table'*/


CREATE TABLE  `piping_tools`.`providers` (
  `provider_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(255) NOT NULL,
  `provider_short_name` varchar(8) NOT NULL COMMENT 'i.e. abreviation of a name',
  `notes` varchar(255) DEFAULT NULL,
  `inclusion_date` date NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*Table stores list of providers of species name lists (GBIF, EOL, etc)*/


CREATE TABLE  `piping_tools`.`GBIF` (
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of data entry',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Input raw data from GBIF */

CREATE TABLE  `piping_tools`.`GBIF_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This id will be the same id in taxa table',
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last changes',
  `gsd_id` int(10) unsigned DEFAULT NULL,
  `gsd_short_name` varchar(48) DEFAULT NULL,
  `gsd_status` tinyint(1) DEFAULT NULL,
  `gsd_comments` text COMMENT 'feedback from gsds',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Feedback data for GBIF */

CREATE TABLE  `piping_tools`.`EBI` (
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of data entry',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Input raw data from EBI */

CREATE TABLE  `piping_tools`.`EBI_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This id will be the same id in taxa table',
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last changes',
  `gsd_id` int(10) unsigned DEFAULT NULL,
  `gsd_short_name` varchar(48) DEFAULT NULL,
  `gsd_status` tinyint(1) DEFAULT NULL,
  `gsd_comments` text COMMENT 'feedback from gsds',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Feedback data for EBI */

CREATE TABLE  `piping_tools`.`BOLD` (
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of data entry',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Input raw data from BOLD */

CREATE TABLE  `piping_tools`.`BOLD_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This id will be the same id in taxa table',
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last changes',
  `gsd_id` int(10) unsigned DEFAULT NULL,
  `gsd_short_name` varchar(48) DEFAULT NULL,
  `gsd_status` tinyint(1) DEFAULT NULL,
  `gsd_comments` text COMMENT 'feedback from gsds',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Feedback data for BOLD */

CREATE TABLE  `piping_tools`.`IUCN` (
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of data entry',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Input raw data from IUCN */

CREATE TABLE  `piping_tools`.`IUCN_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This id will be the same id in taxa table',
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last changes',
  `gsd_id` int(10) unsigned DEFAULT NULL,
  `gsd_short_name` varchar(48) DEFAULT NULL,
  `gsd_status` tinyint(1) DEFAULT NULL,
  `gsd_comments` text COMMENT 'feedback from gsds',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Feedback data for IUCN */

CREATE TABLE  `piping_tools`.`EDIT` (
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of data entry',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Input raw data from EDIT */

CREATE TABLE  `piping_tools`.`EDIT_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This id will be the same id in taxa table',
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
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last changes',
  `gsd_id` int(10) unsigned DEFAULT NULL,
  `gsd_short_name` varchar(48) DEFAULT NULL,
  `gsd_status` tinyint(1) DEFAULT NULL,
  `gsd_comments` text COMMENT 'feedback from gsds',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Feedback data for EDIT */

CREATE TABLE  `piping_tools`.`gsd4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This id will be the same id in taxa table',
  `genus` varchar(45) NOT NULL,
  `species_epithet` varchar(45) NOT NULL,
  `infraspecies` varchar(50) DEFAULT NULL,
  `infraspecies_marker` varchar(50) DEFAULT NULL,
  `author_string` varchar(45) DEFAULT NULL,
  `family` varchar(45) DEFAULT NULL,
  `order_` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `phylum` varchar(45) DEFAULT NULL,
  `kingdom` varchar(50) DEFAULT NULL,
  `provider_hints` varchar(255) DEFAULT NULL,
  `provided_id` varchar(45) DEFAULT NULL COMMENT 'We do not know what type of identifiers are used by providers. Providers may refuse to provide their identifiers.',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last changes',
  `gsd_status` tinyint(1) DEFAULT NULL,
  `gsd_comments` text COMMENT 'feedback from gsds',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/* Feedback data for gsd4 */

/* \$Id: schema.sql,v 1.13 2011/02/09 14:00:15 kwok Exp $ */
