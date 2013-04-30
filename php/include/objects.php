<?php
// objects.php: define all objects in Pinping Tools
// $Id: objects.php,v 1.2 2011/06/02 11:34:20 kwok Exp kwok $

require_once("db.php");

// ******************************
// DB: database connection object
// ******************************
class DB
{
	// The same database handle, $dbh, is used for all DB instances

	// have to change this as we have to connected to more than one
	// databases at the same time!!!!

	// where using static variable, to access propeties, do this:
	// self::$propertyName instead of $this->propertyName
//	private static $dbh = NULL;

	private $dbh = NULL;

	// $result stores results of query
	protected $result;

	// Connect to database
	public function __construct($host, $user, $password, $database)
	{
		if ($this->dbh == NULL)
		{
			do
			{
				$this->dbh = new mysqli($host, $user, $password, $database);

				//if ($this->dbh->connect_error)
				// Have to use mysqli_connect_error(), as fetching object dbh
				// property would fail if there is no connection with
				// mysql server
				if (mysqli_connect_error())
				{
					// die('Connect Error (' . $this->dbh->connect_errno . ') '
					//		. $this->dbh->connect_error);

					//echo "Can't connect to mysql, I write this line!!!";

					$connected = false;
					sleep(60);
				}
				else
				{
					// connected ok.
					$connected = true;
				}
			} while (!$connected);
		}
		// else reuse existing connection
	}

	// Query from database
	public function query($query_string)
	{
		// if mysql server is not running, wait a minute and test again.
		while (!$this->dbh->ping())
			sleep(60);

		if (!($this->result = $this->dbh->query($query_string)))
			die('Query Error (' . $this->dbh->errno . ') '
					. $this->dbh->error);
	}

	// Query from database, this method is used in scheduler.php
	// and scheduler_pmpnit.php scripts, as it will continue even
	// where there is a mysql query error
	public function query2($query_string)
	{
		// if mysql server is not running, wait a minute and test again.
		while (!$this->dbh->ping())
			sleep(60);

		if (!($this->result = $this->dbh->query($query_string)))
			echo(	"\n" . $query_string . "\n" .
					'Query Error (' . $this->dbh->errno . ') '
					. $this->dbh->error . "\n"
				);
	}

	// Fetch a row from query result
	public function fetch()
	{
		return $this->result->fetch_array();
	}

	// Number of rows from query result
	public function num_rows()
	{
		return $this->result->num_rows;
	}

	// Secure the user data by escaping characters and shortening the
	// input string
	public function clean($input, $maxlength)
	{
		// Limit the length of the string
		$input = substr($input, 0, $maxlength);

		// Escape semicolons and (if magic quotes are off) single and
		// double quotes
		if(get_magic_quotes_gpc())
			$input = stripslashes($input);

		$input = $this->dbh->real_escape_string($input);

		return $input;
	}
}	// End of DB object definition

// ************************************
// Menu: objects for menu text and link
// ************************************
Class Menu
{
	protected $menu = array();

	// menu will be building according to role: admin, GSD or GBP
	public function __construct($role)
	{
		switch ($role):
			case "admin":
				$this->menu = array(
								array(	'text' =>	'Help', 
										'link' =>	'help.php'),
						//		array(	'text' =>	'Home Page', 
						//				'link' =>	'home.php'),
								array(	'text' =>	'Manually Uploading',
										'link' =>	'upload.php'),
								array(	'text' =>	'DwC-A Uploading',
										'link' =>	'dwc_page.php'),
								array(	'text' =>	'BOLD Uploading',
										'link' =>	'bold_upload.php'),
								array(	'text' =>	'X-map Uploading',
										'link' =>	'xmap_upload.php'),
								array(	'text' =>	'Uploaded Data', 
										'link' =>	'taxa.php'),
								array(	'text' =>	'Data Summary', 
										'link' =>	'tagDelete.php'),
								array(	'text' =>	'User List',
										'link' =>	'user_list.php'),
								array(	'text' =>	'Change Password',
										'link' =>	'change_psword.php'),
								array(	'text' =>	'Piping Tools Settings',
										'link' =>	'setting.php'),
								array(	'text' =>	'Sign Out', 
										'link' =>	'logout.php'),
/*
								array(	'text' =>	'Server Files',
										'link' =>	'server_files.php'),
								array(	'text' =>	'Upload2 File',
										'link' =>	'upload2.php')
*/
								);
				break;
			case "GSD":
				$this->menu = array(
								array(	'text' =>	'Help', 
										'link' =>	'help.php'),
								array(	'text' =>	'Home Page', 
										'link' =>	'home.php'),
								// need to add more items!
								array(	'text' =>	'Change Password',
										'link' =>	'change_psword.php'),
								array(	'text' =>	'Sign Out', 
										'link' =>	'logout.php'),
								);
				break;
			case "GBP":
				$this->menu = array(
								array(	'text' =>	'Help', 
										'link' =>	'help.php'),
						//		array(	'text' =>	'Home Page', 
						//				'link' =>	'home.php'),
								array(	'text' =>	'Manually Uploading',
										'link' =>	'upload.php'),
								array(	'text' =>	'Uploaded Data', 
										'link' =>	'taxa.php'),
								array(	'text' =>	'Data Summary', 
										'link' =>	'tagDelete.php'),
								array(	'text' =>	'Change Password',
										'link' =>	'change_psword.php'),
								array(	'text' =>	'Sign Out', 
										'link' =>	'logout.php'),
								);
				break;
		endswitch;
	}

	public function get()
	{
		return $this->menu;
	}
}	// End of Menu object definition

