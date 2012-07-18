This spart still needs polishing e.g. as the trigger approach proved to be too slow for all the GSDs, the backend 
has been slightly reorganised. All the sql queries should be executed from the scheduller script (not ready yet).
Expect more documentation and updates soon...

All the generate_*.sql files are used to create SQL scripts which in turn are used to do actual piping. 
All the generate_*.sql scripts need to be run only once after an update of the Catalogue of Life.
All the generated sql sripts need to be run each time the buffer database is updated.



A. To reset pipelines run:
1) drop_pipeline_tables.sql
- this will drop all the pipeline GSD tables in the pipeline database
2) create_pipeline_tables.sql
- this will create all the pipeline GSD tables in the pipeline database
3) create_pipeline_triggers.sql
-- this will create all the pipeline GSD triggers in the pipeline database for annotation handling

B. After each Catalogue of Life update run scripts (before delete the old scripts they generate):
1) generate_drop_pipeline_tables.sql
- this will create drop_pipeline_tables.sql used to reset pipelines
2) generate_create_pipeline_tables.sql
 - this will generate create_pipeline_tables.sql used to reset pipelines
3) generate_create_pipeline_triggers.sql
 - this will generate create_pipeline_triggers.sql used to reset pipelines
4) generate_insert_into_pipeline_tables.sql
 - this will generate insert_into_pipeline_tables.sql run daily
5) generate_gsd_folders.sql
 - this will generate create_gsd_folders.sh shell script run daily
6) generate_gsd_export_script.sql
- this will generate export_gsds_to_webservice.sql
7) generate_gsdmatch.sql
-this will generate gsdmatch.sql

C. After addition of a Global Partner run scripts:
1) generate_gbp_folders.sql 
-this will generate create_gbp_folders.sh
2) generate_gbp_export_script.sql
-this will generate export_gbps_to_webservice.sql

C. Daily (or several times per day using cron and the scheduler script) run:
corrective scripts:
1) extract_genus_from_name.sql 
- will populate empty genus and specificEpithet fields where empty from scientificName
2) correct_case.sql 
- capitalises first letter of genus, scientificName, family, order, class, phylum, kingdom and brings other chars to lover case
3) create_gbp_folders.sh
4) create_gsd_folders.sh
5) gsdmatch.sql
- assigns GSDs to species names for piping
6) insert_into_pipeline_tables.sql
- moves data into pipeline database according to assigned GSDs
7) export_gbps_to_webservice.sql
8) export_gsds_to_webservice.sql

