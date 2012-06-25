<?php /* Smarty version 3.0rc1, created on 2012-03-12 14:29:40
         compiled from "/var/www/piping2012/php/templates/change_psword.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1476195134f5e0854f1b862-32958698%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '53a00e7ba8c90a9796f696c00d342556e00d0a8a' => 
    array (
      0 => '/var/www/piping2012/php/templates/change_psword.tpl',
      1 => 1307093969,
    ),
  ),
  'nocache_hash' => '1476195134f5e0854f1b862-32958698',
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
