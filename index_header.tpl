<div class="headermetergroup">
    <div id="listenermeter" {tip addclass="headermeter" title="Current listeners"}{="This is the total number of listeners which are currently tuned in to your stream."}{/tip}>
        <img src="../system/images/icons/listeners.png" align="absmiddle" />   {="Current listeners"}: <span style="font-weight: bold; white-space: nowrap">{$currentlisteners}/{$maxlisteners}</span>
        {$currentlisteners|ccmeter:$maxlisteners}
    </div>
    <div {tip addclass="headermeter" title="Data transfer"}{="This is your total data transfer for this month."}{/tip}>
        <img src="../system/images/icons/transfer.png" align="absmiddle" /> {="Data transfer"}: <span style="font-weight: bold; white-space: nowrap">{if $account.noxferlimit}{$currenttransfer|bytes::1048576} ({="UNL"}){else}{$currenttransfer|bytes:$transferlimit:1048576}{/if}</span>
        {$currenttransfer|ccmeter:$transferlimit}
    </div>
    <div {tip addclass="headermeter last" title="Disk usage"}{="This is your total disk space usage, including any media, logs, and configuration files used by your stream."}{/tip}>
        <img src="../system/images/icons/diskspace.png" align="absmiddle" /> {="Disk usage"}: <span style="font-weight: bold; white-space: nowrap">{if $account.nodiskquota}{$currentdisk|bytes::1048576} ({="UNL"}){else}{$currentdisk|bytes:$diskquota:1048576}{/if}</span>
        {$currentdisk|ccmeter:$diskquota}
    </div>
	{include "streamstatus.tpl"}
</div>