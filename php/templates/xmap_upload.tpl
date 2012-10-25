{* upload template *}
{* $Id$ *}
<script>
/*
function addField(selected_items, newField)
{
	pattern = newField

	// for reason I don't know, this character return really upset
	// match() method in MS IE!!!!
	// that's why save it in 'pattern' without '\n' for the match method
	newField += '\n'
//	if (! selected_items.match(newField))
	if (! selected_items.match(pattern))
		selected_items += newField

	return selected_items
}
*/
</script>
<h3><font color="red"><em>{$message}</em></font><h3>

<noscript>
<h3><font color="red">
	<em>Please enable JavaScript on your web browser for this page.</em>
</font></h3>
</noscript>

<form	method='post'
		action='xmap_upload.php'
		enctype='multipart/form-data'
>

{**************}
{* input form *}
{**************}
{if $status == 'inputform'}
{* show uploading option input form *}

{* Column Option *}
{*
<table>
<tr>
	<td colspan=2 align='center'><b>Data Columns Setting</b></td>
</tr>
<tr>
	<td>
		<select	name='input_fields'
				size={$no_of_fields}
				onChange="selected_items.value =
							addField(selected_items.value, this.value);"
		>

		{section name=row loop=$fieldname}
			{if $required_fields[$fieldname[row]]}
			<option value='{$fieldname[row]}' style="color:red">
				{$fieldname[row]}
			</option>
			{else}
			<option value='{$fieldname[row]}'>{$fieldname[row]}</option>
			{/if}
		{/section}

		</select>
	</td>
	<td>
		<textarea	id='selected_items'
					name='selected_items'
					cols=25
					rows={$no_of_fields}
					readonly
					style="overflow:hidden;font-family:arial;font-size:10pt"
		></textarea>
	</td>
</tr>
</table>
*}
<script>
//document.getElementById('selected_items').value = '{$selected_items}'
</script>

{* default setting button *}
{*
<input
	type="button"
	onclick="selected_items.value='{$preset_fields}';"
	value="Default Setting"
/>
*}

{* clear button *}
{*
<input
	type="button"
	onclick="selected_items.value='';"
	value="Clear"
/>
*}

{* Upload Source Selection *}
<p></p>
<table>
<tr>
	<td colspan=3 align='center'><b>Data Source</b></td>
</tr>
<tr>
{*
{if $source == 'file'}
	<td><input type="radio" name="source" value="file" checked /></td>
{else}
	<td><input type="radio" name="source" value="file" /></td>
{/if}
*}
	<td>File:</td>
	<td><input type='file' name='filename' size='40' /></td>
</tr>

{*
<tr>
{if $source == 'url'}
	<td><input type="radio" name="source" value="url" checked /></td>
{else}
	<td><input type="radio" name="source" value="url" /></td>
{/if}
	<td>URL:</td>
	<td align='left'><input name='url' value='{$url}' size=40 /></td>
</tr>

{if $username == 'admin'}
<tr>
	{if $source == 'server_file'}
		<td><input
				type="radio"
				name="source"
				value="server_file"
				checked
		/></td>
	{else}
		<td><input
				type="radio"
				name="source"
				value="server_file"
		/></td>
	{/if}
	<td>File on server:</td>
	<td align='left'>
		<input name='server_file' value='{$server_file}' size=40 readonly
		/><input
			name="server_file_select"
			type="submit"
			value="Browse&#133;"
		/>
	</td>
</tr>
{/if}
*}

</table>
<p></p>

{* other options *}
{*
<table>
<tr>
	<td colspan=5 align='center'><b>Other Options</b></td>
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
	<td width=20pt></td>
	<td>
		Tag for this upload (optional)
	</td>
	<td>
		<input type='text' name='tag' />
	</td>
</tr>
</table>
*}
<table>
<tr>
<td>Data Provider:</td>
<td>
	<select name="dataProvider">
		<option value="ENA"     >ENA     </option>
		<option value="CBOL"    >CBOL    </option>
		<option value="GBIF"    >GBIF    </option>
		<option value="IUCN"    >IUCN    </option>
		<option value="Mycobank">Mycobank</option>
	</select>
</td>
{*
<td>&nbsp;</td>
<td>Field Enclosed By:</td>
<td>
	<select name="enclose_by">
		<option value="d_quote">Double Quote [ " ]</option>
		<option value="s_quote">Single Quote [ ' ]</option>
		<option value="none"   >None              </option>
	</select>
</td>
*}
</tr>
</table>
<p></p>
<input name='upload' type='submit' value='Upload' style="color:limegreen" />

{* my experiment with button!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
<button type='submit'> <img src='pics/i4life_logo_sm.jpg' width='200' BORDER=0 /></button>
*}

{******************}
{* after uploaded *}
{******************}
{elseif $status == 'uploaded'}
{* after file been uploaded, only show the $status_message *}


{*****************************}
{* server file selection form*}
{*****************************}
{elseif $status == 'server_file_select'}

{* hidden value to retain field column setting *}
<input
	type=hidden name='selected_items_copy'
	value='{$selected_items_copy}'
/>

<table>
{* {section name=row loop=$filenames} *}
{section name=row loop=$files}
<tr class={cycle values="even-row,odd-row"}>
<td>
	<input
		type="radio"
		name="file_selection"
		value="{$files[row]}"
		{* value="{$files[$filenames[row]]}" *}
	/>
</td>
{* <td>{$filenames[row]}</td> *}
<td>{$files[row]}</td>
{* <td>{$files[$filenames[row]]}</td> *}
</tr>
{/section}
</table>

<input name='submit_file_selection' type='submit' value='Open' />

{/if}

</form>
