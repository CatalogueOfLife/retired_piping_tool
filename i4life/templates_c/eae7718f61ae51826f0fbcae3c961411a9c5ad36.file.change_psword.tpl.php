<?php /* Smarty version Smarty-3.0.7, created on 2011-06-03 10:39:43
         compiled from "/var/www/i4life/templates/change_psword.tpl" */ ?>
<?php /*%%SmartyHeaderCode:21283542624de8abdf87caf0-55245019%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'eae7718f61ae51826f0fbcae3c961411a9c5ad36' => 
    array (
      0 => '/var/www/i4life/templates/change_psword.tpl',
      1 => 1307093969,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '21283542624de8abdf87caf0-55245019',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>


<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('message')->value;?>
</em></font><h3>

<?php if ($_smarty_tpl->getVariable('status_message')->value==''){?>
	<form action="change_psword.php" method="POST">
	<table>
		<tr>
		<td>Old Password:</td>
		<td><input type="password" name="o_psword" /></td>
		</tr>

		<tr>
		<td>New Password:</td>
		<td><input type="password" name="n_psword" /></td>
		</tr>

		<tr>
		<td>Confirm Password:</td>
		<td><input type="password" name="c_psword" /></td>
		</tr>

		<tr>
		<td><input type="submit" value="Submit"></td>
	</table>
	</form>
<?php }else{ ?>
	<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('status_message')->value;?>
</em></font><h3>
<?php }?>
