
<div class="tabletitle">
	<div style="float: right">
		<img src="../system/images/icons/add.png" align="absmiddle" /> <a href="{$indexself}&action=add">{="Add region"}</a>
	</div>
	<img src="../system/images/icons/models/region.png" align="absmiddle" /> {="Host regions"}:<br />
</div>

<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $regions|count==0}
<tr>
	<td class="rowodd tdlast">
		{="No regions have been configured."}
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th>{="Title"}</th>
	<th width="100">{="Name"}</th>
	<th width="75">&nbsp;</th>
</tr>

{/if}
{loop $region=$regions onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/region.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$region.title|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$region.name|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" style="text-align: center">
		{if $region.id!=1}<a href="{$indexself}&action=delete&id={$region.id}"><img title="{="Delete region"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>{/if}
		<a href="{$indexself}&action=edit&id={$region.id}"><img title="{="Edit region"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>
