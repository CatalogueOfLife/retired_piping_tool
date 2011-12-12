{* home page template *}

{include file='header.tpl'}

<body>
{* top menu *}
{section name=item loop=$menu}
	<a href={$menu[item].link}>{$menu[item].text}</a> |
{/section}

<h5>Login: <i>{$username}</i></h5>

<h1 style="text-align:center">Piping Tools Home Page</h1>

<hr/>

<h3><font color="red"><em>{$message}</em></font></h3>

{*
	<form action="index.php" method="POST">
*}

<table>
{section name=row loop=$taxa}
<tr>
	<td>{$taxa[row]['id']}</td>
	<td>{$taxa[row]['genus']}</td>
	<td>{$taxa[row]['specie_epithet']}</td>
	<td>{$taxa[row]['author_string']}</td>
	<td>{$taxa[row]['family']}</td>
	<td>{$taxa[row]['order']}</td>
{*
		<td><input type="text" name="username" value="{$username}" /></td>
		</tr>

		<tr>
		<td>Password:</td>
		<td><input type="password" name="password" /></td>
*}

</tr>
{/section}

</table>

{*
	<br /><input type="submit" value="Sign In"> 
	</form>

	<br />

	{include file='disclaimer'}
*}

	<br />
	<hr />
<!--
	<a href="http://salx9.rdg.ac.uk/i4life">
-->
	<a href=".">
		<img src="pics/i4life_logo_sm.jpg"
		BORDER=0 alt="i4life Logo" />
	</a>
	<p style="font-size:50%"> \$Id$ </p>
</body>
</html>
