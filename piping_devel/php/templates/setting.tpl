{* home page template *}
{* $Id$ *}

<h3><font color="red"><em>{$message}</em></font></h3>

{*******************************}
{* display setting option form *}
{*******************************}
<form action='setting.php' method='post'>
{if $status == 'display' and $username == 'admin'}
<table>
<tr>
<td>
<b>Load Catalogue of Life Information</b>
</td>
<td align='left'>
<input
	name='load_col_data'
	type='submit'
	value='Load CoL Data'
	style='color:black'
/>
</td>
</tr>
<tr></tr>	{* extra spacing *}
<tr>
<td>
<b>Start Scheduler:</b>
{*
<a target='_blank' href={$logFile}>Scheduler Log File</a>
*}
</td>
<td align='left' rowspan=2>
<input
	name='scheduler'
	type='submit'
	value='Start Scheduler'
	style='color:black'
/>
</td>
</tr>
<tr>
<td>
<a target='_blank' href={$logFile}>Scheduler Log File</a>
</td>
</tr>
<tr></tr>	{* extra spacing *}
<tr>
<td>
<b>Start Process Monitor Scheduler:</b>
{*
<a target='_blank' href={$logPMFile}>Scheduler Pmonit Log File</a>
*}
</td>
<td align='left' rowspan=2>
<input
	name='scheduler_pmonit'
	type='submit'
	value='Start Scheduler Pmonit'
	style='color:black'
/>
</td>
</tr>
<tr>
<td>
<a target='_blank' href={$logPMFile}>Scheduler Pmonit Log File</a>
</td>
</tr>
<tr></tr>	{* extra spacing *}
<tr>
<td>
<b>Clear Piping Tools Taxa Table</b>
</td>
<td align='left'>
<input
	name='reset_piping_tools'
	type='submit'
	value='Reset Piping Tools'
	style='color:red'
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

{elseif $status == 'loaded_CoL_data' and $username == 'admin'}
<h2>
Loaded Catalogue of Life Data
</h2>
	<input
		name='cancel'
		type='submit'
		value='O.K.'
	/>
{/if}

{*/if*} {* end of "if $username == 'admin'" *}

</form>
