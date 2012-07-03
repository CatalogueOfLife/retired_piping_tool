REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'Droseraceae'@'localhost';
GRANT SELECT ON pipeline.* TO 'Droseraceae'@'localhost' IDENTIFIED BY 'Droseraceae2011';
GRANT SELECT, UPDATE ON pipeline.Droseraceae_Database TO 'Droseraceae'@'localhost'; 
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'protoGSD'@'localhost';
GRANT SELECT ON pipeline.* TO 'protoGSD'@'localhost' IDENTIFIED BY 'pr0T0gsd';
GRANT SELECT, UPDATE ON pipeline.* TO 'protoGSD'@'localhost'; 