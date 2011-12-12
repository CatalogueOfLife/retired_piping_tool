<?php /* Smarty version Smarty-3.0.7, created on 2011-04-01 09:45:18
         compiled from "/var/www/i4life/templates/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12225942194d9439164c5670-21047952%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '31d318faf305e9c10209bc69726838f8ff1d7fd5' => 
    array (
      0 => '/var/www/i4life/templates/index.tpl',
      1 => 1301647515,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12225942194d9439164c5670-21047952',
  'function' => 
  array (
  ),
  'cache_lifetime' => 3600,
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Piping Tools</title>
   		<LINK href="style.css" rel="stylesheet" type="text/css">
<!--
			<base href="http://salx9.rdg.ac.uk/i4life/" />
-->
</head>

<body>
	<h1 style="text-align:center">Piping Tools</h1>
	<hr/>
	<h3><font color="red"><?php echo $_smarty_tpl->getVariable('message')->value;?>
</font></h3>
	<h3><?php echo $_smarty_tpl->getVariable('message')->value;?>
</h3>

	<form action="index.php" method="POST">
	<table>
		<tr>
			<td> Username: </td>
			<td> <input type="text" name="username"
					value="<?php echo $_smarty_tpl->getVariable('username')->value;?>
" />
			</td>
		</tr>
		<tr>
			<td> Password: </td>
				<td> <input type="password" name="password" /> </td>
		</tr>
	</table>
	<br /><input type="submit" value="Sign In"> 
	</form>
	<br />

	<br />
	<hr />
<!--
	<a href="http://salx9.rdg.ac.uk/i4life">
-->
	<a href=".">
		<img src="pics/i4life_logo_sm.jpg"
		BORDER=0 alt="i4life Logo" />
	</a>
	<p style="font-size:50%"> \$Id$ </p>
</body>
</html>
