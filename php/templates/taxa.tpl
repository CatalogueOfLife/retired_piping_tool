{* taxa template *}
{* $Id: taxa.tpl,v 1.3 2011/10/19 15:55:59 kwok Exp kwok $ *}
<script>

window.onload = function(){


	var scientificName =
			document.getElementsByClassName("scientificName")

/* comment out this, as the internal tables scientificName is now been
  capitalilzed, it is no longer needed

	// Capitalize the first letter in scientificName
	for (var i = 0; i < scientificName.length; i++) {
		var name = scientificName[i].innerHTML;
		scientificName[i].innerHTML =
			name.slice(0,1).toUpperCase() + name.slice(1);
	}
*/

	// transform '1' in in_col to "Yes"
	var in_cols =
			document.getElementsByName("in_col")

	for (var i = 0; i < in_cols.length; i++) {
		var in_col = in_cols[i].innerHTML;
		if (in_col)
			in_cols[i].innerHTML = "Yes";
	}

/* Doesn't need to change gsd short name to 'Yes' or change
	scientific name to link to give gsd info any more!!!

	// transform '1' in gsd_short_name to "Yes"
	var g_s_names =
			document.getElementsByName("g_s_name")

	var int_ids =
			document.getElementsByClassName("int_id")

	for (var i = 0; i < g_s_names.length; i++) {
		var g_s_name = g_s_names[i].innerHTML;
		if (g_s_name)
		{
			// transform '1' in gsd_short_name to "Yes"
			g_s_names[i].innerHTML = "Yes";

			// need to change this to a link
			//scientificName[i].innerHTML = int_ids[i].value
			var sc_name = scientificName[i].innerHTML;
			scientificName[i].innerHTML =
				"<a target='_blank'" + 
					"href=taxa_gsd.php?id=" + int_ids[i].value + ">" +
											sc_name + "</a>";
		}
	}
*/
};
</script>

<h3><font color="red"><em>{$message}</em></font></h3>

<noscript>
<h3><font color="red">
	<em>Please enable JavaScript on your web browser for this page.</em>
</font></h3>
</noscript>

<form action='taxa.php' method='post'>

{* hidden value for paging *}
<input type=hidden name='totalPageNo' value='{$totalPageNo}' />

{**********************}
{* display taxa table *}
{**********************}
{if $status == 'display'}

<table
	class=taxa

	{* remove table external border *}
	frame=void

	border=1 

	{* FireFox need this to make internal border white *}
	bordercolor=white

	cellspacing=0
	cellpadding=0
>
<tr>
<td colspan=3 style="text-align:left;">
	<b>Total {$totalRecordNo} Records</b>
</td>

{* navigating features *}
<td colspan=18 style="text-align:center;">
{if $pre_page}
	<a	style="text-decoration:none;"
		href="taxa.php?pageNo={$pre_page}&totalPageNo={$totalPageNo}"
	>
		<img src="pics/left.gif" BORDER=0 alt="<" align="absmiddle" />
	</a>
{/if}
	<input name='toPage' type='submit' value='Page' />
	<input
		name='pageNo'
		type='text'
		size=6
		value={$pageNo} 
		style="text-align:right;"
	/>
	<b>of {$totalPageNo}</b>
{if $next_page}
	<a	style="text-decoration:none;"
		href="taxa.php?pageNo={$next_page}&totalPageNo={$totalPageNo}"
	>
		<img src="pics/right.gif" BORDER=0 alt=">" align="absmiddle" />
	</a> 
{/if}
</td>
<td colspan=2><td>	{* this is needed to suppress empty cells in Opera *}
{* end of navigating features *}

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
	<th>history_status</th>
	<th>tag</th>

{if $username == 'admin'}
	<th>Data Provider</th>
{/if}
	<th class='gsd'>in_col</th>
	<th class='gsd'>gsd_short_name</th>
	<th class='gsd'>gsd_status</th>
	<th class='gsd'>gsd_comments</th>

