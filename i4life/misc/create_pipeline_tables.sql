USE pipeline;
CREATE TABLE IF NOT EXISTS `3i_Cicadellinae` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `3i_Typhlocybinae` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `AFD_Pulmonata` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `AlgaeBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `AnnonBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `AphidSF` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `BdelloideaBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `BIOS` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `BlattodeaSF` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Brassicaceae` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `CCW` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ChenoBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ChiloBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `CilCat` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `CIPA` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Conifer_Database` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `COOL` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Dothideomycetes` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Droseraceae_Database` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `EbenaBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ELPT` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `EmbiopteraSF` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ETI_WBD_Euphausiacea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `FishBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `FLOW` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `FWCrabs` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `GCC` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `GloBIS_GART` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Glomeromycota` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Hexacorals` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ICTV_MSL` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ILDIS` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `IOPI_GPC` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ITIS_Bees` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ITIS_Global` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ITIS_Regional` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `LDL_Neuropterida` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `LecyPages` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `LepIndex` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `LHD` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `LIAS` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `MantodeaSF` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `MBB` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `MELnet` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `MOST` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `MOWD` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Nomen_eumycetozoa_com` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `NZIB` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Odonata` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `OlogamasidBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `OrthopteraSF` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Parhost` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `PhasmidaSF` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Phyllachorales` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `PhytoseiidBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `PlecopteraSF` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Psyllist` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `RhodacaridBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Rhytismatales` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `RJB_Geranium` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Rotifera` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Saccharomycetes` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `SalticidDB` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ScaleNet` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Scarabs` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Solanaceae_Source` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Species_2000_Common_Names` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Species_Fungorum` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `SpidCat` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `SpmWeb` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Strepsiptera_Database` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `SysMyr` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Systema_Dipterorum` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Taxapad_Ichneumonoidea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `TenuipalpidBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `TicksBase` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `TIGR_Reptiles` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Tineidae_NHM` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `TITAN` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Trichomycetes` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `UCD` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `URMO` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WCSP` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `World_Gracillariidae` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `World_Umbellifer_Database` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Asteroidea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Bochusacea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Brachiopoda` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Brachypoda` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Brachyura` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Bryozoa` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Cumacea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Echinoidea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Holothuroidea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Hydrozoa` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Isopoda` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Leptostraca` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Mystacocarida` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Nemertea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Oligochaeta` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Ophiuroidea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Phoronida` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Polychaeta` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Polycystina` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Porifera` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Proseriata_Kalyptorhynchia` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Remipedia` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Scaphopoda` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Tanaidacea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Tantulocarida` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Thermosbaenacea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WoRMS_Xenoturbellida` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `WTaxa` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Xylariaceae` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `ZOBODAT_Vespoidea` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `Zygomycetes` ( `id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` varchar(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS protoGSD (`id` int(10) unsigned NOT NULL,\
 `taxonID` varchar(12) COLLATE utf8_bin DEFAULT NULL,\
 `genus` varchar(255) COLLATE utf8_general_ci, \
`specificEpithet` varchar(255) COLLATE utf8_general_ci,\
 `scientificNameAuthorship` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `infraspecificEpithet` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `verbatimTaxonRank` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonomicStatus` varchar(45) COLLATE utf8_general_ci DEFAULT NULL,\
 `acceptedNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `parentNameUsageID` varchar(12) COLLATE utf8_general_ci DEFAULT NULL,\
 `family` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `ordo` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `class` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `phylum` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `kingdom` varchar(255) COLLATE utf8_general_ci DEFAULT NULL, \
`higherClassification` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `namePublishedIn` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRemarks` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
 `source` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `updated` timestamp,\
 `provider` tinyint(24),\
 `gsd_comments` varchar(500) COLLATE utf8_general_ci DEFAULT NULL,\
`gsd_comments_predefined` enum("comment 1","comment 2","comment 3") COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_short_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `gsd_status` enum("Approved","Rejected") DEFAULT NULL,\
 `history_status` int(10) DEFAULT NULL,\
 `history_comments` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
`tag` varchar(32) COLLATE utf8_bin,\
 `scientificName` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,\
 `taxonRank` varchar(24) COLLATE utf8_general_ci DEFAULT NULL, \
`matched_by` varchar(8) COLLATE utf8_general_ci DEFAULT NULL,\
 PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
