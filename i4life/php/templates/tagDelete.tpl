{* home page template *}
{* $Id$ *}

<h3><font color="red"><em>{$message}</em></font></h3>


{**************************}
{* display tag list table *}
{**************************}
<form action='tagDelete.php' method='post'>
{if $status == 'display'}
<table>
<tr>
	<th></th>
	<th>Data Provider</th>
	<th>Tag</th>
	<th>Records Number</th>
</tr>

{section name=row loop=$tags}
<tr class={cycle values="even-row,odd-row"}>
	<td>
		<input
			type="checkbox"
			name="tags[]"
			{*
				'#*^@' is separator between tag name and provider_id 
				let hope users won't have this sequence of characters 
				in their tag names, or we will be screwed!!!!
			*}
			value="{$tags[row]['tag']}#*^@{$tags[row]['provider_id']}"
		/>
	</td>
	<td>{$tags[row]['username']}</td>
	<td>{$tags[row]['tag']}</td>
	<td style="text-align:right;">{$tags[row]['COUNT(tag)']}</td>
</td>
{/section}

</table>
<br />
<input
	name='delete'
	type='submit'
	value='Delete Selected Tag'
	style="color:red"
/>
</form>

{************************}
{* no data in the table *}
{************************}
{elseif $status == 'emptytable'}

{/if}
