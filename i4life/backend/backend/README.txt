This spart still needs polishing e.g. as the trigger approach proved to be too slow for all the GSDs, the backend 
has been slightly reorganised. All the sql queries should be executed from php or shell scripts.
More documentation and updates are coming soon...

All the generate_*.sql files are used to create SQL scripts which in turn are used to do actual piping. 
All the generate_*.sql scripts need to be run only once after an update of the Catalogue of Life.
All the generated sql sripts need to be run each time the buffer database is updated.

to do:
create simple php or bash scripts to execute these sql files.

A. To reset pipelines run:
1) drop_pipeline_tables.sql
- this will drop all the pipeline GSD tables in the pipeline database
2) create_pipeline_tables.sql
- this will create all the pipeline GSD tables in the pipeline database


B. After each Catalogue of Life update run script updates:
1) generate_drop_pipeline_tables.sql
- this will create drop_pipeline_tables.sql
2) generate_create_pipeline_tables.sql
 - this will generate create_pipeline_tables.sql


C. Daily (or several times per day using cron) run piping:
corrective scripts:
1) extract_genus_from_name.sql - will populate empty genus and specificEpithet fields where empty from scientificName
2) correct_case.sql - capitalises first letter of genus, scientificName, family, order, class, phylum, kingdom and brings other chars to lover case
