<?php /* Smarty version 3.0rc1, created on 2012-06-25 10:56:06
         compiled from "/var/www/piping/php/templates/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18591564854fe835b68ff2f6-94464099%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '650275f731ea87689b1d6fe9d6275c865dedc4c8' => 
    array (
      0 => '/var/www/piping/php/templates/index.tpl',
      1 => 1307097561,
    ),
  ),
  'nocache_hash' => '18591564854fe835b68ff2f6-94464099',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>



<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('message')->value;?>
</em></font><h3>

<form action="index.php" method="POST">
<table>

	<tr>
	<td>Username:</td>
	<td><input type="text" name="username" value="<?php echo $_smarty_tpl->getVariable('username')->value;?>
" /></td>
	</tr>

	<tr>
	<td>Password:</td>
	<td><input type="password" name="password" /></td>
	</tr>

</table>
<br /><input type="submit" value="Sign In"> 
</form>

<br />

<?php $_template = new Smarty_Internal_Template('disclaimer', $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>


