{* taxa template *}

{include file='header.tpl'}

<body>
{* top menu *}
<table border = 0>
<tr>
	<td style='vertical-align:top;'>
	<a href=".">
		<img src="pics/i4life_logo_sm.jpg" width="200"
		BORDER=0 alt="i4life Logo" />
	</a>
	</td>
	<td colspan="3" align="center">
	<h1 style="text-align:center">Piping Tools Taxa Table</h1>
	</td>
</tr>
{include file='colour_line.tpl'}
<tr>
	<td style='vertical-align:top'>
	<h5>Login: <i>{$username}</i></h5>
	<ul type='none'>
	{section name=item loop=$menu}
		<li>
		<a href={$menu[item].link}>{$menu[item].text}</a>
		</li>
	{/section}
	</ul>
	</td>
	<td colspan="3" align="center">
	<h3><font color="red"><em>{$message}</em></font></h3>

	{* here is where things are really started *}
	<table>
	{section name=row loop=$taxa}
	<tr>
		<td>{$taxa[row]['id']}</td>
		<td>{$taxa[row]['genus']}</td>
		<td>{$taxa[row]['specie_epithet']}</td>
		<td>{$taxa[row]['author_string']}</td>
		<td>{$taxa[row]['family']}</td>
		<td>{$taxa[row]['order']}</td>
	</tr>
	{/section}
	</table>
	</td>
</tr>
</table>

<hr />
<!--
	<a href="http://salx9.rdg.ac.uk/i4life">
-->
	<p style="font-size:50%"> \$Id$ </p>
</body>
</html>
