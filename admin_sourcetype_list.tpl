{if $show_error}{box title="Error"}<div style="color: red">{$show_error|htmlentities}</div>{/box}<br />{/if}

<img src="../system/images/icons/sourcetype.png" align="absmiddle" /> {="Available source types"}:<br />

<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $sourcetypes|count==0}
<tr>
	<td class="tdlast">
		{="No source types exist."}
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th>{="Type"}</th>
	<th>{="Title"}</th>
	<th>{="Status"}</th>
	<th width="50">&nbsp;</th>
</tr>

{/if}
{loop $sourcetype=$sourcetypes}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/sourcetype.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" width="120">{$sourcetype.name|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$sourcetype.title|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" width="80">{if $sourcetype.enabled>0}{="Enabled"}{else}{="Disabled"}{/if}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
		<a href="{$indexself}&action=edit&id={$sourcetype.id}"><img title="{="Edit source type"}" alt="{="Edit source type"}" src="../system/images/icons/sourcetype_edit.png" border="0" align="absmiddle" /> {="Edit"}</a>
	</td>
</tr>
{/loop}
</table>
</div>
