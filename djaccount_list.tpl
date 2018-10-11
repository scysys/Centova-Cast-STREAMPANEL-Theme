
<div class="listcaption">
    <div style="float: right">
        <img src="../system/images/icons/add.png" align="absmiddle" /> <a href="{$indexself}&action=add">{="Create DJ account"}</a>
    </div>
    <img src="../system/images/icons/models/djaccount.png" align="absmiddle" /> {="DJ Accounts"}<br />
</div>


<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $djaccounts|count==0}
<tr>
	<td class="tdlast">
		<img src="../system/images/icons/models/djaccount.png" align="absmiddle" /> {="No items have been created"}.
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th>{="Real name"}</th>
	<th>{="Username"}</th>
	<th>{="Status"}</th>
	<th width="60">&nbsp;</th>
</tr>
{/if}

{loop $djaccount=$djaccounts onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/djaccount.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}"><a href="{$indexself}&action=edit&id={$djaccount.id}" style="font-weight: normal">{$djaccount.realname|htmlentities}</a></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$djaccount.username|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">
		{if $djaccount.status=="enabled"}{="Enabled"}{else}{="Disabled"}{/if}
	</td>
	
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
		<a href="{$indexself}&action=delete&id={$djaccount.id}" onclick="return confirm('{="Are you sure you want to permanently delete this item?"}')"><img title="{="Delete Account"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=status&id={$djaccount.id}&status={if $djaccount.status=="enabled"}0{else}1{/if}"><img title="{if $djaccount.status=="enabled"}{="Disable DJ account"}{else}{="Enable DJ account"}{/if}" src="../system/images/icons/{if $djaccount.status=="enabled"}disable{else}enable{/if}.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=edit&id={$djaccount.id}"><img title="{="Edit Account"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>

<div style="text-align: center; margin-top: 5px">{="Page"}: {$_multipage.nav}</div>

<br />
