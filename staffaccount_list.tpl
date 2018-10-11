<div class="tabletitle">
    <div style="float: right">
        <img src="../system/images/icons/add.png" align="absmiddle" /> <a href="{$indexself}&action=add">{="Create staff account"}</a>
    </div>
    <img src="../system/images/icons/models/staffaccount.png" align="absmiddle" /> {="Staff Accounts"}<br />
</div>

<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $staffaccounts|count==0}
<tr>
	<td class="tdlast">
		<img src="../system/images/icons/models/staffaccount.png" align="absmiddle" /> {="No items have been created"}.
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

{loop $staffaccount=$staffaccounts onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/staffaccount.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}"><a href="{$indexself}&action=edit&id={$staffaccount.id}" style="font-weight: normal">{$staffaccount.realname|htmlentities}</a></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$staffaccount.username|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">
		{if $staffaccount.status=="enabled"}{="Enabled"}{else}{="Disabled"}{/if}
	</td>
	
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
		<a href="{$indexself}&action=delete&id={$staffaccount.id}" onclick="return confirm('{="Are you sure you want to permanently delete this item?"}')"><img title="{="Delete Account"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=status&id={$staffaccount.id}&status={if $staffaccount.status=="enabled"}0{else}1{/if}"><img title="{if $staffaccount.status=="enabled"}{="Disable account"}{else}{="Enable account"}{/if}" src="../system/images/icons/{if $staffaccount.status=="enabled"}disable{else}enable{/if}.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=edit&id={$staffaccount.id}"><img title="{="Edit Account"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>

<div style="text-align: center; margin-top: 5px">{="Page"}: {$_multipage.nav}</div>

<br />
