<?php /* Smarty version Smarty-3.0.7, created on 2011-06-03 12:23:57
         compiled from "/var/www/i4life/templates/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3390934454de8c44d281105-72530756%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '31d318faf305e9c10209bc69726838f8ff1d7fd5' => 
    array (
      0 => '/var/www/i4life/templates/index.tpl',
      1 => 1307097561,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3390934454de8c44d281105-72530756',
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
 echo $_template->getRenderedTemplate();?><?php unset($_template);?>

