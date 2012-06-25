<?php /* Smarty version 3.0rc1, created on 2012-02-29 16:31:16
         compiled from "/var/www/piping2012/php/templates/taxa.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1364694844f4e52d44ccfd4-66801165%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4847e8d4fd3375387e30f53f5ecbd39feafa3341' => 
    array (
      0 => '/var/www/piping2012/php/templates/taxa.tpl',
      1 => 1329404591,
    ),
  ),
  'nocache_hash' => '1364694844f4e52d44ccfd4-66801165',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_function_cycle')) include '/usr/share/php/smarty3/plugins/function.cycle.php';
?>

<h3><font color="red"><em><?php echo $_smarty_tpl->getVariable('message')->value;?>
</em></font></h3>

<form action='taxa.php' method='post'>


<input type=hidden name='totalPageNo' value='<?php echo $_smarty_tpl->getVariable('totalPageNo')->value;?>
' />




<?php if ($_smarty_tpl->getVariable('status')->value=='display'){?>

<table
	class=taxa

	
	frame=void

	border=1 

	
	bordercolor=white

	cellspacing=0
	cellpadding=0
>
<tr>
<td colspan=3 style="text-align:left;">
	<b>Total <?php echo $_smarty_tpl->getVariable('totalRecordNo')->value;?>
 Records</b>
</td>


<td colspan=18 style="text-align:center;">
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
	<input
		name='pageNo'
		type='text'
		size=6
		value=<?php echo $_smarty_tpl->getVariable('pageNo')->value;?>
 
		style="text-align:right;"
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
<td colspan=2><td>	


</tr>
<tr>
	<th></th>
	<th>taxonID</th>
	<th>genus</th>
	<th>specificEpithet</th>
	<th>scientificName</th>
	<th>scientificNameAuthorship</th>
	<th>infraspecificEpithet</th>
	<th>verbatimTaxonRank</th>
	<th>taxonRank</th>
	<th>taxonomicStatus</th>
	<th>acceptedNameUsageID</th>
	<th>parentNameUsageID</th>
	<th>family</th>
	<th>order</th>
	<th>class</th>
	<th>phylum</th>
	<th>kingdom</th>
	<th>higherClassification</th>
	<th>namePublishedIn</th>
	<th>taxonRemarks</th>
	<th>source</th>
	<th>tag</th>

<?php if ($_smarty_tpl->getVariable('username')->value=='admin'){?>
	<th>Data Provider</th>
<?php }?>

	<th class='gsd'>gsd_short_name</th>
	<th class='gsd'>gsd_status</th>
	<th class='gsd'>gsd_comments</th>
</tr>


<?php $_smarty_tpl->assign('old_acceptedNameUsageID',-1,null,null);?>

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

<?php if ($_smarty_tpl->getVariable('old_acceptedNameUsageID')->value!=$_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['acceptedNameUsageID']){?>


<tr><td class="line" colspan="30" height="3"></td></tr> 

<?php }?>

<?php if ($_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['taxonomicStatus']=='unknown'){?>

<tr class=<?php echo smarty_function_cycle(array('values'=>"even-row,odd-row"),$_smarty_tpl->smarty,$_smarty_tpl);?>

	style="color:#ff99ff;">  				
<?php }else{ ?>

<tr class=<?php echo smarty_function_cycle(array('values'=>"even-row,odd-row"),$_smarty_tpl->smarty,$_smarty_tpl);?>
>
<?php }?>

	<td style="text-align:left;">
		<input
			type="checkbox"
			name="taxa[]"
			value=<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['id'];?>

			<?php if ($_smarty_tpl->getVariable('allSelected')->value){?>
				checked="checked"
			<?php }?>
		/>
	</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['taxonID'];?>
</td>


<?php if ($_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['taxonomicStatus']=='accepted'){?>
	<td style="font-weight:bold;font-style:italic;">
		<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['genus'];?>

	</td>
	<td style="font-weight:bold;font-style:italic">
		<?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['specificEpithet'];?>

	</td>
<?php }else{ ?>
	<td style="font-style:italic;"><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['genus'];?>
</td>
	<td style="font-style:italic;"><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['specificEpithet'];?>
</td>
<?php }?>

	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['scientificName'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['scientificNameAuthorship'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['infraspecificEpithet'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['verbatimTaxonRank'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['taxonRank'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['taxonomicStatus'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['acceptedNameUsageID'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['parentNameusageID'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['family'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['order'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['class'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['phylum'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['kingdom'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['higherClassification'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['namePublishedIn'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['taxonRemarks'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['source'];?>
</td>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['tag'];?>
</td>

<?php if ($_smarty_tpl->getVariable('username')->value=='admin'){?>
	<td><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['username'];?>
</td>
<?php }?>

	
	<?php echo smarty_function_cycle(array('name'=>"gsd",'assign'=>"gsd_class",'values'=>"odd-row-gsd,even-row-gsd"),$_smarty_tpl->smarty,$_smarty_tpl);?>

	<td class=<?php echo $_smarty_tpl->getVariable('gsd_class')->value;?>
><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['gsd_short_name'];?>
</td>
	<td class=<?php echo $_smarty_tpl->getVariable('gsd_class')->value;?>
><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['gsd_status'];?>
</td>
	<td class=<?php echo $_smarty_tpl->getVariable('gsd_class')->value;?>
><?php echo $_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['gsd_comment'];?>
</td>

</tr>


<?php $_smarty_tpl->assign('old_acceptedNameUsageID',$_smarty_tpl->getVariable('taxa')->value[$_smarty_tpl->getVariable('smarty')->value['section']['row']['index']]['acceptedNameUsageID'],null,null);?>

<?php endfor; endif; ?>

<tr>
<td colspan=24>&nbsp; </td>
</tr>
<tr>
<td colspan=5>
	<input name='selectAll' type='submit' value='Select All' />
	<input name='clearAll' type='submit' value='Unselect All' />
	<input name='edit' type='submit' value='Edit Selected Record' />
</td>
<td colspan=2>
<input name='delete' type='submit' value='Delete Selected Record'
	style="color:red" />
</td>
<td colspan=16><td>	
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
if (count($_from) > 0){
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
<tr style="background-color:gray;"><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<?php endfor; endif; ?>

</table>
<input name='editSave' type='submit' value='Save' />
<input name='editCancel' type='submit' value='Cancel' />

<?php }?>
</form>
