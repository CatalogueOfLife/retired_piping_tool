{* master template *}
{* $Id: master.tpl,v 1.2 2011/06/03 10:53:52 kwok Exp $ *}
{include file='header.tpl'}

<body>
<table border = 0>
<tr>
	{* i4Life logo *}
	<td style='vertical-align:top;'>
	<a href=".">
		<img src="pics/i4life_logo_sm.jpg" width="200"
		BORDER=0 alt="i4life Logo" />
	</a>
	</td>

	{* page title *}
	<td colspan="3" align="center">
	<h1 style="text-align:center">{$page_title}</h1>
	</td>
</tr>

{* line with 4 colours *}
{include file='colour_line.tpl'}

<tr>
	{* menu *}
	<td style='vertical-align:top'>

	{* login name and menu not shown in Sign In page *}
	{if $template != 'index.tpl'}
		<h5>Login: <i>{$username}</i></h5>
		<ul type='none'>
		{section name=item loop=$menu}
			<li>
			<a href={$menu[item].link}>{$menu[item].text}</a>
			</li>
		{/section}
		</ul>
	{/if}

	</td>

	<td colspan="3" align="center">

	{* actual contents *}
	{* $template is the file of unique section of each page *}
	{include file=$template}

	</td>
</tr>
</table>

<hr />
<!--
	<a href="http://salx9.rdg.ac.uk/i4life">
-->

</body>
</html>
