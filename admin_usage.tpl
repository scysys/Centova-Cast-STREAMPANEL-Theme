<table width="100%" cellspacing="0" celpadding="0" border="0">
<tr>
	<td width="33%" {tip}{if $usage.xferlimit<0}{="Tip: You can set your server's total data transfer limit under 'Settings' if you want your data transfer usage to be graphed."}{else}{="Total: %s%.1f%%%s.%sThis is the combined total of the data transfer used by all of your streams this month. %sNote that this only includes data transfer from Centova Cast streams; data transfer %sused by other services on the server (if any) is not included.","<strong>",$usage.usedxfer|mul:100|div:$usage.xferlimit,"</strong>","<br />","<br /><br />","<br />"}{/if}{/tip}>
			<img src="../system/images/icons/transfer.png" align="absmiddle" /> {="Data transfer"}: <span style="font-weight: bold; white-space: nowrap">{if $usage.xferlimit<0}{="%s MB",$usage.usedxfer} ({="No limit specified"}){else}{="%s/%s MB",$usage.usedxfer,$usage.xferlimit}{/if}</span>
			{$usage.usedxfer|ccmeter:$usage.xferlimit}
	</td>
	<td style="font-size: 0px; width: 5px">&nbsp;</td>
	<td width="33%" {tip}{if $usage.useddisk>$usage.disklimit}{="Tip: This is the free space available on the partition holding Centova Cast's 'vhosts' %sdirectory.  If you have created symbolic links pointing to media on a different partition, %s the reported disk usage may appear to exceed the available disk space.","<br />","<br />","<br />"}{else}{="Total: %s%.1f%%%s.%sThis is the combined total of the disk space used by all of your streams. %sNote that the total available space does not represent your total disk%s size; it represents the total remaining space available to Centova Cast %s(excluding OS files, etc.)","<strong>",$usage.useddisk|mul:100|div:$usage.disklimit,"</strong>","<br />","<br /><br />","<br />","<br />"}{/if}{/tip}>
			<img src="../system/images/icons/diskspace.png" align="absmiddle" /> {="Disk usage"}: <span style="font-weight: bold; white-space: nowrap">{="%s/%s MB",$usage.useddisk,$usage.disklimit}</span>
			{$usage.useddisk|ccmeter:$usage.disklimit}
	</td>
	<td style="font-size: 0px; width: 5px">&nbsp;</td>

	<td width="33%" {check $usage.userlimit>0}{tip}{="Total: %s%.1f%%%s.%sThis is the total number of streams currently managed by%sCentova Cast versus your licensed stream limit.","<strong>",$usage.usedusers|mul:100|div:$usage.userlimit,"</strong>","<br />","<br />"}{/tip}{/check}>
			<img src="../system/images/icons/listeners.png" align="absmiddle" /> {="Total streams"}: <span style="font-weight: bold; white-space: nowrap">{if $usage.userlimit<0}{$usage.usedusers} ({="Unlimited"}){else}{="%s/%s",$usage.usedusers,$usage.userlimit}{/if}</span>
			{$usage.usedusers|ccmeter:$usage.userlimit}
	</td>
</tr>
<tr><td colspan="3" style="font-size: 0px; height: 5px">&nbsp;<br /></td></tr>
</table>

<div class="box">
	<div style="float: right">
		{="Projected data transfer"}:&nbsp; <strong>{="%s MB",$usage.estimatedtransfer}</strong> {="total this month"}
	</div>
	{="Total listener slots"}: <strong>{="%s",$usage.listenerslots}</strong>
</div>
<br />

