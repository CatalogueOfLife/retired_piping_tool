UPDATE piping.taxa SET taxa.genus = SUBSTRING_INDEX(taxa.scientificName, ' ', 1)
 WHERE taxa.genus IS NULL OR taxa.genus = '';
UPDATE piping.taxa SET taxa.specificEpithet = SUBSTRING_INDEX(taxa.scientificName, ' ', -1)
 WHERE taxa.specificEpithet IS NULL OR taxa.specificEpithet = '';