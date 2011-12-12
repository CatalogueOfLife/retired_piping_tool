<?php /* Smarty version Smarty-3.0.7, created on 2011-04-08 16:17:09
         compiled from "home.php" */ ?>
<?php /*%%SmartyHeaderCode:5791622904d9f26f57ac785-12706820%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'afe3e505cf5e7d1f70340b0052cdb68c0874caaf' => 
    array (
      0 => 'home.php',
      1 => 1302275827,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5791622904d9f26f57ac785-12706820',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<<?php ?>?php
// home.php: Home page of Piping Tools

// load setup.php file
require_once("setup.php");

// initialise smarty object for display html template
$smarty = new Smarty_PipingTools();

// Check if the user is logged in
// (this also starts the session)
logincheck();

// Connect to the MySQL DBMS and use the myProbes database - 
// credentials are in the file db.php
// Notes: $db is an object of class DB, and it is NOT directly link to
// mysqli connection.
$db = new DB ($DB_hostname, $DB_username, $DB_password, $DB_databasename);


// get taxa table items
function getTaxaTable(DB $db)
	{
		global $man_step;
		global $map_man_step;

		// $m_db will be used in manufacture record
		$m_db = clone $db;

		// $style is used for alternate row colour
		$style = array('even-row', 'odd-row');

		// See whether there are any myProbes In Progress
		$query = "SELECT * FROM order_list WHERE status='in_progress' ORDER BY tracker_no";

		// Run the query through the connection
		$db->query($query);

		// Check whether any names were found
		if (!$db->num_rows()) 
			// No;  print a notice
			echo "\n<h3><font color=\"red\">".
				"There are no myProbes projects in progress.</font></h3>";
		else
		{
			// Caption for the home page table
			echo "<font size='+1'>Current myProbes Projects Progress</font>";

			// Yes, so show the names as a table
			echo "\n<table border='0'>";

			// Create some headings for the table
			echo "\n<tr>" .
				"\n\t<th width=60><font size='1'>Tracker No.</font></th>".
				"\n\t<th align='center'><font size='1'>Probe Name</font></th>";

			foreach ($man_step as $step)
				echo "\n<th width=70><font size='1'><?php echo $_smarty_tpl->getVariable('map_man_step')->value[$_smarty_tpl->getVariable('step')->value];?>
</font></th>";

			echo "\n</tr>";

			// Fetch each database table row of the results
			// $i is variable to determine the colour of alternate row
			$i = 1;		// only odd style is used in the home page

			// $rd is used to hold manufacture record for each query
			$rd = new Record;

			while($row = $db->fetch())
			{
				// Compose a single row of the table for this myProbes
				// Create a link to order edit / listing page
				// depend on the privilege status of the user
				echo "\n<tr class=" . $style[$i] . ">" .
					"\n\t<td align='center'><a href='";

				if ($_SESSION['role']=='manager' or $_SESSION['username']=='admin')
					echo "order_edit2";
				else
					echo "order_list2";

				echo ".php?tracker_no=<?php echo $_smarty_tpl->getVariable('row')->value["tracker_no"];?>
'>".
					"\n\t<?php echo $_smarty_tpl->getVariable('row')->value["tracker_no"];?>
</a></td>".

					// Probe name
					"\n\t<td align='center'><font size='-2'><?php echo $_smarty_tpl->getVariable('row')->value["probe_name"];?>
</font></td>";

				// Get the manufacture record of this tracker_no
				$m_query = "SELECT * FROM manufact_record WHERE tracker_no='".
							$row["tracker_no"] . "'";

				$m_db->query($m_query);
				$m_row = $m_db->fetch();

				foreach ($man_step as $step)
				{
					// Store the query result of each manufacture step
					$rd->set($m_row, $step);

					// If there is date record, it mean this step have done
					if ($rd->get_date())
						// Paint the box green and print the date on it
						echo "\n\t<td bgcolor='green' align='center'>".
							 "<font color='white' size='1'><?php echo $_smarty_tpl->getVariable('rd')->value->get_date();?>
</font></td>";
					else
						echo "\n\t<td bgcolor='white'>&nbsp</td>";
				}


				// End row
				"</tr>";

		//		$i ^= 1;

				// blank row to separate other rows make them easy to see
				echo "\n<tr><td><font size='1'>&nbsp</font></td></tr>";
			}

			// End table
			echo "\n</table>";
		}
	}      
?<?php ?>>

<<?php ?>?php
// Pre-process the message data for security
if(isset($_GET['message']))
	$message  = $db->clean($_GET["message"], 128);

$smarty->assign('message', $message);
$smarty->assign('username', $_SESSION['username']);

// initialise menu
$menu = new Menu($_SESSION['role']);

// pass menu to template
$smarty->assign('menu', $menu->get());

//echo $_SESSION['username'];

$smarty->display("master.tpl");

	// Show a page top links
//	echo "<a href='logout.php'>Sign Out</a> | ".
//			"Home | ";
/*
	if (($_SESSION['role'] == 'manager') || $_SESSION['username'] == 'admin')
		echo "<a href='order_edit.php'>Order List</a> | ".
				"<a href='int_edit.php'>Intermediate List</a> | ".
				"<a href='rd_staff_edit.php'>Staff List</a> | ";
	else
		echo "<a href='order_list.php'>Order List</a> | ".
			"<a href='int_list.php'>Intermediate List</a> | ".
			"<a href='rd_staff_list.php'>Staff List</a> | ";
	echo "<a href='change_psword.php'>Change Password </a>";

    echo "<h5>Username: <i><?php echo $_smarty_tpl->getVariable('_SESSION')->value['username'];?>
</i></h5>";

    echo "<h1 style='text-align:center'>Piping Tools Home Page</h1>";
    echo "\n<hr />";

*/

/*
	// Pre-process the message data for security
	if(isset($_GET['message']))
		$message  = $db->clean($_GET["message"], 128);

	// If there's a message to show, output it
	if (!empty($message))
		echo "\n<h3><font color=\"red\"><em>".
			urldecode($message)."</em></font></h3>";


	// Show myProbes which are in progress
	//show_myProbes_progress($db);
//	echo "This will show current project table";


	echo "\n<br>".
    		"\n<hr /> <br />".
    		"<a href='<?php echo $_smarty_tpl->getVariable('_SERVER')->value["PHP_SELF"];?>
'><img src='myprobesLogoHead.gif'" .
            " BORDER=0 alt='myProbes Logo' /></a>";
    echo "\n<p style='font-size:50%'> \$Id: home.php,v 1.7 2010/10/12 15:24:21 kwok Exp $ </p>";
*/
?<?php ?>>
