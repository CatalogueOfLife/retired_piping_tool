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
	private static $dbh = NULL;

	// $result stores results of query
	protected $result;

	// Connect to database
	public function __construct($host, $user, $password, $database)
	{
		if (self::$dbh == NULL)
		{
			self::$dbh = new mysqli($host, $user, $password, $database);
			if (self::$dbh->connect_error)
				die('Connect Error (' . self::$dbh->connect_errno . ') '
						. self::$dbh->connect_error);
		}
		// else reuse existing connection
	}

	// Query from database
	public function query($query_string)
	{
		if (!($this->result = self::$dbh->query($query_string)))
			die('Query Error (' . self::$dbh->errno . ') '
					. self::$dbh->error);
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

		$input = self::$dbh->real_escape_string($input);

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
								array(	'text' =>	'Sign Out', 
										'link' =>	'logout.php'),
								array(	'text' =>	'Home', 
										'link' =>	'home.php'),
								array(	'text' =>	'Taxa Table', 
										'link' =>	'taxa.php'),
								array(	'text' =>	'Upload File',
										'link' =>	'upload.php'),
								array(	'text' =>	'User List',
										'link' =>	'user_list.php'),
								array(	'text' =>	'Change Password',
										'link' =>	'change_psword.php'),
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
								array(	'text' =>	'Sign Out', 
										'link' =>	'logout.php'),
								array(	'text' =>	'Home', 
										'link' =>	'home.php'),
								// need to add more items!
								array(	'text' =>	'Change Password',
										'link' =>	'change_psword.php')
								);
				break;
			case "GBP":
				$this->menu = array(
								array(	'text' =>	'Sign Out', 
										'link' =>	'logout.php'),
								array(	'text' =>	'Home', 
										'link' =>	'home.php'),
								array(	'text' =>	'Taxa Table', 
										'link' =>	'taxa.php'),
								array(	'text' =>	'Upload File',
										'link' =>	'upload.php'),
								// need to add more items!
								array(	'text' =>	'Change Password',
										'link' =>	'change_psword.php')
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
			// note here is not checking for userid != 0 at the moment
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
				$password=''	// only apply when changing password
	)
	{
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
						'id'					=> 'Taxa ID',
						'provided_id'			=> 'Provided ID',
						'genus'					=> 'Genus',
						'species_epithet'		=> 'Species epithet',
						'infraspecies'			=> 'Infraspecies',
						'infraspecies_marker'	=> 'Infraspecies marker',
						'author_string'			=> 'Author string',
						'family'				=> 'Family',
						'order'					=> 'Order',
						'class'					=> 'Class',
						'phylum'				=> 'Phylum',
						'kingdom'				=> 'Kingdom',
						'provider_hints'		=> 'Provider hints',
						'updated'				=> 'Last Changed',
						'provider_id'			=> 'User ID',
						'gsd_comments'			=> 'GSD Comments',
						'gsd_id'				=> 'GSD ID',
						'gsd_status'			=> 'GSD Status',
						'history_status'		=> 'History Status',
						'history_comments'		=> 'History Comments',
					);

	// $d2f_name mapping html display name to mysql table field name
	// this array is initialized in __construct()
	static $d2f_name = array();

	// $d_name is a list of html display name
	// this array is used in Column Selection during upload of taxa data
	static $d_name =
				array(
						'Provided ID',
						'Genus',
						'Species epithet',
						'Infraspecies',
						'Infraspecies marker',
						'Author string',
						'Family',
						'Order',
						'Class',
						'Phylum',
						'Kingdom',
						'Provider hints',
					);

	// $required_fields is a list of fields data must be provided for upload
	static $required_fields =
				array(
						'Genus'				=> 1,
						'Species epithet'	=> 1,
					);

	// $edit_name is editable field name in taxa table
	// this array is initialized in __construct()
	static $edit_name = array();

	//$fieldSize mapping taxa table field name to data size 
	static $fieldSize =
				array(
						'id'					=> 10,
						'provided_id'			=> 45,
						'genus'					=> 45,
						'species_epithet'		=> 45,
						'infraspecies'			=> 50,
						'infraspecies_marker'	=> 50,
						'author_string'			=> 45,
						'family'				=> 45,
						'order'					=> 45,
						'class'					=> 45,
						'phylum'				=> 45,
						'kingdom'				=> 50,
						'provider_hints'		=> 255,
						'updated'				=> 20,
						'provider_id'			=> 3,
						'gsd_comments'			=> 65535,
						'gsd_id'				=> 10,
						'gsd_status'			=> 1,
						'history_status'		=> 10,
						'history_comments'		=> 255,
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
						'id'					=> 0,
						'provided_id'			=> 1,
						'genus'					=> 1,
						'species_epithet'		=> 1,
						'infraspecies'			=> 1,
						'infraspecies_marker'	=> 1,
						'author_string'			=> 1,
						'family'				=> 1,
						'order'					=> 1,
						'class'					=> 1,
						'phylum'				=> 1,
						'kingdom'				=> 1,
						'provider_hints'		=> 1,
						'updated'				=> 0,
						'provider_id'			=> 0,
						'gsd_comments'			=> 0,
						'gsd_id'				=> 1,
						'gsd_status'			=> 1,
						'history_status'		=> 1,
						'history_comments'		=> 1,
					);
			}
			elseif ($role == 'GBP')
			{
				// GBP editable fields
				self::$edit_name =
					array(
						'id'					=> 0,
						'provided_id'			=> 1,
						'genus'					=> 1,
						'species_epithet'		=> 1,
						'infraspecies'			=> 1,
						'infraspecies_marker'	=> 1,
						'author_string'			=> 1,
						'family'				=> 1,
						'order'					=> 1,
						'class'					=> 1,
						'phylum'				=> 1,
						'kingdom'				=> 1,
						'provider_hints'		=> 1,
						'updated'				=> 0,
						'provider_id'			=> 0,
						'gsd_comments'			=> 0,
						'gsd_id'				=> 0,
						'gsd_status'			=> 0,
						'history_status'		=> 0,
						'history_comments'		=> 0,
					);
			}
			else
			{
				// GSD editable fields
				self::$edit_name =
					array(
						'id'					=> 0,
						'provided_id'			=> 0,
						'genus'					=> 0,
						'species_epithet'		=> 0,
						'infraspecies'			=> 0,
						'infraspecies_marker'	=> 0,
						'author_string'			=> 0,
						'family'				=> 0,
						'order'					=> 0,
						'class'					=> 0,
						'phylum'				=> 0,
						'kingdom'				=> 0,
						'provider_hints'		=> 0,
						'updated'				=> 0,
						'provider_id'			=> 0,
						'gsd_comments'			=> 1,
						'gsd_id'				=> 0,
						'gsd_status'			=> 1,
						'history_status'		=> 0,
						'history_comments'		=> 0,
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
}	// End of Taxa object definition

?>