// *****************************************************
// Table: object which fetch the entire table from mysql
// *****************************************************
Class Table
{
	protected $table_name;
	protected $num_rows;
	protected $result = array();

	// __construct() get data from any mysql table
	public function __construct(
		DB $db,			// handle to the database
		$table_name,	// name of the table
		$where='',		// optional, define the where clause
		$order=''		// optional, column name use for ordering data
	)
	{
		// clear properties first
		$this->num_rows = NULL;
		$this->result = NULL;

		// initialise table name
		$this->table_name = $table_name;

		$query = "SELECT * FROM $table_name";
		if (!empty($where))
			$query .= " WHERE $where";
		if (!empty($order))
			$query .= " ORDER BY $order";

		$db->query($query);

		$this->num_rows = $db->num_rows();

		for ($i = 0; $i < $this->num_rows; $i++)
		{
			$this->result[] = $db->fetch();
		}
	}

	public function get_result()
	{
		return $this->result;
	}

	public function num_rows()
	{
		return $this->num_rows;
	}

	// delete_row() delete a row of data from table
	public function delete_row(DB $db, $key_name, $key_value)
	{
		$query = "DELETE FROM " . $this->table_name . " WHERE ".
				 "$key_name='$key_value'";

		$db->query($query);

	}
}	// End of Table object definition

// ****************************************************
// User: is an extention of Table object for user table
// ****************************************************
Class User extends Table
{

	public function __construct(DB $db, $where='')
	{
		if (!empty($where))
			// note there is no checking to make sure userid is not 0
			// at the moment
			parent::__construct($db, 'user', $where, 'userid');
		else
			// admin have userid equal 0, and is excluded for any editing
			parent::__construct($db, 'user', 'userid != 0', 'userid');
	}

	// is_name_exist() checks is $name already used in user table
	public function is_name_exist(DB $db, $name)
	{
		$query = "SELECT COUNT(username) FROM user WHERE username='$name'";
		$db->query($query);

		$row = $db->fetch();
		return $row["COUNT(username)"];
	}

	// is_name_used_elsewhere() checks is $name already used
	// else where in user table with other userid
	public function is_name_used_elsewhere(DB $db, $username, $userid)
	{
		$query = "SELECT COUNT(username) FROM user ".
				 "WHERE username='$username' AND userid!='$userid'";
		$db->query($query);

		$row = $db->fetch();
		return $row["COUNT(username)"];
	}

	// next_id() gives next available userid for a new user
	private function next_id(DB $db)
	{
		$query = "SELECT MAX(userid) FROM user";
		$db->query($query);

		$row = $db->fetch();
		return $row["MAX(userid)"] + 1;
	}

	// insert_user() inserts new user into the table
	public function insert_user(DB $db, $username, $password, $role)
	{
		// get next userid
		$userid = self::next_id($db);

		// do the actual insertion
		$query = "INSERT INTO user ".
				 "(userid, username, password, role) VALUES ".
				 "($userid, '$username', '$password', '$role')";
		$db->query($query);

		// after insertion, need to update all the properties
		self::__construct($db);
	}

	// update_user() update user record with userid = $userid
	public function update_user(
				DB $db,
				$userid,
				$username,
				$role,
				$password='',	// only apply when password is not empty
				$down_load_url='',
				$down_load_file='',
				$down_load_username='',
				$down_load_password='',
				$taxa_file=''
	)
	{
/*
		if (empty($password))
			$query = "UPDATE user SET ".
						"username	= '$username', ".
						"role		= '$role' ".
					 "WHERE userid = '$userid'";
		else
			$query = "UPDATE user SET ".
						"username	= '$username', ".
						"password	= '$password', ".
						"role		= '$role' ".
					 "WHERE userid = '$userid'";
*/

		$query = "UPDATE user SET ".
					"username	= '$username', ";

		if ($password)
			$query .= "password = '$password',";

		$query .= "down_load_url='$down_load_url',";
		$query .= "down_load_file='$down_load_file',";
		$query .= "down_load_username='$down_load_username',";
		$query .= "down_load_password='$down_load_password',";
		$query .= "taxa_file='$taxa_file',";
		$query .= "role	= '$role' WHERE userid = '$userid'";

		// do the actual update
		$db->query($query);

		// after insertion, need to update all the properties
		self::__construct($db);
	}

	// delete() delete user with $userid
	public function delete(DB $db, $userid)
	{
		// check make sure user is not admin which has userid = 1 
		if ($userid != 0)
		{
			parent::delete_row($db, 'userid', $userid);
			$error_code = 0;

			// after deletion, need to update all the properties
			self::__construct($db);
		}
		else
			// do nothing but set the error code to 1
			$error_code = 1;

		return $error_code;
	}
}	// End of User object definition

