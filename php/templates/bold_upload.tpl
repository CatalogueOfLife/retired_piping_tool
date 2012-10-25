{* bold_upload template *}
{* $Id$ *}
<h3><font color="red"><em>{$message}</em></font><h3>

<noscript>
<h3><font color="red">
	<em>Please enable JavaScript on your web browser for this page.</em>
</font></h3>
</noscript>

<form	method='post'
		action='bold_upload.php'
		enctype='multipart/form-data'
>

{**************}
{* input form *}
{**************}
{if $status == 'inputform'}
{* show uploading option input form *}

{* Upload Source Selection *}
<p></p>
<table>
<tr>
	<td colspan=3 align='center'><b>Data Source</b></td>
</tr>
<tr>
	<td>File:</td>
	<td><input type='file' name='filename' size='40' /></td>
</tr>

</table>
<p></p>

{*
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
*}
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
