<?php /* Smarty version 3.0rc1, created on 2012-02-29 16:29:58
         compiled from "/var/www/piping2012/php/templates/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17389891814f4e5286937bd7-88143863%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '02a1b6a4954bac77ccc2ba18d9405a28dd126650' => 
    array (
      0 => '/var/www/piping2012/php/templates/index.tpl',
      1 => 1307097561,
    ),
  ),
  'nocache_hash' => '17389891814f4e5286937bd7-88143863',
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


