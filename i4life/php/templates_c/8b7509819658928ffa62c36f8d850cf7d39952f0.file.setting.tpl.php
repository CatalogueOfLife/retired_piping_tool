<?php /* Smarty version 3.0rc1, created on 2012-03-12 14:29:41
         compiled from "/var/www/piping2012/php/templates/setting.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14699869044f5e0855bea6d3-27592335%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8b7509819658928ffa62c36f8d850cf7d39952f0' => 
    array (
      0 => '/var/www/piping2012/php/templates/setting.tpl',
      1 => 1322474540,
    ),
  ),
  'nocache_hash' => '14699869044f5e0855bea6d3-27592335',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>



<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('message')->value;?>
</em></font></h3>




<form action='setting.php' method='post'>
<?php if ($_smarty_tpl->getVariable('status')->value=='display'&&$_smarty_tpl->getVariable('username')->value=='admin'){?>

<input
	name='reset_piping_tools'
	type='submit'
	value='Reset Piping Tools'
	style='color:red'
/>
<?php }elseif($_smarty_tpl->getVariable('status')->value=='confirm_reset'&&$_smarty_tpl->getVariable('username')->value=='admin'){?>

<table>
<tr>
<td colspan=2 align='center'> <h3>Do you want to clear all taxa data records?</h3> </td>
</tr>
<tr>
<td align='center'>
	<input
		name='cancel'
		type='submit'
		value='Cancel'
	/>
</td>
<td align='center'>
	<input
		name='confirm_reset'
		type='submit'
		value='Confirm'
		style='color:red;'
	 />
</td>
</tr>
</table>

<?php }?>

 

</form>