{*
<span class='gsd'>
	<th>gsd_short_name</th>
</span>
	<th>gsd_status</th>
	<th>gsd_comments</th>
*}
</tr>

{* Initialise $old_acceptedNameUsageID to a never occur nominal value *}
{$old_acceptedNameUsageID = -1}

{section name=row loop=$taxa}

{if $old_acceptedNameUsageID != $taxa[row]['acceptedNameUsageID']}

{* Have a gray row is acceptedNameUsageID changed *}
<tr><td class="line" colspan="30" height="3"></td></tr> {* gray row *}

{/if}

{if $taxa[row]['taxonomicStatus'] == 'unknown'}
{* Pink text if record is unknown *}
<tr class={cycle values="even-row,odd-row"}
	style="color:#ff99ff;">  				{* pink text table row *}
{else}
{* Black text for all other records *}
<tr class={cycle values="even-row,odd-row"}>
{/if}

	<td style="text-align:left;">
		<input
			class="int_id"
			type="checkbox"
			name="taxa[]"
			value={$taxa[row]['id']}
			{if $allSelected}
				checked="checked"
			{/if}
		/>
	</td>
	<td>{$taxa[row]['taxonID']}</td>

{* Taxon name will be bold *}
{if $taxa[row]['taxonomicStatus'] == 'accepted'}
	<td style="font-weight:bold;font-style:italic;">
		{$taxa[row]['genus']}
	</td>
	<td style="font-weight:bold;font-style:italic">
		{$taxa[row]['specificEpithet']}
	</td>
{else}
	<td style="font-style:italic;">{$taxa[row]['genus']}</td>
	<td style="font-style:italic;">{$taxa[row]['specificEpithet']}</td>
{/if}

	<td class="scientificName">{$taxa[row]['scientificName']}</td>
	<td>{$taxa[row]['scientificNameAuthorship']}</td>
	<td>{$taxa[row]['infraspecificEpithet']}</td>
	<td>{$taxa[row]['verbatimTaxonRank']}</td>
	<td>{$taxa[row]['taxonRank']}</td>
	<td>{$taxa[row]['taxonomicStatus']}</td>
	<td>{$taxa[row]['acceptedNameUsageID']}</td>
	<td>{$taxa[row]['parentNameusageID']}</td>
	<td>{$taxa[row]['family']}</td>
	<td>{$taxa[row]['order']}</td>
	<td>{$taxa[row]['class']}</td>
	<td>{$taxa[row]['phylum']}</td>
	<td>{$taxa[row]['kingdom']}</td>
	<td>{$taxa[row]['higherClassification']}</td>
	<td>{$taxa[row]['namePublishedIn']}</td>
	<td>{$taxa[row]['taxonRemarks']}</td>
	<td>{$taxa[row]['source']}</td>
	<td style="text-align:center;">{$taxa[row]['history_status']}</td>
	<td>{$taxa[row]['tag']}</td>

{if $username == 'admin'}
	<td>{$taxa[row]['username']}</td>
{/if}

	{* give the gsd section opposite alternate colour *}
	{cycle name="gsd" assign="gsd_class" values="odd-row-gsd,even-row-gsd"}
	<td class={$gsd_class} name="in_col">{$taxa[row]['in_col']}</td>
	<td class={$gsd_class} name="g_s_name">{$taxa[row]['gsd_short_name']}</td>
	<td class={$gsd_class}>{$taxa[row]['gsd_status']}</td>
	<td class={$gsd_class}>{$taxa[row]['gsd_comment']}</td>

</tr>

{* set old_acceptedNameUsageID value to the row just finished *}
{$old_acceptedNameUsageID = $taxa[row]['acceptedNameUsageID']}

{/section}

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
<td colspan=16><td>	{* this is needed to suppress empty cells in Opera *}
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
<tr style="background-color:gray;"><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
{/section}

</table>
<input name='editSave' type='submit' value='Save' />
<input name='editCancel' type='submit' value='Cancel' />

{/if}
</form>
