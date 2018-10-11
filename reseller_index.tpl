{header}
<div style="margin-top: 10px; float: right">
{check $bandwidthlimit!=0}
	<div style="height: 50px; margin-bottom: 10px; float: left; border-right: 1px solid #E0E0E0; padding-right: 15px; margin-right: 15px" {tip title="Data transfer"}
{="Bandwidth allocated: %s%s (%.1f%%)%s.%sThis is the combined total of the bandwidth (in Kbps) you have allocated to your clients.%s","<strong>",$allocated.usedbandwidth|bytes::1048576,$allocated.usedbandwidth|mul:100|div:$bandwidthlimit,"</strong>","<br />","<br /><br />"}
{="Bandwidth limit: %s%s%s.%sThis is the maximum bandwidth allocation permitted for your account.","<strong>",$bandwidthlimit|bytes::1048576,"</strong>","<br />"}
{/tip}>
		<img src="../system/images/icons/transfer.png" align="absmiddle" />
		 {="Data transfer"}: <span style="font-weight: bold; white-space: nowrap">{$allocated.usedbandwidth|bytes:$bandwidthlimit:1048576}</span>
		{$allocated.usedbandwidth|ccmeter:$bandwidthlimit}
	</div>
{otherwise}
	<div style="height: 50px; margin-bottom: 10px; float: left; border-right: 1px solid #E0E0E0; padding-right: 15px; margin-right: 15px" {tip title="Data transfer"}
{="Data transfer used: %s%s (%.1f%%)%s.%sThis is the total data transfer actually used by your clients.%s","<strong style='color: #ff7b00'>",$currenttransfer|bytes::1048576,$currenttransfer|mul:100|div:$transferlimit,"</strong>","<br />","<br /><br />"}
{="Data transfer allocated: %s%s (%.1f%%)%s.%sThis is the total data transfer you have allocated to your clients.%s","<strong style='color: #00548a'>",$allocated.usedxfer|bytes::1048576,$allocated.usedxfer|mul:100|div:$transferlimit,"</strong>","<br />","<br /><br />"}
{="Data transfer limit"}: <strong>{$transferlimit|bytes::1048576}</strong>. {="This is the maximum data transfer permitted for your account."}<br />
{/tip}>
		<img src="../system/images/icons/transfer.png" align="absmiddle" />
		 {="Data transfer"}: <span style="font-weight: bold; white-space: nowrap">{if $account.noxferlimit}{$currenttransfer|bytes::1048576} ({="UNL"}){else}{$currenttransfer|bytes:$transferlimit:1048576}{/if}</span>
		{$currenttransfer|ccmeter:$transferlimit:$allocated.usedxfer}
	</div>
{/check}	
	<div style="height: 50px; margin-bottom: 10px; float: left; border-right: 1px solid #E0E0E0; padding-right: 15px; margin-right: 15px" {tip title="Disk usage"}
{="Disk space used: %s%s (%.1f%%)%s.%sThis is the total disk space actually used by your clients.%s","<strong style='color: #ff7b00'>",$currentdisk|bytes::1048576,$currentdisk|mul:100|div:$diskquota,"</strong>","<br />","<br /><br />"}
{="Disk space allocated: %s%s (%.1f%%)%s.%sThis is the total disk space you have allocated to your clients.%s","<strong style='color: #00548a'>",$allocated.useddisk|bytes::1048576,$allocated.useddisk|mul:100|div:$diskquota,"</strong>","<br />","<br /><br />"}
{="Disk space limit: %s%s%s.%sThis is the maximum disk space permitted for your account.","<strong>",$diskquota|bytes::1048576,"</strong>","<br />"}
{/tip}>
		<img src="../system/images/icons/diskspace.png" align="absmiddle" /> {="Disk usage"}: <span style="font-weight: bold; white-space: nowrap">{if $account.nodiskquota}{$allocated.useddisk|bytes::1048576} ({="UNL"}){else}{$currentdisk|bytes:$diskquota:1048576}{/if}</span>
		
		{$currentdisk|ccmeter:$diskquota:$allocated.useddisk} 
	</div>

	<div style="height: 50px; margin-bottom: 10px; float: left;" {tip title="Listener slots"}
{="Total: %s%.1f%%%s.%sThis is the combined total of the listener limits you have assigned to all of your client accounts.","<strong>",$allocated.usedclients|mul:100|div:$account.maxclients,"</strong>","<br />"}
{/tip}>
		<img src="../system/images/icons/listeners.png" align="absmiddle" /> {="Listener slots"}: <span style="font-weight: bold; white-space: nowrap">{if $account.maxclients==0}{$allocated.usedclients} ({="UNL"}){else}{="%s/%s",$allocated.usedclients,$account.maxclients}{/if}</span>
		{$allocated.usedclients|ccmeter:$account.maxclients}
	</div>

		<div style="height: 50px; margin-bottom: 10px; float: left; margin-left: 15px; border-left: 1px solid #E0E0E0; padding-left: 15px;  padding-right: 15px" {tip title="Client accounts"}
{="Total: %s%.1f%%%s.%sThis is the total number of client accounts you have created.","<strong>",$allocated.usedusers|mul:100|div:$account.resellerusers,"</strong>","<br />"}
{/tip}>
		<img src="../system/images/icons/listeners.png" align="absmiddle" /> {="Client accounts"}: <span style="font-weight: bold; white-space: nowrap">{if $account.resellerusers==0}{$allocated.usedusers} ({="UNL"}){else}{="%s/%s",$allocated.usedusers,$account.resellerusers}{/if}</span>
		{$allocated.usedusers|ccmeter:$account.resellerusers}
	</div>
</div>

{/header}



{heading}
	<div style="float: right; text-align: right; padding-top: 10px">
	{="Projected data transfer"}:&nbsp; <strong>{="%s MB",$account.estimatedtransfer}</strong> {="total this month"}<br />
	{="Maximum bit rate"}: <strong>{="%s Kbps",$account.maxbitrate}</strong>
	</div>
{/heading}

{$news}