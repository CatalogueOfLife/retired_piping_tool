{* home page template *}
{* $Id$ *}

<h3><font color="red"><em>{$message}</em></font></h3>

{*******************************}
{* display setting option form *}
{*******************************}
<form action='dwc.php' method='post'>
{if $status == 'display' and $username == 'admin'}
<table>
<tr>
	<td colspan=4 align='center'><b>Upload DwC Core of:</b></td>
</tr>
<tr>
	<td>
	<input
		name='cbol'
		type='submit'
		value='CBOL'
		style='color:limegreen'
	/>
	</td>
	<td>
	<input
		name='ena'
		type='submit'
		value='ENA'
		style='color:limegreen'
	/>
	</td>
	<td>
	<input
		name='gbif'
		type='submit'
		value='GBIF'
		style='color:limegreen'
	/>
	</td>
	<td>
	<input
		name='iucn'
		type='submit'
		value='IUCN'
		style='color:limegreen'
	/>
	</td>
</tr>
</table>
{elseif $status == 'confirm_reset' and $username == 'admin'}
{* set confirm button *}
<table>
<tr>
<td colspan=2 align='center'> <h3>Do you want to clear all taxa data records?</h3> </td>
</tr>
<tr>
<td align='center'>
	<input
		name='cancel'
		type='submit'
		value='Cancel'
	/>
</td>
<td align='center'>
	<input
		name='confirm_reset'
		type='submit'
		value='Confirm'
		style='color:red;'
	 />
</td>
</tr>
</table>

{/if}

{*/if*} {* end of "if $username == 'admin'" *}

</form>