// *****************************************
// UserInfo: object definition of user info*
// *****************************************
Class UserInfo extends Table
{
	public $userid;
	public $username;
	public $role;
	public $down_load_url;
	public $down_load_file;
	public $down_load_username;
	public $down_load_password;
	public $taxa_file;
	public $inputField = array();
	//public $inputField;
	public $delimitor;
	public $enclose_by;
	public $no_first_row;
	public $mysql_script;
	public $mysql_where;

	public function __construct(DB $db, $username)
	{
		$this->username = $username;
		parent::__construct($db, 'user', "username='$username'");


		$result = parent::get_result();

		//$num_row = parent::num_rows();
//echo "Trying to print result";
//echo $result[0]['inputField'];

		$this->userid			= $result[0]['userid'];
		$this->role				= $result[0]['role'];
		$this->down_load_url	= $result[0]['down_load_url'];
		$this->down_load_file	= $result[0]['down_load_file'];
		$this->down_load_username = $result[0]['down_load_username'];
		$this->down_load_password = $result[0]['down_load_password'];
		$this->taxa_file		= $result[0]['taxa_file'];

		//$inputFields 			= $result[0]['inputField'];
		$this->inputField		= explode(':', $result[0]['inputField']);

		$this->delimitor		= $result[0]['delimitor'];
		$this->enclose_by		= $result[0]['enclose_by'];
		$this->no_first_row		= $result[0]['no_first_row'];
		$this->mysql_script		= $result[0]['mysql_script'];
		$this->mysql_where		= $result[0]['mysql_where'];

	}	// end of __construct()

/*
	// getID() give userid
	public function getID()
	{
		// return parent::$result['userid'];
		return 999;
	}
*/
}	// End of UserInfo object definition

