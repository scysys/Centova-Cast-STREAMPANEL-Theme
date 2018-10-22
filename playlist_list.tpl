
<div class="listcaption">
    <div style="float: right">
        <img src="../system/images/icons/add.png" align="absmiddle" /> <a href="{$indexself}&action=add">{="Create playlist"}</a>
    </div>
    <img src="../system/images/icons/models/playlist.png" align="absmiddle" /> {="Playlists"}<br />
</div>


<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $playlists|count==0}
<tr>
	<td class="tdlast">
		<img src="../system/images/icons/models/playlist.png" align="absmiddle" /> {="No items have been created"}.
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th>{="Title"}</th>
	<th>{="Type"}</th>
	<th>{="Scheduled time"}</th>
	<th>{="Repeat schedule"}</th>
	<th>{="Status"}</th>
	<th width="60">&nbsp;</th>
</tr>

{/if}

{loop $playlist=$playlists onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/playlist.png" align="absmiddle" /></td>
	
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{check $playlist.type!="request"}<a href="{$indexself}&action=edit&id={$playlist.id}" style="font-weight: normal">{/check}{$playlist.title|htmlentities}{check $playlist.type!="request"}</a>{/check}</td>
	
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">
		{if $playlist.type=="general"}{="General Rotation"}
		{elseif $playlist.type=="scheduled"}{="Scheduled"}
		{elseif $playlist.type=="interval"}{="Interval"}
		{elseif $playlist.type=="now"}{="Immediate"}
		{elseif $playlist.type=="request"}{="Song Requests"}
		{else}{="Unknown"}{/if}
	</td>
	
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">
		{if $playlist.type=="interval"}{="All"} {$playlist.interval_length} {$playlist.interval_type}{elseif $playlist.type=="general"}{$playlist.general_starttime} - {$playlist.general_endtime}{else}{$playlist.scheduled_datetime|substr:11}{/if}
	</td>
	
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">
		{if $playlist.scheduled_repeat|contains:"daily"}{="Daily"}{/if}
		{if $playlist.scheduled_repeat|contains:"weekly"}<strong>{="Weekly"}</strong>{/if}
		{if $playlist.scheduled_repeat|contains:"monthly"}<strong>{="Monthly"}</strong>{/if}
		{if $playlist.scheduled_repeat|contains:"yearly"}<strong>{="Yearly"}</strong>{/if}
		{if $playlist.type=="general"}{="General rotation"} ({="Daily"}){elseif $playlist.scheduled_repeat|contains:"never"}{="Never (one time only)"}{elseif $playlist.scheduled_weekdays == ""}:{else}{/if}
				
		{if $playlist.scheduled_weekdays|contains:"mon"}({="Mon"}){/if}
		{if $playlist.scheduled_weekdays|contains:"tue"}({="Tue"}){/if}
		{if $playlist.scheduled_weekdays|contains:"wed"}({="Wed"}){/if}
		{if $playlist.scheduled_weekdays|contains:"thu"}({="Thu"}){/if}
		{if $playlist.scheduled_weekdays|contains:"fri"}({="Fri"}){/if}
		{if $playlist.scheduled_weekdays|contains:"sat"}({="Sat"}){/if}
		{if $playlist.scheduled_weekdays|contains:"sun"}({="Sun"}){/if}
	</td>
	
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">
		{if $playlist.status=="enabled"}{="Enabled"}{else}<font color="red">{="Disabled"}</font>{/if}
	</td>
	
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
		{check $playlist.type!="request"}
		<a href="{$indexself}&action=delete&id={$playlist.id}" onclick="return confirm('{="Are you sure you want to permanently delete this item?"}')"><img title="{="Delete playlist"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>
		{/check}
		<a href="{$indexself}&action=status&id={$playlist.id}&status={if $playlist.status=="enabled"}0{else}1{/if}"><img title="{if $playlist.status=="enabled"}{="Disable playlist"}{else}{="Enable playlist"}{/if}" src="../system/images/icons/{if $playlist.status=="enabled"}disable{else}enable{/if}.png" border="0" align="absmiddle" /></a>
		{check $playlist.type!="request"}
		<a href="{$indexself}&action=edit&id={$playlist.id}"><img title="{="Edit playlist"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
		{/check}
	</td>
</tr>
{/loop}
</table>
</div>

<div style="text-align: center; margin-top: 5px">{="Page"}: {$_multipage.nav}</div>

<br />

<div class="listcaption">
<img src="../system/images/library/library.png" align="absmiddle" /> {="Media Library"}<br />
</div>

{box}

	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr><td width="48%" valign="top">
	
		{="To upload media for use on your stream, launch the file manager below."}<br /><br />
		
		<a href="index.php?page=filemanager"><img border="0" alt="*" src="../system/images/filemanager/filemanager.png" align="absmiddle" /></a> <a href="index.php?page=filemanager">{="Launch file manager"}</a>
	
	<td width="2%" style="border-right: 1px solid #E0E0E0">&nbsp;
	
	</td>
	<td width="2%">&nbsp;
	
	</td>
	</td><td width="48%" valign="top">

		{="To add your media to the playlists you've created above, launch your media library below."}<br /><br />

		<a href="index.php?page=library"><img border="0" alt="*" src="../system/images/library/library.png" align="absmiddle" /></a> <a href="index.php?page=library">{="Launch media library"}</a>

	</td></tr>
	</table>
{/box}