<div class="tabletitle">
	<div style="float: right">
		<img src="../system/images/icons/add.png" align="absmiddle" /> <a href="{$indexself}&action=add">{="Add news article"}</a>
	</div>
	<img src="../system/images/icons/models/news.png" align="absmiddle" /> {="News articles"}:<br />
</div>

<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $newsarticles|count==0}
<tr>
	<td class="rowodd tdlast">
		{="No news articles have been created."}
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th>{="Title"}</th>
	<th width="150" style="text-align: center">{="Created"}</th>
	<th width="150" style="text-align: center">{="Published"}</th>
	<th width="150" style="text-align: center">{="Unpublished"}</th>
	<th width="50">&nbsp;</th>
</tr>

{/if}
{loop $newsarticle=$newsarticles onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/news.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}"{if $newsarticle.visible==0} style="text-decoration: line-through; opacity: 0.8"{/if}>{$newsarticle.title}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" style="text-align: center">{$newsarticle.createdate|mysqldatetime:locale:full:$timezoneoffset}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" style="text-align: center">{$newsarticle.publishdate|mysqldatetime:locale:full:$timezoneoffset}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" style="text-align: center">{$newsarticle.unpublishdate|mysqldatetime:locale:full:$timezoneoffset}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" style="text-align: center">
		<a href="{$indexself}&action=delete&id={$newsarticle.id}"><img title="{="Delete news article"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=edit&id={$newsarticle.id}"><img title="{="Edit news article"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>
