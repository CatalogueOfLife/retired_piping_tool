<?php /* Smarty version Smarty-3.0.7, created on 2011-07-11 11:21:36
         compiled from "/var/www/i4life/templates/upload2.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17528659314e1aceb0252b56-21291618%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'be33da4bcbe62380a5fab52a813dd9217407e3f4' => 
    array (
      0 => '/var/www/i4life/templates/upload2.tpl',
      1 => 1310379326,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17528659314e1aceb0252b56-21291618',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_function_cycle')) include '/usr/local/lib/Smarty/libs/plugins/function.cycle.php';
?>
<script>
function addField(selected_items, newField)
{
	newField += '\n'
	if (! selected_items.match(newField))
		selected_items += newField

	return selected_items
}
</script>
<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('message')->value;?>
</em></font><h3>

<noscript>
<h3><font color="red">
	<em>Please enable JavaScript on your web browser for this page.</em>
</font><h3>
</noscript>

<form	method='post'
		action='upload2.php'
		enctype='multipart/form-data'
>
<?php if ($_smarty_tpl->getVariable('status')->value=='inputform'){?>
<table>
<tr>
	<td colspan=2 align='center'><b>Data Columns Setting</b></td>
</tr>
<tr>
	<td>
		<select	name='input_fields'
				size=<?php echo $_smarty_tpl->getVariable('no_of_fields')->value;?>

				onChange="selected_items.value =
							addField(selected_items.value, this.value);"
		>

		<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['row']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['name'] = 'row';
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'] = is_array($_loop=$_smarty_tpl->getVariable('fieldname')->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['show'] = true;
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['max'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'] = 1;
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['start'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'] > 0 ? 0 : $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop']-1;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['show']) {
    $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'];
    if ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total'] == 0)
        $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['show'] = false;
} else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total'] = 0;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['show']):

            for ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'] = 1;
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'] <= $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total'];
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index'] += $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'], $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration']++):
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['rownum'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index_prev'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index_next'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['first']      = ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'] == 1);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['last']       = ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'] == $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total']);
?>
			<?php if ($_smarty_tpl->getVariable('required_fields')->value[$_smarty_tpl->getVariable('fieldname')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]]){?>
			<option value='<?php echo $_smarty_tpl->getVariable('fieldname')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']];?>
' style="color:red">
				<?php echo $_smarty_tpl->getVariable('fieldname')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']];?>

			</option>
			<?php }else{ ?>
			<option value='<?php echo $_smarty_tpl->getVariable('fieldname')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']];?>
'><?php echo $_smarty_tpl->getVariable('fieldname')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']];?>
</option>
			<?php }?>
		<?php endfor; endif; ?>

		</select>
	</td>
	<td>
		<textarea	id='selected_items'
					name='selected_items'
					cols=25
					rows=<?php echo $_smarty_tpl->getVariable('no_of_fields')->value;?>

					readonly
					style="overflow:hidden;font-family:arial;font-size:10pt"
		></textarea>
	</td>
</tr>
</table>
<script>
document.getElementById('selected_items').value = '<?php echo $_smarty_tpl->getVariable('selected_items')->value;?>
'
</script>
<input
	type="button"
	onclick="selected_items.value='<?php echo $_smarty_tpl->getVariable('preset_fields')->value;?>
';"
	value="Default Setting"
/>
<input
	type="button"
	onclick="selected_items.value='';"
	value="Clear"
/>
<p></p>
<table>
<tr>
	<td colspan=3 align='center'><b>Data Source</b></td>
</tr>
<tr>
	<td><input type="radio" name="source" value="file" /></td>
	<td>File:</td>
	<td><input type='file' name='filename' size='40' /></td>
</tr>

<tr>
	<td><input type="radio" name="source" value="url" /></td>
	<td>URL:</td>
	<td><input name='url' value='<?php echo $_smarty_tpl->getVariable('url')->value;?>
' size=40 /></td>
</tr>

<?php if ($_smarty_tpl->getVariable('username')->value=='admin'){?>
<tr>
	<td><input type="radio" name="source" value="server_file" /></td>
	<td>File on server:</td>
	<td>
		<input name='server_file' value='<?php echo $_smarty_tpl->getVariable('server_file')->value;?>
' size=40 readonly
		/><input
			name="server_file_select"
			type="submit"
			value="Browse&#133;"
		/>
	</td>
</tr>
<?php }?>

</table>
<p></p>
<table>
<tr>
	<td colspan=2 align='center'><b>Other Options</b><td>
</tr>
<tr>
	<td>
		<input
			type="checkbox"
			name="no_first_row"
			title="Ignore first row of data"
			value="no_first_row"
		/>
	</td>
	<td>Ignore first row of data</td>
</tr>
</table>
<table>
<tr>
<td>Field Delimited By:</td>
<td>
	<select name="delimitor">
		<option value="comma"    >Comma [ , ]    </option>
		<option value="semicolon">Semicolon [ ; ]</option>
		<option value="tab"      >Tab            </option>
		<option value="space"    >Space          </option>
	</select>
</td>
<td>&nbsp;</td>
<td>Field Enclosed By:</td>
<td>
	<select name="enclose_by">
		<option value="d_quote">Double Quote [ " ]</option>
		<option value="s_quote">Single Quote [ ' ]</option>
		<option value="none"   >None              </option>
	</select>
</td>
</tr>
</table>
<p></p>
<input name='upload' type='submit' value='Upload' style="color:limegreen" />
<?php }elseif($_smarty_tpl->getVariable('status')->value=='uploaded'){?>
<?php }elseif($_smarty_tpl->getVariable('status')->value=='server_file_select'){?>
<input
	type=hidden name='selected_items_copy'
	value='<?php echo $_smarty_tpl->getVariable('selected_items_copy')->value;?>
'
/>

<table>
<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['row']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['name'] = 'row';
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'] = is_array($_loop=$_smarty_tpl->getVariable('filenames')->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['show'] = true;
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['max'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'] = 1;
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['start'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'] > 0 ? 0 : $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop']-1;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['show']) {
    $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'];
    if ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total'] == 0)
        $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['show'] = false;
} else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total'] = 0;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['show']):

            for ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'] = 1;
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'] <= $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total'];
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index'] += $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'], $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration']++):
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['rownum'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index_prev'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index_next'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['index'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['first']      = ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'] == 1);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['last']       = ($_smarty_tpl->tpl_vars['smarty']->value['section']['row']['iteration'] == $_smarty_tpl->tpl_vars['smarty']->value['section']['row']['total']);
?>
<tr class=<?php echo smarty_function_cycle(array('values'=>"even-row,odd-row"),$_smarty_tpl);?>
>
<td>
	<input
		type="radio"
		name="file_selection"
		value="<?php echo $_smarty_tpl->getVariable('files')->value[$_smarty_tpl->getVariable('filenames')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]];?>
"
	/>
</td>
<td><?php echo $_smarty_tpl->getVariable('filenames')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']];?>
</td>
<td><?php echo $_smarty_tpl->getVariable('files')->value[$_smarty_tpl->getVariable('filenames')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]];?>
</td>
</tr>
<?php endfor; endif; ?>
</table>

<input name='submit_file_selection' type='submit' value='Open' />

<?php }?>

</form>
