{* user_list template *}
{* $Id: user_list.tpl,v 1.1 2011/06/03 14:34:27 kwok Exp kwok $ *}

<h3><font color="red"><em>{$message}</em></font></h3>

<form action='user_list.php' method='post'>

{***************************}
{* display user name table *}
{***************************}
{if $status == 'display'}
<table>
<tr>
	<th></th>
	<th>User ID</th>
	<th>User Name</th>

{* this feature been disabled
	<th>Role</th>
*}

</tr>

{section name=row loop=$user}
<tr class={cycle values="even-row,odd-row"}>
	<td>
	  <input type="checkbox" name="users[]" value={$user[row]['userid']} />
	</td>
	<td>{$user[row]['userid']}</td>
	<td>{$user[row]['username']}</td>

{* this feature been disabled
	<td>
		<font color=
			{if $user[row]['role']=='GSD'}'goldenrod'{else}'blueviolet'{/if}>
			{$user[row]['role']}
		</font>
	</td>
*}

</tr>
{/section}

</table>
<br />
<input name='addUser' type='submit' value='Add User' />
<input name='editUser' type='submit' value='Edit Selected Users' />
<input name='deleteUser' type='submit' value='Delete Selected Users'
	style="color:red" />

{************************}
{* no user in the table *}
{************************}
{elseif $status == 'emptytable'}
<input name='addUser' type='submit' value='Add User' />

{****************************}
{* show add user input form *}
{****************************}
{elseif $status == 'adduser'}
<table>
<tr>
	<td>User Name:</td>
	<td><input name='name'</td>
</tr>
<tr>
	<td>Password:</td>
	<td><input name='password'</td>
</tr>

{* this feature been disabled
<tr>
	<td>Role:</td>
	<td>
		<select name='role'>
		<option value='GSD'>GSD</option>
		<option value='GBP'>GBP</option>
		</select>
	</td>
</tr>
*}

<tr>
	<td></td>
	<td><input name='addNew' type='submit' value='Save' />
		<input name='addCancel' type='submit' value='Cancel' /></td>
</tr>
</table>

{************************}
{* edit user input form *}
{************************}
{elseif $status == 'edit'}
<table>

{section name=row loop=$user}
{* this hidden input value gives userid during save process *}
<input
	type=hidden
	name='userid[{$user[row]['userid']}]'
	value='{$user[row]['userid']}'
/>
<tr>
	<td>User ID:</td>
	<td>{$user[row]['userid']}</td>
</tr>
<tr>
	<td>User Name:</td>
	<td><input
			name='username[{$user[row]['userid']}]'
			value='{$user[row]['username']}'
		/>
	</td>
</tr>

{*		this feature has disabled
<tr>
	<td>Role:</td>
	<td><select
			name='role[{$user[row]['userid']}]'
		>
			<option
				{if $user[row]['role'] == 'GSD'}
					selected
				{/if}
				value='GSD'>GSD
			</option>
			<option
				{if $user[row]['role'] == 'GBP'}
					selected
				{/if}
				value='GBP'>GBP
			</option>
		</select>
	</td>
</tr>
*}

<tr>
	<td>Password<font color='red'>*</font>:</td>
	<td><input
			name='password[{$user[row]['userid']}]'
		/>
	</td>
</tr>
<tr><td>&nbsp;</td></tr>
{/section}

</table>
<input name='editSave' type='submit' value='Save' />
<input name='editCancel' type='submit' value='Cancel' />
<p>
	<font color='red'>*</font>If password input is left blank,
password will be unaffected.
</p>

{/if}
</form>
