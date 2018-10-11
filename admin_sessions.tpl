{resource type="js" class="rpc"}
{resource type="js" class="accounts"}

<form action="index.php?page=sessions" method="post">

<div class="tablewrapper">
<table class="accountslist listtable resellertable sortable" width="100%" cellspacing="1" cellpadding="2">
<thead>
{check $sessions|count==0}
<tr>
	<th width="24" align="center"></th>
	<th>{="Accounts"}</th>
</tr>
<tr>
	<td class="rowodd tdlast" align="center"><img src="../system/images/icons/user.png" align="absmiddle" /></td>
	<td class="rowodd tdlast">
		{="No active sessions"}.
	</td>
</tr>
{otherwise}
<tr>
	<th width="18" align="center" class="sorttable_nosort"><input type="checkbox" onclick="header_checkbox_click(this)" /></th>
	<th width="100" class="sorttable_alpha">{="Username"}</th>
	<th class="sorttable_alpha">{="Title"}</th>
	<th class="sorttable_alpha">{="E-mail"}</th>
	<th class="sorttable_alpha">{="Login Time"}</th>
	<th class="sorttable_numeric">{="Duration"}</th>
	<th class="sorttable_alpha">{="IP Address"}</th>
	<th width="50" class="sorttable_nosort">&nbsp;</th>
</tr>
{/check}
</thead>

<tbody>

{loop $session=$sessions}
<tr username="{$session.username|htmlentities}" class="np row{if $_loop.odd!=0}even{else}odd{/if}">
	<td align="center">{if $session.sessionid!=$current_sessionid}<input type="checkbox" name="sessionids[]" value="{$session.sessionid|htmlentities}" />{/if}</td>
	<td sortby="x{$session.username|strtolower|htmlentities}">
		{check $session.staffaccount.id}
		{if $session.editable}<a href="index.php?page=staffaccounts&action=edit&username=${session.staffaccount.username}">{/if}{$session.staffaccount.username|htmlentities}{if $session.editable}</a>{/if}
		{otherwise}
		{if $session.djaccount.id}{$session.djaccount.username|htmlentities}<br />({="DJ for "}{/if}
		{if $session.editable}<a href="index.php?page=accounts&action=edit&username={$session.username|htmlentities}">{/if}{$session.username|htmlentities}{if $session.editable}</a>{/if}{if $session.djaccount.id}){/if}
		{/check}
	</td>
	<td>{if $session.staffaccount.id}{="Staff"}{elseif $session.username=="admin"}{="Administrator"}{else}{$session.organization|htmlentities}{/if}{if $session.sessionid==$current_sessionid} ({="current session"}){/if}</td>
	<td sortby="x{$session.email|strtolower|htmlentities}"><a href="mailto:{$session.email|htmlentities}">{$session.email|htmlentities}</a></td>

	<td sortby="{$session.sessiontime|htmlentities}">{$session.sessiontime|unixtimestamp:locale}</td>
	<td sortby="{$session.sessionelapsed|htmlentities}">{$session.sessionelapsed|timetext}</td>
	<td>{$session.sessionip|htmlentities}</td>

	<td align="center" nowrap="nowrap">
		{check $session.editable}
			{if $session.staffaccount.id}
				<a href="index.php?page=staffaccounts&action=edit&username=${session.staffaccount.username|htmlentities}"><img src="../system/images/icons/edit.png" border="0" align="absmiddle" alt="{="Edit"}" /></a>
			{else}
				<a href="index.php?page=accounts&action=setuid&username={$session.username|htmlentities}"><img src="../system/images/icons/setuid.png" border="0" align="absmiddle" alt="{="Login"}" /></a>
				<a href="index.php?page=accounts&action=edit&username={$session.username|htmlentities}"><img src="../system/images/icons/edit.png" border="0" align="absmiddle" alt="{="Edit"}" /></a>
			{/if}
		{/check}
	</td>
</tr>
{/loop}

</tbody>

</table>
</div>

<br />
<input type="hidden" name="page" value="sessions" />
<input type="hidden" name="action" value="logout" />
<input type="submit" value="{="Log out selected"}" />

</form>