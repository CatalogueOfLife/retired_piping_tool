{* index / login template *}

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Piping Tools</title>
   		<LINK href="style.css" rel="stylesheet" type="text/css">
<!--
			<base href="http://salx9.rdg.ac.uk/i4life/" />
-->
</head>

<body>
	<h1 style="text-align:center">Piping Tools</h1>
	<hr/>

	<h3><font color="red">{$message}</font></h3>

	<form action="index.php" method="POST">
	<table>

		<tr>
		<td>Username:</td>
		<td><input type="text" name="username" value="{$username}" /></td>
		</tr>

		<tr>
		<td>Password:</td>
		<td><input type="password" name="password" /></td>
		</tr>

	</table>
	<br /><input type="submit" value="Sign In"> 
	</form>

	<br />

	{include file='disclaimer'}

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
