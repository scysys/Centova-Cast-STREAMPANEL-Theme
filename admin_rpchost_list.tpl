<div class="tabletitle">
	<div style="float: right">
		<img src="../system/images/icons/add.png" align="absmiddle" /> <a href="{$indexself}&action=add">{="Add hosting server"}</a>
	</div>
	<img src="../system/images/icons/models/rpchost.png" align="absmiddle" /> {="Hosting servers"}:<br />
</div>

<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $rpchosts|count==0}
<tr>
	<td class="rowodd tdlast">
		{="No cluster servers have been configured."}
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th>{="Title"}</th>
	<th>{="Address"}</th>
	<th width="40" style="text-align: center">{="Master"}</th>
	<th width="40" style="text-align: center">{="Relay"}</th>
	<th width="50">&nbsp;</th>
</tr>

{/if}
{loop $rpchost=$rpchosts onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/rpchost.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$rpchost.title|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{if $rpchost.hostname}{$rpchost.hostname|htmlentities}{else}{$rpchost.ipaddress|htmlentities}{/if}:{$rpchost.port|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" style="text-align: center"><img src="../system/images/icons/
	{if $rpchost.ismaster==0}not{/if}ok.png" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" style="text-align: center"><img src="../system/images/icons/{if $rpchost.isrelay==0}not{/if}ok.png" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" style="text-align: center">
		<a href="{$indexself}&action=delete&id={$rpchost.id}"><img title="{="Delete cluster server"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=edit&id={$rpchost.id}"><img title="{="Edit cluster server"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>
