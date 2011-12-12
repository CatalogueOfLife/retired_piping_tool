{* home page template *}
{include file='header.tpl'}

<body>
<table border = 0>
<tr>
	{* i4Life logo *}
	{include file='logo.tpl'}

	{* page title *}
	<td colspan="3" align="center">
	<h1 style="text-align:center">Piping Tools Home Page</h1>
	</td>
</tr>

{* line with 4 colours *}
{include file='colour_line.tpl'}

<tr>
	{* menu *}
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

	{* actual contents *}
	<td colspan="3" align="center">
	<h3><font color="red"><em>{$message}</em></font></h3>
	<h4>Piping Tools Status Info will be here.</h4>
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
