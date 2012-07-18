USE pipeline;
DROP TRIGGER IF EXISTS  `3i_Cicadellinae`;
DROP TRIGGER IF EXISTS  `3i_Typhlocybinae`;
DROP TRIGGER IF EXISTS  `AFD_Pulmonata`;
DROP TRIGGER IF EXISTS  `AlgaeBase`;
DROP TRIGGER IF EXISTS  `AnnonBase`;
DROP TRIGGER IF EXISTS  `AphidSF`;
DROP TRIGGER IF EXISTS  `BIOS`;
DROP TRIGGER IF EXISTS  `BdelloideaBase`;
DROP TRIGGER IF EXISTS  `BlattodeaSF`;
DROP TRIGGER IF EXISTS  `Brassicaceae`;
DROP TRIGGER IF EXISTS  `CCW`;
DROP TRIGGER IF EXISTS  `CIPA`;
DROP TRIGGER IF EXISTS  `COOL`;
DROP TRIGGER IF EXISTS  `ChenoBase`;
DROP TRIGGER IF EXISTS  `ChiloBase`;
DROP TRIGGER IF EXISTS  `CilCat`;
DROP TRIGGER IF EXISTS  `Conifer_Database`;
DROP TRIGGER IF EXISTS  `Dothideomycetes`;
DROP TRIGGER IF EXISTS  `Droseraceae_Database`;
DROP TRIGGER IF EXISTS  `ELPT`;
DROP TRIGGER IF EXISTS  `ETI_WBD_Euphausiacea`;
DROP TRIGGER IF EXISTS  `EbenaBase`;
DROP TRIGGER IF EXISTS  `EmbiopteraSF`;
DROP TRIGGER IF EXISTS  `FLOW`;
DROP TRIGGER IF EXISTS  `FWCrabs`;
DROP TRIGGER IF EXISTS  `FishBase`;
DROP TRIGGER IF EXISTS  `GCC`;
DROP TRIGGER IF EXISTS  `GloBIS_GART`;
DROP TRIGGER IF EXISTS  `Glomeromycota`;
DROP TRIGGER IF EXISTS  `Hexacorals`;
DROP TRIGGER IF EXISTS  `ICTV_MSL`;
DROP TRIGGER IF EXISTS  `ILDIS`;
DROP TRIGGER IF EXISTS  `IOPI_GPC`;
DROP TRIGGER IF EXISTS  `ITIS_Bees`;
DROP TRIGGER IF EXISTS  `ITIS_Global`;
DROP TRIGGER IF EXISTS  `ITIS_Regional`;
DROP TRIGGER IF EXISTS  `LDL_Neuropterida`;
DROP TRIGGER IF EXISTS  `LHD`;
DROP TRIGGER IF EXISTS  `LIAS`;
DROP TRIGGER IF EXISTS  `LecyPages`;
DROP TRIGGER IF EXISTS  `LepIndex`;
DROP TRIGGER IF EXISTS  `MBB`;
DROP TRIGGER IF EXISTS  `MELnet`;
DROP TRIGGER IF EXISTS  `MOST`;
DROP TRIGGER IF EXISTS  `MOWD`;
DROP TRIGGER IF EXISTS  `MantodeaSF`;
DROP TRIGGER IF EXISTS  `NZIB`;
DROP TRIGGER IF EXISTS  `Nomen_eumycetozoa_com`;
DROP TRIGGER IF EXISTS  `Odonata`;
DROP TRIGGER IF EXISTS  `OlogamasidBase`;
DROP TRIGGER IF EXISTS  `OrthopteraSF`;
DROP TRIGGER IF EXISTS  `Parhost`;
DROP TRIGGER IF EXISTS  `PhasmidaSF`;
DROP TRIGGER IF EXISTS  `Phyllachorales`;
DROP TRIGGER IF EXISTS  `PhytoseiidBase`;
DROP TRIGGER IF EXISTS  `PlecopteraSF`;
DROP TRIGGER IF EXISTS  `Psyllist`;
DROP TRIGGER IF EXISTS  `RJB_Geranium`;
DROP TRIGGER IF EXISTS  `RhodacaridBase`;
DROP TRIGGER IF EXISTS  `Rhytismatales`;
DROP TRIGGER IF EXISTS  `Rotifera`;
DROP TRIGGER IF EXISTS  `Saccharomycetes`;
DROP TRIGGER IF EXISTS  `SalticidDB`;
DROP TRIGGER IF EXISTS  `ScaleNet`;
DROP TRIGGER IF EXISTS  `Scarabs`;
DROP TRIGGER IF EXISTS  `Solanaceae_Source`;
DROP TRIGGER IF EXISTS  `Species_2000_Common_Names`;
DROP TRIGGER IF EXISTS  `Species_Fungorum`;
DROP TRIGGER IF EXISTS  `SpidCat_via_ITIS`;
DROP TRIGGER IF EXISTS  `SpmWeb`;
DROP TRIGGER IF EXISTS  `Strepsiptera_Database`;
DROP TRIGGER IF EXISTS  `SysMyr`;
DROP TRIGGER IF EXISTS  `Systema_Dipterorum`;
DROP TRIGGER IF EXISTS  `TIGR_Reptiles`;
DROP TRIGGER IF EXISTS  `TITAN`;
DROP TRIGGER IF EXISTS  `Taxapad_Ichneumonoidea`;
DROP TRIGGER IF EXISTS  `TenuipalpidBase`;
DROP TRIGGER IF EXISTS  `TicksBase`;
DROP TRIGGER IF EXISTS  `Tineidae_NHM`;
DROP TRIGGER IF EXISTS  `Trichomycetes`;
DROP TRIGGER IF EXISTS  `UCD`;
DROP TRIGGER IF EXISTS  `URMO`;
DROP TRIGGER IF EXISTS  `WCSP`;
DROP TRIGGER IF EXISTS  `WTaxa`;
DROP TRIGGER IF EXISTS  `WoRMS_Asteroidea`;
DROP TRIGGER IF EXISTS  `WoRMS_Bochusacea`;
DROP TRIGGER IF EXISTS  `WoRMS_Brachiopoda`;
DROP TRIGGER IF EXISTS  `WoRMS_Brachypoda`;
DROP TRIGGER IF EXISTS  `WoRMS_Brachyura`;
DROP TRIGGER IF EXISTS  `WoRMS_Bryozoa`;
DROP TRIGGER IF EXISTS  `WoRMS_Cumacea`;
DROP TRIGGER IF EXISTS  `WoRMS_Echinoidea`;
DROP TRIGGER IF EXISTS  `WoRMS_Holothuroidea`;
DROP TRIGGER IF EXISTS  `WoRMS_Hydrozoa`;
DROP TRIGGER IF EXISTS  `WoRMS_Isopoda`;
DROP TRIGGER IF EXISTS  `WoRMS_Leptostraca`;
DROP TRIGGER IF EXISTS  `WoRMS_Mystacocarida`;
DROP TRIGGER IF EXISTS  `WoRMS_Nemertea`;
DROP TRIGGER IF EXISTS  `WoRMS_Oligochaeta`;
DROP TRIGGER IF EXISTS  `WoRMS_Ophiuroidea`;
DROP TRIGGER IF EXISTS  `WoRMS_Phoronida`;
DROP TRIGGER IF EXISTS  `WoRMS_Polychaeta`;
DROP TRIGGER IF EXISTS  `WoRMS_Polycystina`;
DROP TRIGGER IF EXISTS  `WoRMS_Porifera`;
DROP TRIGGER IF EXISTS  `WoRMS_Proseriata_Kalyptorhynchia`;
DROP TRIGGER IF EXISTS  `WoRMS_Remipedia`;
DROP TRIGGER IF EXISTS  `WoRMS_Scaphopoda`;
DROP TRIGGER IF EXISTS  `WoRMS_Tanaidacea`;
DROP TRIGGER IF EXISTS  `WoRMS_Tantulocarida`;
DROP TRIGGER IF EXISTS  `WoRMS_Thermosbaenacea`;
DROP TRIGGER IF EXISTS  `WoRMS_Xenoturbellida`;
DROP TRIGGER IF EXISTS  `World_Gracillariidae`;
DROP TRIGGER IF EXISTS  `World_Umbellifer_Database`;
DROP TRIGGER IF EXISTS  `Xylariaceae`;
DROP TRIGGER IF EXISTS  `ZOBODAT_Vespoidea`;
DROP TRIGGER IF EXISTS  `Zygomycetes`;
DROP TRIGGER IF EXISTS  `protoGSD`;
DELIMITER $$
CREATE TRIGGER `3i_Cicadellinae` AFTER UPDATE ON `3i_Cicadellinae` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `3i_Typhlocybinae` AFTER UPDATE ON `3i_Typhlocybinae` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `AFD_Pulmonata` AFTER UPDATE ON `AFD_Pulmonata` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `AlgaeBase` AFTER UPDATE ON `AlgaeBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `AnnonBase` AFTER UPDATE ON `AnnonBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `AphidSF` AFTER UPDATE ON `AphidSF` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `BIOS` AFTER UPDATE ON `BIOS` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `BdelloideaBase` AFTER UPDATE ON `BdelloideaBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `BlattodeaSF` AFTER UPDATE ON `BlattodeaSF` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Brassicaceae` AFTER UPDATE ON `Brassicaceae` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `CCW` AFTER UPDATE ON `CCW` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `CIPA` AFTER UPDATE ON `CIPA` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `COOL` AFTER UPDATE ON `COOL` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ChenoBase` AFTER UPDATE ON `ChenoBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ChiloBase` AFTER UPDATE ON `ChiloBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `CilCat` AFTER UPDATE ON `CilCat` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Conifer_Database` AFTER UPDATE ON `Conifer_Database` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Dothideomycetes` AFTER UPDATE ON `Dothideomycetes` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Droseraceae_Database` AFTER UPDATE ON `Droseraceae_Database` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ELPT` AFTER UPDATE ON `ELPT` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ETI_WBD_Euphausiacea` AFTER UPDATE ON `ETI_WBD_Euphausiacea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `EbenaBase` AFTER UPDATE ON `EbenaBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `EmbiopteraSF` AFTER UPDATE ON `EmbiopteraSF` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `FLOW` AFTER UPDATE ON `FLOW` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `FWCrabs` AFTER UPDATE ON `FWCrabs` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `FishBase` AFTER UPDATE ON `FishBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `GCC` AFTER UPDATE ON `GCC` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `GloBIS_GART` AFTER UPDATE ON `GloBIS_GART` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Glomeromycota` AFTER UPDATE ON `Glomeromycota` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Hexacorals` AFTER UPDATE ON `Hexacorals` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ICTV_MSL` AFTER UPDATE ON `ICTV_MSL` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ILDIS` AFTER UPDATE ON `ILDIS` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `IOPI_GPC` AFTER UPDATE ON `IOPI_GPC` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ITIS_Bees` AFTER UPDATE ON `ITIS_Bees` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ITIS_Global` AFTER UPDATE ON `ITIS_Global` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ITIS_Regional` AFTER UPDATE ON `ITIS_Regional` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `LDL_Neuropterida` AFTER UPDATE ON `LDL_Neuropterida` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `LHD` AFTER UPDATE ON `LHD` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `LIAS` AFTER UPDATE ON `LIAS` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `LecyPages` AFTER UPDATE ON `LecyPages` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `LepIndex` AFTER UPDATE ON `LepIndex` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `MBB` AFTER UPDATE ON `MBB` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `MELnet` AFTER UPDATE ON `MELnet` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `MOST` AFTER UPDATE ON `MOST` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `MOWD` AFTER UPDATE ON `MOWD` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `MantodeaSF` AFTER UPDATE ON `MantodeaSF` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `NZIB` AFTER UPDATE ON `NZIB` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Nomen_eumycetozoa_com` AFTER UPDATE ON `Nomen_eumycetozoa_com` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Odonata` AFTER UPDATE ON `Odonata` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `OlogamasidBase` AFTER UPDATE ON `OlogamasidBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `OrthopteraSF` AFTER UPDATE ON `OrthopteraSF` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Parhost` AFTER UPDATE ON `Parhost` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `PhasmidaSF` AFTER UPDATE ON `PhasmidaSF` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Phyllachorales` AFTER UPDATE ON `Phyllachorales` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `PhytoseiidBase` AFTER UPDATE ON `PhytoseiidBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `PlecopteraSF` AFTER UPDATE ON `PlecopteraSF` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Psyllist` AFTER UPDATE ON `Psyllist` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `RJB_Geranium` AFTER UPDATE ON `RJB_Geranium` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `RhodacaridBase` AFTER UPDATE ON `RhodacaridBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Rhytismatales` AFTER UPDATE ON `Rhytismatales` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Rotifera` AFTER UPDATE ON `Rotifera` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Saccharomycetes` AFTER UPDATE ON `Saccharomycetes` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `SalticidDB` AFTER UPDATE ON `SalticidDB` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ScaleNet` AFTER UPDATE ON `ScaleNet` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Scarabs` AFTER UPDATE ON `Scarabs` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Solanaceae_Source` AFTER UPDATE ON `Solanaceae_Source` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Species_2000_Common_Names` AFTER UPDATE ON `Species_2000_Common_Names` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Species_Fungorum` AFTER UPDATE ON `Species_Fungorum` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `SpidCat_via_ITIS` AFTER UPDATE ON `SpidCat_via_ITIS` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `SpmWeb` AFTER UPDATE ON `SpmWeb` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Strepsiptera_Database` AFTER UPDATE ON `Strepsiptera_Database` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `SysMyr` AFTER UPDATE ON `SysMyr` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Systema_Dipterorum` AFTER UPDATE ON `Systema_Dipterorum` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `TIGR_Reptiles` AFTER UPDATE ON `TIGR_Reptiles` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `TITAN` AFTER UPDATE ON `TITAN` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Taxapad_Ichneumonoidea` AFTER UPDATE ON `Taxapad_Ichneumonoidea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `TenuipalpidBase` AFTER UPDATE ON `TenuipalpidBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `TicksBase` AFTER UPDATE ON `TicksBase` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Tineidae_NHM` AFTER UPDATE ON `Tineidae_NHM` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Trichomycetes` AFTER UPDATE ON `Trichomycetes` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `UCD` AFTER UPDATE ON `UCD` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `URMO` AFTER UPDATE ON `URMO` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WCSP` AFTER UPDATE ON `WCSP` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WTaxa` AFTER UPDATE ON `WTaxa` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Asteroidea` AFTER UPDATE ON `WoRMS_Asteroidea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Bochusacea` AFTER UPDATE ON `WoRMS_Bochusacea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Brachiopoda` AFTER UPDATE ON `WoRMS_Brachiopoda` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Brachypoda` AFTER UPDATE ON `WoRMS_Brachypoda` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Brachyura` AFTER UPDATE ON `WoRMS_Brachyura` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Bryozoa` AFTER UPDATE ON `WoRMS_Bryozoa` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Cumacea` AFTER UPDATE ON `WoRMS_Cumacea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Echinoidea` AFTER UPDATE ON `WoRMS_Echinoidea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Holothuroidea` AFTER UPDATE ON `WoRMS_Holothuroidea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Hydrozoa` AFTER UPDATE ON `WoRMS_Hydrozoa` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Isopoda` AFTER UPDATE ON `WoRMS_Isopoda` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Leptostraca` AFTER UPDATE ON `WoRMS_Leptostraca` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Mystacocarida` AFTER UPDATE ON `WoRMS_Mystacocarida` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Nemertea` AFTER UPDATE ON `WoRMS_Nemertea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Oligochaeta` AFTER UPDATE ON `WoRMS_Oligochaeta` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Ophiuroidea` AFTER UPDATE ON `WoRMS_Ophiuroidea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Phoronida` AFTER UPDATE ON `WoRMS_Phoronida` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Polychaeta` AFTER UPDATE ON `WoRMS_Polychaeta` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Polycystina` AFTER UPDATE ON `WoRMS_Polycystina` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Porifera` AFTER UPDATE ON `WoRMS_Porifera` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Proseriata_Kalyptorhynchia` AFTER UPDATE ON `WoRMS_Proseriata_Kalyptorhynchia` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Remipedia` AFTER UPDATE ON `WoRMS_Remipedia` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Scaphopoda` AFTER UPDATE ON `WoRMS_Scaphopoda` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Tanaidacea` AFTER UPDATE ON `WoRMS_Tanaidacea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Tantulocarida` AFTER UPDATE ON `WoRMS_Tantulocarida` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Thermosbaenacea` AFTER UPDATE ON `WoRMS_Thermosbaenacea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `WoRMS_Xenoturbellida` AFTER UPDATE ON `WoRMS_Xenoturbellida` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `World_Gracillariidae` AFTER UPDATE ON `World_Gracillariidae` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `World_Umbellifer_Database` AFTER UPDATE ON `World_Umbellifer_Database` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Xylariaceae` AFTER UPDATE ON `Xylariaceae` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `ZOBODAT_Vespoidea` AFTER UPDATE ON `ZOBODAT_Vespoidea` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER `Zygomycetes` AFTER UPDATE ON `Zygomycetes` FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
CREATE TRIGGER protoGSD AFTER UPDATE ON protoGSD FOR EACH ROW 
BEGIN 
UPDATE piping.taxa SET gsd_comments = CONCAT(NOW(),": ",NEW.gsd_comments) WHERE piping.taxa.id = OLD.id;
END;
$$
