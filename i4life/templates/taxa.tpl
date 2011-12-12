{* taxa template *}
{* $Id: taxa.tpl,v 1.1 2011/06/03 11:23:18 kwok Exp kwok $ *}
<h3><font color="red"><em>{$message}</em></font></h3>

<form action='taxa.php' method='post'>

{* hidden value for paging *}
<input type=hidden name='totalPageNo' value='{$totalPageNo}' />

{**********************}
{* display taxa table *}
{**********************}
{if $status == 'display'}

<table>
<tr>
<td colspan=3 style="text-align:left;">
	<b>Total {$totalRecordNo} Records</b>
</td>

{* navigating features *}
<td colspan=2 style="text-align:center;">
{if $pre_page}
	<a	style="text-decoration:none;"
		href="taxa.php?pageNo={$pre_page}&totalPageNo={$totalPageNo}"
	>
		<img src="pics/left.gif" BORDER=0 alt="<" align="absmiddle" />
	</a>
{/if}
	<input name='toPage' type='submit' value='Page' />
	<input name='pageNo' type='text' size=2 value={$pageNo} />
	<b>of {$totalPageNo}</b>
{if $next_page}
	<a	style="text-decoration:none;"
		href="taxa.php?pageNo={$next_page}&totalPageNo={$totalPageNo}"
	>
		<img src="pics/right.gif" BORDER=0 alt=">" align="absmiddle" />
	</a> 
{/if}
</td>
{* end of navigating features *}

</tr>
<tr>
	<th>ID</th>
	<th>Genus</th>
	<th>Species epithet</th>
	<th>Author String</th>
	<th>Family</th>
	<th>Order</th>
{if $username == 'admin'}
	<th>Data Provider</th>
{/if}
</tr>

{section name=row loop=$taxa}
<tr class={cycle values="even-row,odd-row"}>
	<td style="text-align:left;">
		<input
			type="checkbox"
			name="taxa[]"
			value={$taxa[row]['id']}
			{if $allSelected}
				checked="checked"
			{/if}
		/>
		{$taxa[row]['id']}
	</td>
	<td>{$taxa[row]['genus']}</td>
	<td>{$taxa[row]['species_epithet']}</td>
	<td>{$taxa[row]['author_string']}</td>
	<td>{$taxa[row]['family']}</td>
	<td>{$taxa[row]['order']}</td>
{if $username == 'admin'}
	<td>{$taxa[row]['username']}</td>
{/if}
</tr>
{/section}

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

{*************************}
{* no taxon in the table *}
{*************************}
{elseif $status == 'emptytable'}

{**************}
{* edit taxon *}
{**************}
{elseif $status == 'edit'}

{* hidden value for paging *}
<input type=hidden name='pageNo' value='{$pageNo}' />

<table>

{section name=row loop=$taxa}
{* this hidden input value give id during save process *}
<input
	type=hidden
	name='id[{$taxa[row]['id']}]'
	value='{$taxa[row]['id']}'
/>
<tr>
	<td>Data Provider:</td>
	<td>{$taxa[row]['username']}</td>
</tr>
{foreach $edit_name as $fieldname => $editable}
	{if $editable}
	<tr>
		<td>{$f2d[$fieldname]}:</td>
		<td><input
				name='{$fieldname}[{$taxa[row]['id']}]'
				value='{$taxa[row][$fieldname]}'
			/>
		</td>
	</tr>
	{else}
	<tr>
		<td>{$f2d[$fieldname]}:</td>
		<td>{$taxa[row][$fieldname]}</td>
	</tr>
	{/if}
{/foreach}
<tr><td>&nbsp;</td></tr>
<tr style="background-color:grey;"><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
{/section}

</table>
<input name='editSave' type='submit' value='Save' />
<input name='editCancel' type='submit' value='Cancel' />

{/if}
</form>
