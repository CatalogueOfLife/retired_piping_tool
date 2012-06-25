<?php /* Smarty version 3.0rc1, created on 2012-03-12 14:29:38
         compiled from "/var/www/piping2012/php/templates/user_list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2756746184f5e085235e294-84487135%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b4e044dc4d0af30813ed3ab6dcfc0eb740515562' => 
    array (
      0 => '/var/www/piping2012/php/templates/user_list.tpl',
      1 => 1322495256,
    ),
  ),
  'nocache_hash' => '2756746184f5e085235e294-84487135',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_function_cycle')) include '/usr/share/php/smarty3/plugins/function.cycle.php';
?>


<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('message')->value;?>
</em></font></h3>

<form action='user_list.php' method='post'>




<?php if ($_smarty_tpl->getVariable('status')->value=='display'){?>
<table>
<tr>
	<th></th>
	<th>User ID</th>
	<th>User Name</th>



</tr>

<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['row']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['name'] = 'row';
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'] = is_array($_loop=$_smarty_tpl->getVariable('user')->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
<tr class=<?php echo smarty_function_cycle(array('values'=>"even-row,odd-row"),$_smarty_tpl->smarty,$_smarty_tpl);?>
>
	<td>
	  <input type="checkbox" name="users[]" value=<?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['userid'];?>
 />
	</td>
	<td><?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['userid'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['username'];?>
</td>



</tr>
<?php endfor; endif; ?>

</table>
<br />
<input name='addUser' type='submit' value='Add User' />
<input name='editUser' type='submit' value='Edit Selected Users' />
<input name='deleteUser' type='submit' value='Delete Selected Users'
	style="color:red" />




<?php }elseif($_smarty_tpl->getVariable('status')->value=='emptytable'){?>
<input name='addUser' type='submit' value='Add User' />




<?php }elseif($_smarty_tpl->getVariable('status')->value=='adduser'){?>
<table>
<tr>
	<td>User Name:</td>
	<td><input name='name'</td>
</tr>
<tr>
	<td>Password:</td>
	<td><input name='password'</td>
</tr>



<tr>
	<td></td>
	<td><input name='addNew' type='submit' value='Save' />
		<input name='addCancel' type='submit' value='Cancel' /></td>
</tr>
</table>




<?php }elseif($_smarty_tpl->getVariable('status')->value=='edit'){?>
<table>

<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['row']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['name'] = 'row';
$_smarty_tpl->tpl_vars['smarty']->value['section']['row']['loop'] = is_array($_loop=$_smarty_tpl->getVariable('user')->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
	name='userid[<?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['userid'];?>
]'
	value='<?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['userid'];?>
'
/>
<tr>
	<td>User ID:</td>
	<td><?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['userid'];?>
</td>
</tr>
<tr>
	<td>User Name:</td>
	<td><input
			name='username[<?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['userid'];?>
]'
			value='<?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['username'];?>
'
		/>
	</td>
</tr>



<tr>
	<td>Password<font color='red'>*</font>:</td>
	<td><input
			name='password[<?php echo $_smarty_tpl->getVariable('user')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['userid'];?>
]'
		/>
	</td>
</tr>
<tr><td>&nbsp;</td></tr>
<?php endfor; endif; ?>

</table>
<input name='editSave' type='submit' value='Save' />
<input name='editCancel' type='submit' value='Cancel' />
<p>
	<font color='red'>*</font>If password input is left blank,
password will be unaffected.
</p>

<?php }?>
</form>
