{* index / login template *}
{* $Id: index.tpl,v 1.1 2011/06/03 10:39:02 kwok Exp $ *}

<h3><font color="red"><em>{$message}</em></font><h3>

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

