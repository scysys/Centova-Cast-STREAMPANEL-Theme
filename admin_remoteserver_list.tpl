<div class="tabletitle">
<div style="float: right">
	<img src="../system/images/icons/add.png" align="absmiddle" /> <a href="{$indexself}&action=add">{="Add remote server"}</a>
</div>
<img src="../system/images/icons/models/rpchost.png" align="absmiddle" /> {="Remote servers"}:<br />
</div>

<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $remoteservers|count==0}
<tr>
	<td class="rowodd tdlast">
		{="No remote servers have been configured."}
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th>{="Title"}</th>
	<th>{="URL"}</th>
	<th width="50">&nbsp;</th>
</tr>

{/if}
{loop $remoteserver=$remoteservers onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/rpchost.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$remoteserver.title|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$remoteserver.url|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
		<a href="{$indexself}&action=delete&id={$remoteserver.id}"><img title="{="Delete remote server"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=edit&id={$remoteserver.id}"><img title="{="Edit remote server"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>

<br />
<div style="color: white; background-color: #880000; padding: 5px; border: 1px solid #440000">
	<div style="text-align: center; font-weight: bold">Deprecated</div>

	Note: Configuring remote servers for single sign-on is a legacy feature that is supported only for historical reasons.
	The standard way to manage multiple servers from a single interface in Centova Cast v3 is through the use of v3's
	clustering support (refer to the <a style="color: white" href="http://www.centova.com/doc/cast/installation_manual/03_custom_installation" target="_blank">Choose
	your Installation Type</a> section of the installation manual), and unless you are migrating forward from a Centova
	Cast v2 SSO configuration, you likely do not want or need to use this page.
</div>