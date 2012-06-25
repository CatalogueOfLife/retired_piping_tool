<?php /* Smarty version 3.0rc1, created on 2012-02-29 16:29:58
         compiled from "/var/www/piping2012/php/templates/master.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12251608294f4e52865ff998-71075674%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a02730d62cba5245da36dbb0ea96a5a4dd30a524' => 
    array (
      0 => '/var/www/piping2012/php/templates/master.tpl',
      1 => 1319125903,
    ),
  ),
  'nocache_hash' => '12251608294f4e52865ff998-71075674',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>


<?php $_template = new Smarty_Internal_Template('header.tpl', $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>


<body>
<table border = 0>
<tr>
	
	<td style='vertical-align:top;'>
	<a href=".">
		<img src="pics/i4life_logo_sm.jpg" width="200"
		BORDER=0 alt="i4life Logo" />
	</a>
	</td>

	
	<td colspan="3" align="center">
	<h1 style="text-align:center"><?php echo $_smarty_tpl->getVariable('page_title')->value;?>
</h1>
	</td>
</tr>


<?php $_template = new Smarty_Internal_Template('colour_line.tpl', $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>


<tr>
	
	<td style='vertical-align:top'>

	
	<?php if ($_smarty_tpl->getVariable('template')->value!='index.tpl'){?>
		<h5>Login: <i><?php echo $_smarty_tpl->getVariable('username')->value;?>
</i></h5>
		<ul type='none' class=menu>
		<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['item']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['name'] = 'item';
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['loop'] = is_array($_loop=$_smarty_tpl->getVariable('menu')->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['show'] = true;
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['max'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['loop'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['step'] = 1;
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['start'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['step'] > 0 ? 0 : $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['loop']-1;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['item']['show']) {
    $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['total'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['loop'];
    if ($_smarty_tpl->tpl_vars['smarty']->value['section']['item']['total'] == 0)
        $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['show'] = false;
} else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['total'] = 0;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['item']['show']):

            for ($_smarty_tpl->tpl_vars['smarty']->value['section']['item']['index'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['iteration'] = 1;
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['iteration'] <= $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['total'];
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['index'] += $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['step'], $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['iteration']++):
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['rownum'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['iteration'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['index_prev'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['index'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['index_next'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['index'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['first']      = ($_smarty_tpl->tpl_vars['smarty']->value['section']['item']['iteration'] == 1);
$_smarty_tpl->tpl_vars['smarty']->value['section']['item']['last']       = ($_smarty_tpl->tpl_vars['smarty']->value['section']['item']['iteration'] == $_smarty_tpl->tpl_vars['smarty']->value['section']['item']['total']);
?>
			<li>
<?php if ($_smarty_tpl->getVariable('currentFile')->value==$_smarty_tpl->getVariable('menu')->value[$_smarty_tpl->getVariable('smarty')->value['section']['item']['index']]['link']){?>
			<span class="disabled"><?php echo $_smarty_tpl->getVariable('menu')->value[$_smarty_tpl->getVariable('smarty')->value['section']['item']['index']]['text'];?>
</span>
<?php }else{ ?>
			<a href=<?php echo $_smarty_tpl->getVariable('menu')->value[$_smarty_tpl->getVariable('smarty')->value['section']['item']['index']]['link'];?>
><?php echo $_smarty_tpl->getVariable('menu')->value[$_smarty_tpl->getVariable('smarty')->value['section']['item']['index']]['text'];?>
</a>
<?php }?>
			</li>
		<?php endfor; endif; ?>
		</ul>
	<?php }?>

	</td>

	<td colspan="3" align="center">

	
	
	<?php $_template = new Smarty_Internal_Template($_smarty_tpl->getVariable('template')->value, $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>


	</td>
</tr>
</table>

<hr width="100%" />
<!--
	<a href="http://salx9.rdg.ac.uk/i4life">
-->

</body>
</html>
