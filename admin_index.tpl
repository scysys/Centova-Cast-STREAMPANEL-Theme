{if $news!=""}
{box title="News"}
	<div style="float: right"><a href="index.php?page=accounts&hidenews=1"><img src="../system/images/icons/close.png" border="0" alt="{="Hide this news box."}" {tip}{="Hide this news box."}{/tip}/></a></div>
	<strong>{$newsdate}</strong><br />
	<div style="margin: 1px 0 0 19px">{$news}</div>
{/box}
{/if}

{header}
		<div class="headermetergroup">
			<div {tip addclass="headermeter" title="Data transfer" style="wide"}{if $usage.xferlimit<0}{="Tip: You can set your server's total data transfer limit under 'Settings' if you want your data transfer usage to be graphed."}{else}{="Total: %s%.1f%%%s.%sThis is the combined total of the data transfer used by all of your streams this month. %sNote that this only includes data transfer from Centova Cast streams; data transfer used by other services on the server (if any) is not included.","<strong>",$usage.usedxfer|mul:100|div:$usage.xferlimit,"</strong>","<br />","<br /><br />"}{/if}{/tip}>
				<img src="../system/images/icons/transfer.png" align="absmiddle" /> {="Data transfer"}: <span style="font-weight: bold; white-space: nowrap">{if $usage.xferlimit<0}{$usage.usedxfer|bytes::1048576:micro:1}{else}{$usage.usedxfer|bytes:$usage.xferlimit:1048576:micro:1}{/if}</span>
{$usage.usedxfer|ccmeter:$usage.xferlimit}
			</div>
			<div {tip addclass="headermeter" title="Disk usage" style="wide"}{="Total: %s%.1f%%%s.%sThis is the combined total of the disk space used by all of your streams. %sNote that the total available space does not represent your total disk size; it represents the sum of the disk quotas allocated for all of your streams.","<strong>",$usage.useddisk|mul:100|div:$usage.disklimit,"</strong>","<br />","<br /><br />"}{/tip}>
				<img src="../system/images/icons/diskspace.png" align="absmiddle" /> {="Disk usage"}: <span style="font-weight: bold; white-space: nowrap">{$usage.useddisk|bytes:$usage.disklimit:1048576:micro:1}</span>
{$usage.useddisk|ccmeter:$usage.disklimit}
			</div>
			<div {tip addclass="headermeter last" title="Total streams" style="wide"}{if $usage.userlimit>0}{="Total: %s%.1f%%%s.%sThis is the total number of streams currently managed by%sCentova Cast versus your licensed stream limit.","<strong>",$usage.usedusers|mul:100|div:$usage.userlimit,"</strong>","<br />","<br />"}{else}{="You have no stream limit."}{/if}{/tip}>
				<img src="../system/images/icons/listeners.png" align="absmiddle" /> {="Total streams"}: <span style="font-weight: bold; white-space: nowrap">{if $usage.userlimit<0}{$usage.usedusers} ({="UNL"}){elseif $usage.userlimit==0}{$usage.usedusers}{else}{="%s/%s",$usage.usedusers,$usage.userlimit}{/if}</span>
{$usage.usedusers|ccmeter:$usage.userlimit}
			</div>
		</div>
{/header}

{heading}
	<div style="float: right; text-align: right; padding-top: 10px">
		{="Projected data transfer"}:&nbsp; <strong>{="%s MB",$usage.estimatedtransfer}</strong> {="total this month"}<br />
		{="Total listener slots"}: <strong>{$usage.listenerslots}</strong>
	</div>
{/heading}

