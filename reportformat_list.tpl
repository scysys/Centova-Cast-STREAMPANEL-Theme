
<div class="listcaption">
    <div style="float: right">
        <img src="../system/images/icons/add.png" align="absmiddle" /> <a href="{$indexself}&action=add">{="Create custom report"}</a>
    </div>
    <img src="../system/images/icons/models/reportformat.png" align="absmiddle" /> {="Report Formats"}<br />
</div>


<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $reportformats|count==0}
<tr>
	<td class="tdlast">
		<img src="../system/images/icons/models/reportformat.png" align="absmiddle" /> {="No report types have been created"}.
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th>{="Title"}</th>
	<th>{="Type"}</th>
	<th width="60">&nbsp;</th>
</tr>
{/if}

{loop $reportformat=$reportformats onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/reportformat.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}"><a href="{$indexself}&action=edit&id={$reportformat.id}" style="font-weight: normal">{$reportformat.title|htmlentities}</a></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{if $reportformat.reporttype=="playlist"}{="Playlist report"}{elseif $reportformat.reporttype=="performance"}{="Performance report"}{else}{$reportformat.reporttype|htmlentities}{/if}</td>

	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
		<a href="{$indexself}&action=delete&id={$reportformat.id}" onclick="return confirm('{="Are you sure you want to permanently delete this item?"}')"><img title="{="Delete"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=edit&id={$reportformat.id}"><img title="{="Edit"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>

<div style="text-align: center; margin-top: 5px">{="Page"}: {$_multipage.nav}</div>

<br />
