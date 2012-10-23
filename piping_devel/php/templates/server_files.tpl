{* server files page template *}
{* $Id$ *}

<h3><font color="red"><em>{$message}</em></font></h3>

<table>
{section name=row loop=$filenames}
{*
	<p>
	{$filenames[row]}
*}

<tr>
<td>{$filenames[row]}</td>
<td>{$files[$filenames[row]]}<td>
</tr>
{/section}
</table>
