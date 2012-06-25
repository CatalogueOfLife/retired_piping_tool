<?php /* Smarty version 3.0rc1, created on 2012-02-29 16:31:17
         compiled from "/var/www/piping2012/php/templates/dwc.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11955693724f4e52d5586715-32342673%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8f384b7a856f496884995caf480188120ced480a' => 
    array (
      0 => '/var/www/piping2012/php/templates/dwc.tpl',
      1 => 1329219293,
    ),
  ),
  'nocache_hash' => '11955693724f4e52d5586715-32342673',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>



<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('message')->value;?>
</em></font></h3>




<form action='dwc.php' method='post'>
<?php if ($_smarty_tpl->getVariable('status')->value=='display'&&$_smarty_tpl->getVariable('username')->value=='admin'){?>
<table>
<tr>
	<td colspan=4 align='center'><b>Upload DwC Core of:</b></td>
</tr>
<tr>
	<td>
	<input
		name='cbol'
		type='submit'
		value='CBOL'
		style='color:limegreen'
	/>
	</td>
	<td>
	<input
		name='ena'
		type='submit'
		value='ENA'
		style='color:limegreen'
	/>
	</td>
	<td>
	<input
		name='gbif'
		type='submit'
		value='GBIF'
		style='color:limegreen'
	/>
	</td>
	<td>
	<input
		name='iucn'
		type='submit'
		value='IUCN'
		style='color:limegreen'
	/>
	</td>
</tr>
</table>
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
