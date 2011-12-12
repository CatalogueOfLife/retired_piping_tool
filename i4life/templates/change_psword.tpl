{* change_psword template *}
{* $Id: change_psword.tpl,v 1.1 2011/06/03 09:39:16 kwok Exp $ *}

<h3><font color="red"><em>{$message}</em></font><h3>

{if $status_message == ""}
	{* the input form only shown when there is no $status_message,
	   i.e. before the password been changed. *}
	<form action="change_psword.php" method="POST">
	<table>
		<tr>
		<td>Old Password:</td>
		<td><input type="password" name="o_psword" /></td>
		</tr>

		<tr>
		<td>New Password:</td>
		<td><input type="password" name="n_psword" /></td>
		</tr>

		<tr>
		<td>Confirm Password:</td>
		<td><input type="password" name="c_psword" /></td>
		</tr>

		<tr>
		<td><input type="submit" value="Submit"></td>
	</table>
	</form>
{else}
	{* after password been changed, only show the $status_message *}
	<h3><font color="red"><em>{$status_message}</em></font><h3>
{/if}
