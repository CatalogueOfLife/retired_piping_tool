This spart still needs polishing e.g. as the trigger approach proved to be too slow for all the GSDs, the backend 
has been slightly reorganised. All the sql queries should be executed from php or shell scripts.
More documentation and updates are coming soon...

All the generate_*.sql files are used to create SQL scripts which in turn are used to do actual piping. 
All the generate_*.sql scripts need to be run only once after an update of the Catalogue of Life.
All the generated sql sripts need to be run each time the buffer database is updated.

to do:
create simple php or bash scripts to execute these sql files.