<?php /* Smarty version Smarty-3.0.7, created on 2011-07-01 15:03:11
         compiled from "/var/www/i4life/templates/taxa.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14992656124e0dd39fae1327-59219829%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b5762bd4b523e27693ad3d3457e759b8aaa5b068' => 
    array (
      0 => '/var/www/i4life/templates/taxa.tpl',
      1 => 1309528989,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14992656124e0dd39fae1327-59219829',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_function_cycle')) include '/usr/local/lib/Smarty/libs/plugins/function.cycle.php';
?>
<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('message')->value;?>
</em></font></h3>

<form action='taxa.php' method='post'>
<input type=hidden name='totalPageNo' value='<?php echo $_smarty_tpl->getVariable('totalPageNo')->value;?>
' />
<?php if ($_smarty_tpl->getVariable('status')->value=='display'){?>

<table>
<tr>
<td colspan=3 style="text-align:left;">
	<b>Total <?php echo $_smarty_tpl->getVariable('totalRecordNo')->value;?>
 Records</b>
</td>
<td colspan=2 style="text-align:center;">
<?php if ($_smarty_tpl->getVariable('pre_page')->value){?>
	<a	style="text-decoration:none;"
		href="taxa.php?pageNo=<?php echo $_smarty_tpl->getVariable('pre_page')->value;?>
&totalPageNo=<?php echo $_smarty_tpl->getVariable('totalPageNo')->value;?>
"
	>
		<img src="pics/left.gif" BORDER=0 alt="<" align="absmiddle" />
	</a>
<?php }?>
	<input name='toPage' type='submit' value='Page' />
	<input name='pageNo' type='text' size=2 value=<?php echo $_smarty_tpl->getVariable('pageNo')->value;?>
 />
	<b>of <?php echo $_smarty_tpl->getVariable('totalPageNo')->value;?>
</b>
<?php if ($_smarty_tpl->getVariable('next_page')->value){?>
	<a	style="text-decoration:none;"
		href="taxa.php?pageNo=<?php echo $_smarty_tpl->getVariable('next_page')->value;?>
&totalPageNo=<?php echo $_smarty_tpl->getVariable('totalPageNo')->value;?>
"
	>
		<img src="pics/right.gif" BORDER=0 alt=">" align="absmiddle" />
	</a> 
<?php }?>
</td>

</tr>
<tr>
	<th>ID</th>
	<th>Genus</th>
	<th>Species epithet</th>
	<th>Author String</th>
	<th>Family</th>
	<th>Order</th>
<?php if ($_smarty_tpl->getVariable('username')->value=='admin'){?>
	<th>Data Provider</th>
<?php }?>
</tr>

<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['row']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['name'] = 'row';
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'] = is_array($_loop=$_smarty_tpl->getVariable('taxa')->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
	<td style="text-align:left;">
		<input
			type="checkbox"
			name="taxa[]"
			value=<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['id'];?>

			<?php if ($_smarty_tpl->getVariable('allSelected')->value){?>
				checked="checked"
			<?php }?>
		/>
		<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['id'];?>

	</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['genus'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['species_epithet'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['author_string'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['family'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['order'];?>
</td>
<?php if ($_smarty_tpl->getVariable('username')->value=='admin'){?>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['username'];?>
</td>
<?php }?>
</tr>
<?php endfor; endif; ?>

<tr>
<td>&nbsp; </td>
</tr>
<tr>
<td colspan=4>
	<input name='selectAll' type='submit' value='Select All' />
	<input name='clearAll' type='submit' value='Unselect All' />
	<input name='edit' type='submit' value='Edit Selected Taxa' />
</td>
<td colspan=2>
<input name='delete' type='submit' value='Delete Selected Taxa'
	style="color:red" />
</td>
</tr>

</table>
<br />
<?php }elseif($_smarty_tpl->getVariable('status')->value=='emptytable'){?>
<?php }elseif($_smarty_tpl->getVariable('status')->value=='edit'){?>
<input type=hidden name='pageNo' value='<?php echo $_smarty_tpl->getVariable('pageNo')->value;?>
' />

<table>

<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['row']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['name'] = 'row';
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'] = is_array($_loop=$_smarty_tpl->getVariable('taxa')->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
<input
	type=hidden
	name='id[<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['id'];?>
]'
	value='<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['id'];?>
'
/>
<tr>
	<td>Data Provider:</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['username'];?>
</td>
</tr>
<?php  $_smarty_tpl->tpl_vars['editable'] = new Smarty_Variable;
 $_smarty_tpl->tpl_vars['fieldname'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('edit_name')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['editable']->key => $_smarty_tpl->tpl_vars['editable']->value){
 $_smarty_tpl->tpl_vars['fieldname']->value = $_smarty_tpl->tpl_vars['editable']->key;
?>
	<?php if ($_smarty_tpl->tpl_vars['editable']->value){?>
	<tr>
		<td><?php echo $_smarty_tpl->getVariable('f2d')->value[$_smarty_tpl->tpl_vars['fieldname']->value];?>
:</td>
		<td><input
				name='<?php echo $_smarty_tpl->tpl_vars['fieldname']->value;?>
[<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['id'];?>
]'
				value='<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']][$_smarty_tpl->tpl_vars['fieldname']->value];?>
'
			/>
		</td>
	</tr>
	<?php }else{ ?>
	<tr>
		<td><?php echo $_smarty_tpl->getVariable('f2d')->value[$_smarty_tpl->tpl_vars['fieldname']->value];?>
:</td>
		<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']][$_smarty_tpl->tpl_vars['fieldname']->value];?>
</td>
	</tr>
	<?php }?>
<?php }} ?>
<tr><td>&nbsp;</td></tr>
<tr style="background-color:grey;"><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<?php endfor; endif; ?>

</table>
<input name='editSave' type='submit' value='Save' />
<input name='editCancel' type='submit' value='Cancel' />

<?php }?>
</form>
