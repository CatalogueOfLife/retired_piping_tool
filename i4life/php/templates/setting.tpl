{* home page template *}
{* $Id$ *}

<h3><font color="red"><em>{$message}</em></font></h3>

{*******************************}
{* display setting option form *}
{*******************************}
<form action='setting.php' method='post'>
{if $status == 'display' and $username == 'admin'}
{*
{if $username ==  'admin'}
*}
<input
	name='reset_piping_tools'
	type='submit'
	value='Reset Piping Tools'
	style='color:red'
/>
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