// *****************************************
// Taxa: object definition of the taxa table
// *****************************************
Class Taxa extends Table
{
	// $username stores the username this objects created for
	static $username;

	// $role stores the role of the user
	static $role;

	//$f2d_name mapping mysql table field name to html display name
	static $f2d_name =
			array(
				'id'						=> 'ID',
				'taxonID'					=> 'Taxon ID',
				'genus'						=> 'Genus',
				'specificEpithet'			=> 'Specific epithet',
				'scientificNameAuthorship'	=> 'Scientific name authorship',
				'infraspecificEpithet'		=> 'Infraspecific epithet',
				'verbatimTaxonRank'			=> 'Verbatim taxon rank',
				'taxonomicStatus'			=> 'Taxonomic status',
				'acceptedNameUsageID'		=> 'Accepted name usage ID',
				'parentNameUsageID'			=> 'Parent name usage ID',
				'family'					=> 'Family',
				'order'						=> 'Order',
				'class'						=> 'Class',
				'phylum'					=> 'Phylum',
				'kingdom'					=> 'Kingdom',
				'higherClassification'		=> 'Higher classification',
				'namePublishedIn'			=> 'Name published In',
				'taxonRemarks'				=> 'Taxon remarks',
				'source'					=> 'Source',
				'updated'					=> 'Last Changed',
				'provider_id'				=> 'User ID',
				'scientificName'			=> 'Scientific name',
				'taxonRank'					=> 'Taxon rank',

				'gsd_comments'				=> 'GSD Comments',
				'gsd_short_name'			=> 'GSD Short Name',
				'gsd_status'				=> 'GSD Status',
				'history_status'			=> 'History Status',
				'history_comments'			=> 'History Comments',
			);

	// $d2f_name mapping html display name to mysql table field name
	// this array is initialized in __construct()
	static $d2f_name = array();

	// $d_name is a list of html display name
	// this array is used in Column Selection during upload of taxa data
	static $d_name =
				array(
						'Taxon ID',
						'Genus',
						'Specific epithet',
						'Scientific name authorship',
						'Infraspecific epithet',
						'Verbatim taxon rank',
						'Taxonomic status',
						'Accepted name usage ID',
						'Parent name usage ID',
						'Family',
						'Order',
						'Class',
						'Phylum',
						'Kingdom',
						'Higher classification',
						'Name published In',
						'Taxon remarks',
						'Source',
						'Scientific name',
						'Taxon rank',
					);

	// $required_fields is a list of fields data must be provided for upload
	static $required_fields =
				array(
					//	'Taxon ID'			=> 1,
						'Genus'				=> 1,
						'Specific epithet'	=> 1,
					);

	// $edit_name is editable field name in taxa table
	// this array is initialized in __construct()
	static $edit_name = array();

	//$fieldSize mapping taxa table field name to data size 
	static $fieldSize =
				array(
						'id'						=> 10,
						'taxonID'					=> 12,
						'genus'						=> 255,
						'specificEpithet'			=> 255,
						'scientificNameAuthorship'	=> 255,
						'infraspecificEpithet'		=> 255,
						'verbatimTaxonRank'			=> 12,
						'taxonomicStatus'			=> 45,
						'acceptedNameUsageID'		=> 12,
						'parentNameUsageID'			=> 12,
						'family'					=> 255,
						'order'						=> 255,
						'class'						=> 255,
						'phylum'					=> 255,
						'kingdom'					=> 255,
						'higherClassification'		=> 500,
						'namePublishedIn'			=> 500,
						'taxonRemarks'				=> 500,
						'source'					=> 255,
						'updated'					=> 20,
						'provider_id'				=> 3,
						'scientificName'			=> 255,
						'taxonRank'					=> 24,

						'gsd_comments'				=> 500,
						'gsd_short_name'			=> 48,
						'gsd_status'				=> 1,
						'history_status'			=> 10,
						'history_comments'			=> 255,
					);

	// $fields listing taxa table fields name and is used in DwC core input
	// scripts in dwc.php during transfer of data from buffer table to taxa
	// table. The value assciates with the field name is to tell the script
	// what to do with the data of that field: 0 no need to change case;
	// -1 change to lower case; 1 change the first letter to upper case
	static $fields =
				array(
					//	'id'						=> 0,	// no need for id
						'taxonID'					=> 0,
						'genus'						=> 1,
						'specificEpithet'			=> -1,
						'scientificNameAuthorship'	=> 0,
						'infraspecificEpithet'		=> -1,
						'verbatimTaxonRank'			=> 0,
						'taxonomicStatus'			=> 0,
						'acceptedNameUsageID'		=> 0,
						'parentNameUsageID'			=> 0,
						'family'					=> 1,
						'order'						=> 1,
						'class'						=> 1,
						'phylum'					=> 1,
						'kingdom'					=> 1,
						'higherClassification'		=> 0,
						'namePublishedIn'			=> 0,
						'taxonRemarks'				=> 0,
						'source'					=> 0,
					//	'provider_id'				=> 0,	// hardwired 
						'scientificName'			=> 1,
						'taxonRank'					=> 0,
					//	'tag'						=> 0,	// hardwired 
					);

	/////////////////////////
	// Taxa object methods //
	/////////////////////////

	public function __construct(
									DB $db,
									$username,
									$role,
									$where='',
									$order_by='',
									$no_of_taxa='',
									$offset=''
								)
	{
		// store username and role
		if (self::$username == NULL or self::$role == NULL)
		{
			self::$username = $username;
			self::$role = $role;
		}

		// either of these arrays have not been initialized
		if (self::$d2f_name == NULL or self::$edit_name == NULL)
		{
			// initialise $f2d_name
			foreach (self::$f2d_name as $fieldname => $displayname)
			{
				self::$d2f_name[$displayname] = $fieldname;
			}

			// initialise $edit_name
			if ($role == 'admin')
			{
				// admin editable fields
				self::$edit_name =
					array(
						'id'						=> 0,
						'taxonID'					=> 1,
						'genus'						=> 1,
						'specificEpithet'			=> 1,
						'scientificNameAuthorship'	=> 1,
						'infraspecificEpithet'		=> 1,
						'verbatimTaxonRank'			=> 1,
						'taxonomicStatus'			=> 1,
						'acceptedNameUsageID'		=> 1,
						'parentNameUsageID'			=> 1,
						'family'					=> 1,
						'order'						=> 1,
						'class'						=> 1,
						'phylum'					=> 1,
						'kingdom'					=> 1,
						'higherClassification'		=> 1,
						'namePublishedIn'			=> 1,
						'taxonRemarks'				=> 1,
						'source'					=> 1,
						'updated'					=> 0,
						'provider_id'				=> 0,
						'scientificName'			=> 1,
						'taxonRank'					=> 1,

						'gsd_comments'				=> 0,
						'gsd_short_name'			=> 1,
						'gsd_status'				=> 1,
						'history_status'			=> 1,
						'history_comments'			=> 1,
					);
			}
			elseif ($role == 'GBP')
			{
				// GBP editable fields
				self::$edit_name =
					array(
						'id'						=> 0,
						'taxonID'					=> 1,
						'genus'						=> 1,
						'specificEpithet'			=> 1,
						'scientificNameAuthorship'	=> 1,
						'infraspecificEpithet'		=> 1,
						'verbatimTaxonRank'			=> 1,
						'taxonomicStatus'			=> 1,
						'acceptedNameUsageID'		=> 1,
						'parentNameUsageID'			=> 1,
						'family'					=> 1,
						'order'						=> 1,
						'class'						=> 1,
						'phylum'					=> 1,
						'kingdom'					=> 1,
						'higherClassification'		=> 1,
						'namePublishedIn'			=> 1,
						'taxonRemarks'				=> 1,
						'source'					=> 1,
						'updated'					=> 0,
						'provider_id'				=> 0,
						'scientificName'			=> 1,
						'taxonRank'					=> 1,

						'gsd_comments'				=> 0,
						'gsd_short_name'			=> 0,
						'gsd_status'				=> 0,
						'history_status'			=> 0,
						'history_comments'			=> 0,
					);
			}
			else
			{
				// GSD editable fields
				self::$edit_name =
					array(
						'id'						=> 0,
						'taxonID'					=> 0,
						'genus'						=> 0,
						'specificEpithet'			=> 0,
						'scientificNameAuthorship'	=> 0,
						'infraspecificEpithet'		=> 0,
						'verbatimTaxonRank'			=> 0,
						'taxonomicStatus'			=> 0,
						'acceptedNameUsageID'		=> 0,
						'parentNameUsageID'			=> 0,
						'family'					=> 0,
						'order'						=> 0,
						'class'						=> 0,
						'phylum'					=> 0,
						'kingdom'					=> 0,
						'higherClassification'		=> 0,
						'namePublishedIn'			=> 0,
						'taxonRemarks'				=> 0,
						'source'					=> 0,
						'updated'					=> 0,
						'provider_id'				=> 0,
						'scientificName'			=> 0,
						'taxonRank'					=> 0,

						'gsd_comments'				=> 1,
						'gsd_short_name'			=> 0,
						'gsd_status'				=> 1,
						'history_status'			=> 0,
						'history_comments'			=> 0,
					);
			}
		}
		// else no need to re-initialize these arrays

		////////////////////////////
		// contruct mysql taxa table
		////////////////////////////

		// clear properties first
		$this->num_rows = NULL;
		$this->result = NULL;

		// initialise table name
		$this->table_name = 'taxa';

/*******************************************************************
////////////////////////////////////////////////////////////////////
// Have to rewrite this section to speed up query
////////////////////////////////////////////////////////////////////

		// construct query string
		$query = "SELECT * FROM taxa INNER JOIN user ".
				 "ON provider_id=userid ";

		if ($role == 'admin')
			;	// empty statment gives no condition for where clause
				// and this means get everything from the list 
		elseif ($role == 'GBP')
			$query .= "WHERE username='$username' ";
		else // role is GSD
			;	// NEED TO FILL IN THIS WHEN DATABASE BACKEND IS READY
		if (!empty($where))
			$query .= "AND ($where) ";
		if (!empty($order_by))
			$query .= "ORDER BY $order_by ";
		if (!empty($no_of_taxa))
			$query .= "LIMIT $no_of_taxa ";
		if (!empty($offset))
			$query .= "OFFSET $offset";

		// execute the query and get the results
		$db->query($query);
		$this->num_rows = $db->num_rows();
		for ($i = 0; $i < $this->num_rows; $i++)
			$this->result[] = $db->fetch();

//////////////////////////////////////////////////////////////////////
// The above section been comment out as it runs too slow!
//////////////////////////////////////////////////////////////////////
*********************************************************************/

		if ($role != 'admin')
			// get provider_id of the current users
			$provider_id = $this->get_userid($db, $username);

		// construct query string, here we DON'T use INNER JOIN!
		$query = "SELECT * FROM taxa ";

		if ($role == 'admin')
			;	// empty statment gives no condition for where clause
				// and this means get everything from the list 
		elseif ($role == 'GBP')
			$query .= "WHERE provider_id='$provider_id' ";
		else // role is GSD
			;	// NEED TO FILL IN THIS WHEN DATABASE BACKEND IS READY
		if (!empty($where) and $role != 'admin')
			$query .= "AND ($where) ";
		elseif (!empty($where))
			$query .= "WHERE $where ";
		if (!empty($order_by))
			$query .= "ORDER BY $order_by ";
		if (!empty($no_of_taxa))
			$query .= "LIMIT $no_of_taxa ";
		if (!empty($offset))
			$query .= "OFFSET $offset";

		// execute the query and get the results
		$db->query($query);
		$this->num_rows = $db->num_rows();

		// Store the results of the taxa table query first, as we are using
		// the same 'db' (database) object for every query, the query result
		// will be overwritten when we call get_username().
		for ($i = 0; $i < $this->num_rows; $i++)
			$this->result[] = $db->fetch();

		if ($username == 'admin')
		{
			// We need to find out who are the name of data provider
			// from provider_id column of taxa table.
			// The following code try avoid making mysql query for every
			// single record and this make the code run a bit quicker.

			// set the initial value which forces to call get_username()
			$old_provider_id = -1;
			for ($i = 0; $i < $this->num_rows; $i++)
			{
				$new_provider_id = $this->result[$i]['provider_id'];
				if ($old_provider_id != $new_provider_id)
				{
					$data_provider =
						$this->get_username($db, $new_provider_id);
					$old_provider_id = $new_provider_id;
				}
				$this->result[$i]['username'] = $data_provider;
			}
		}
		// else
			// No need to fill in the provider_name
	}

	public function f2d_name()
	{
		return self::$f2d_name;
	}

	public function d2f_name()
	{
		return self::$d2f_name;
	}

	public function d_name()
	{
		return self::$d_name;
	}

	public function fields()
	{
		return self::$fields;
	}

	public function required_fields()
	{
		return self::$required_fields;
	}

	public function edit_name()
	{
		return self::$edit_name;
	}

	// totalRecordNo() gives total record number for the given user.
	// Note username is already stored in object property
	public function totalRecordNo(DB $db)
	{
		$username = self::$username;

		// get total records number
		if ($username == 'admin')
		{
			// get everything from the list
			$query = "SELECT COUNT(*) FROM taxa";

			$db->query($query);
			$result = $db->fetch();
			return $result['COUNT(*)'];
		}
		else
		{
			// only get the list of that particular user
			$query = "SELECT COUNT(*) FROM taxa INNER JOIN user ".
					 "ON provider_id=userid ".
					 "WHERE username='$username'";

			$db->query($query);
			$result = $db->fetch();
			return $result['COUNT(*)'];
		}
		//return self::$totalRecordNo;
	}

	// tagRankNumber() count number of records before a given tag and a given
	// username if the data is sorted by provider_id and tag.
	// Note username is already stored in object property and it is used to
	// find out provider_id
	public function tagRankNumber(DB $db, $tag)
	{
		$username = self::$username;

		// get total records number
		if ($username == 'admin')
		{
			// consider everything on the list
			$query  = "SELECT COUNT(*) FROM taxa ";
			// admin provider_id is 0
			$query .= "WHERE provider_id <= '0' AND tag <= '$tag'";

			$db->query($query);
			$result = $db->fetch();
			return $result['COUNT(*)'];
		}
		else
		{
			$provider_id = $this->get_userid($db, $username);

			// only get the list of that particular provider_id
			$query  = "SELECT COUNT(*) FROM taxa ";
			$query .= "WHERE provider_id = '$provider_id' AND tag <= '$tag'";

			$db->query($query);
			$result = $db->fetch();
			return $result['COUNT(*)'];
		}
	}

	// delete() delete taxa for a given $id
	public function delete(
								DB $db,			// database handle
								$id,			// id of the record
								$order_by='',	// paging parameter
								$no_of_taxa='',	// paging parameter
								$offset=''		// paging parameter
							)
	{
		// check user has privilege to delete taxa with id = $id
		if (self::got_privilege($db, $id))
		{
			parent::delete_row($db, 'id', $id);

			// delete o.k.
			return 0;
		}
		else
			// no delete, give error code 1 to indicate problem
			return 1;
	}

	// next_id() give next available id of taxa table
	public function next_id(DB $db)
	{
		$query = "SELECT MAX(id) FROM taxa";
		$db->query($query);

		$row = $db->fetch();
		return $row["MAX(id)"] + 1;
	}

	// reset_id() reset id to next available number
	public function reset_id(DB $db)
	{
		$query = "ALTER TABLE taxa AUTO_INCREMENT=".
					self::next_id($db);
		$db->query($query);
	}

	// fieldSize() give data size of a given $field
	public function fieldSize($field)
	{
		return self::$fieldSize[$field];
	}

	// update() updates taxon entry with id=$id
	public function update(
								DB $db,			// database handle
								$id,			// id of the record
								$input,			// input data for update
								$order_by='',	// paging parameter
								$no_of_taxa='',	// paging parameter
								$offset=''		// paging parameter
							)
	{
		// check user has the write privilege
		if (self::got_privilege($db, $id))
		{
			// get field and value pair for query string
			$field_and_value = '';
			foreach ($input as $field => $value)
				if ($value == '')
					$field_and_value .= "`$field` = NULL,";
				else
					$field_and_value .= "`$field` = '$value',";

			// remove the last ','
			$field_and_value = preg_replace("/,$/", "", $field_and_value);

			$query = "UPDATE taxa SET $field_and_value WHERE id='$id'";
			$db->query($query);

			// update o.k.
			return 0; 
		}
		else
			// do not write to db but give error code instead.
			return 1;
	}

	// got_privilege() checks user have privilege to edit or delete
	// a taxa record with $id, if the user has the privilege,
	// got_privilege() will return 1, if not it return 0
	private function got_privilege(DB $db, $id)
	{
		if (self::$username == 'admin')
			return 1;

		if (self::$role == 'GBP')
		{
			// get user_id
			$query = "SELECT userid FROM user WHERE username='".
					 self::$username . "'";
			$db->query($query);
			$result = $db->fetch();
			$userid = $result['userid'];

			// get taxa provider_id
			$query = "SELECT provider_id FROM taxa WHERE id=$id";
			$db->query($query);
			$result = $db->fetch();
			$provider_id = $result['provider_id'];

			if ($userid == $provider_id)
				return 1;
			else
				return 0;
		}
		// else need to extend this to GSD as well later.

	}

	// get_synonym() return an array which contains list of synonyms' ID
	// associated with the given taxon ID, if no synonym is find or the
	// given ID is not a taxon, the return will be empty.
	function get_synonym(DB $db, $id)
	{
		$IDs = array(); 	// stores all the synonyms's ID

		$query = "SELECT taxonomicStatus, provider_id, taxonID ".
				 "FROM taxa WHERE id=$id";
		$db->query($query);
		$result = $db->fetch();

		if ($result['taxonomicStatus'] == "accepted")
		{
			// find all the synonyms' ID with the given taxon ID
			// and provider_id

			$query = "SELECT id FROM taxa WHERE ".
					 "provider_id=". $result['provider_id']. " AND ".
					 "taxonomicStatus='synonym' AND ".
					 "acceptedNameUsageID=". $result['taxonID'];

			$db->query($query);

			while ($result = $db->fetch())
			{
				$IDs[] = $result['id'];
			}

			return $IDs;
		}
		else
			// no need to do anything, just return an empty array
			return $IDs;
	}

	// refresh() renew properties of Taxa object and these properties
	// are use for record display purpose.
	// This function is mostly use after deletion or update of taxa records
	public function refresh(DB $db, $order_by, $no_of_taxa, $offset, $where='')
	{
			self::__construct(
								$db,
								self::$username,
								self::$role,
								$where,
								$order_by,
								$no_of_taxa,
								$offset
							);
	}


	///////////////////////////////////////////////////////////////
	// The following mehods are needed to optimise query speed by
	// avoiding using "INNER JOIN" in mysql query. And all this
	// methods are not to be use outside Taxa objection definition.
	///////////////////////////////////////////////////////////////

	// get_userid() return userid for a given username.
	// If username doesn't exist, it wil return value of -1.
	private function get_userid(DB $db, $username)
	{
		if ($username == 'admin')
			return 0;
		else
		{
			$query = "SELECT userid FROM user WHERE username='$username'";
			$db->query($query);
			$result = $db->fetch();

			if ($result['userid'])
				return $result['userid'];
			else
				return -1;
		}
	}

	// get_username() return username for the given userid
	private function get_username(DB $db, $userid)
	{
		$query = "SELECT username FROM user WHERE userid='$userid'";
		$db->query($query);
		$result = $db->fetch();

		return $result['username'];
	}


	// tags() return a list of tags
	public function tags(DB $db)
	{
		// initialise $tags to an empty array
		$tags = array();

		if (self::$username == 'admin')
		{
			// admin need all other users data
			$query  = "SELECT provider_id, tag, COUNT(tag) FROM taxa ";
			$query .= "GROUP BY provider_id, tag ORDER BY provider_id, tag";
		}
		else
		{
			// show the user's data only and nothing else
			$provider_id = $this->get_userid($db, self::$username);
			$query  =	"SELECT provider_id, tag, COUNT(tag) FROM taxa " .
						"WHERE provider_id = '$provider_id' " .
						"GROUP BY tag " .
						"ORDER BY tag";
		}

		$db->query($query);
		$this->num_rows = $db->num_rows();

		for ($i = 0; $i < $this->num_rows; $i++)
		{
			$tags[] = $db->fetch();
		}

		// We need to find out who are the name of data provider
		// from provider_id column of taxa table.
		// The following code try avoid making mysql query for every
		// single record and this make the code run a bit quicker.

		// set the initial value which forces to call get_username()
		$old_provider_id = -1;
		for ($i = 0; $i < $this->num_rows; $i++)
		{
			$new_provider_id = $tags[$i]['provider_id'];
			if ($old_provider_id != $new_provider_id)
			{
				$data_provider =
					$this->get_username($db, $new_provider_id);
				$old_provider_id = $new_provider_id;
			}
			$tags[$i]['username'] = $data_provider;
		}
		return $tags;
	}

	// delete_tagged_records() delete records with the given tag
	public function delete_tagged_records(DB $db, $tag, $provider_id)
	{
		$record_no = 0;		// store number of deleted records

		// these two lines are to ensure only admin can delete other
		// users' data, whereas other users can only delete he/her
		// own data as provider_id will be over written by the user's
		// own provider_id.
		if (self::$username != 'admin')
			$provider_id = $this->get_userid($db, self::$username);

		// find out how many records going to be deleted
		$query = "SELECT COUNT(*) FROM taxa ";
		$query .= "WHERE tag = '$tag' AND provider_id = '$provider_id'";

		$db->query($query);
		$result = $db->fetch();
		$record_no = $result['COUNT(*)'];

		// delete tagged records
		$query  = "DELETE FROM taxa ";
		$query .= "WHERE tag = '$tag' AND provider_id = '$provider_id'";

		$db->query($query);

		return $record_no;
	}

	// clear_taxa_table() clear ALL records of taxa table
	public function clear_taxa_table(DB $db)
	{
		// final check make sure only admin can call this method
		if (self::$username == 'admin')
		{
			$query = "TRUNCATE TABLE taxa";
			$db->query($query);

			// no error
			return 0;
		}
		else
			// error code
			return 1;
	}

}	// End of Taxa object definition

// ************************************************************
// Taxa_gsd: is an extention of Table object for taxa_gsd table
// ************************************************************
Class Taxa_gsd extends Table
{

	public function __construct(DB $db, $where='')
	{
		parent::__construct($db, 'taxa_gsd', $where);
	}

}	// End of Taxa_gsd object definition
?>
