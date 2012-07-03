/*CREATE INDEX genera ON taxa (genus);
CREATE INDEX families ON taxa (family);
CREATE INDEX orders ON taxa (`order`);
CREATE INDEX classes ON taxa (class);
CREATE INDEX phyla ON taxa (phylum);*/
CREATE INDEX scnames ON taxa (scientificName(10));