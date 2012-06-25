Piping Tools use the following software:
Smarty 3.0.7
MySQL 5.1 or above
PHP 5.3

php scripts are in:
~/works/i4life
~/works/i4life/include

Smarty template files are in:
~/works/i4life/templates

MySQL schema are in:
~/works/schema

art works are in:
~/works/i4life/pics

Installation:
1. Install Smarty 3
2. Put all the directories of the piping tools under web directory on your server (e.g. /var/www/piping). 
Directories with Global partner names are used to cache downloaded data from global partners.
3. Edit Smarty 3 and piping tools installation path in /php/setup.php (see example below):

// define Smarty lib directory
define ('SMARTY_DIR', '/usr/share/php/smarty3/');

// define server root directory
define ('ROOT_DIR', '/var/www/piping/php/');


// define user's base directory
define ('USER_BASE_DIR', '/var/www/piping/');
4. Edit database connection details in /php/include/db.php (see example below):

	// These are the DBMS credentials and the database name
	$DB_hostname     = "localhost";
	$DB_username	 = "[username]";
	$DB_password	 = "[password]";
	$DB_databasename = "piping";

5. Create a virtual server or a directories in Apache configuration and restart server (see directory example below):
Alias /piping/webservice "/var/www/piping/webservice/"
   <Directory "/var/www/piping/webservice/">
       Options +Indexes -MultiViews -FollowSymLinks
      AllowOverride All
       Order allow,deny
       Allow from all
   </Directory>

Alias /piping "/var/www/piping/php/"
   <Directory "/var/www/piping/php/">
       Options -Indexes -MultiViews FollowSymLinks
	DirectoryIndex index.php
      AllowOverride All
       Order allow,deny
       Allow from all
   </Directory>


