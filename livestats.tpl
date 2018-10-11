{resource type="js" src="/system/flot/excanvas.min.js" iecondition="lte IE 8"}
{resource type="js" class="flot"}
{resource type="js" class="justgage"}
{resource type="js" class="statistics"}

{include file="units_lang.tpl"}

{language}
none:			'{="None"}',
other: 			'{="Other"}',
pct_of_total_listeners: '{="%s%s%s listeners, %s%s%%%s of %s%s%s total listeners"}',
agent_types:	{
	players: '{="Player"}',
	rippers: '{="Ripper"}',
	hybrid: '{="Player/Ripper"}'
},
listeners:		'{="Listeners"}'
{/language}

{onready method="prepend"}
window.livestats_refresh_freq = {$_CONSTANTS.LIVESTATS_REFRESH_FREQ};
window.livestats = new LiveStatistics({$account.maxclients});
window.livestats.initialize(null,'window.livestats',0);
window.livestats.activate();
{/onready}

<div>
<div style="float: right">
	{if $mountpoints|count>1}
	<form>
	{="Mount point"}: <select id="mountpoint" size="1">
	<option value="">{="All"}</option>
	{loop $mp=$mountpoints}
	<option value="{$mp.mount|htmlentities}">{$mp.mount|htmlentities}</option>
	{/loop}
	</select>
	</form>
	{/if}
</div>

<div style="padding-top: 5px">
{="The following listeners are tuned-in now"}:
</div>

<!--
<div style="float: right; width: 125px; height: 180px">
	<div id="listenergauge" style="width: 125px; height: 100px">
	</div>
</div>
-->
<div class="tablewrapper" id="current_listeners"> <!-- style="margin-right: 135px"> -->
<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
<thead>
	<tr>
		<th></th>
		<th colspan="2">{="Location"}</th>
		<th>{="IP Address"}</th>
{check $showuseragent>0}
		<th id="uacol">{="User Agent"}</th>
		<th>{="Agent Type"}</th>
{/check}
{check $showduration>0}
		<th id="ltcol" style="text-align: right">{="Listen Time"}</th>
{/check}
	</tr>
</thead>
<tbody>
	<tr><td class="rowodd" colspan="{check $showuseragent>0}{if $showduration>0}7{else}6{/if}{otherwise}{if $showduration>0}5{else}4{/if}{/check}" style="text-align: center">{="None"}</td></tr>
</tbody>
</table>
</div>

<div style="clear: right"></div>

<br />
{="Current top countries"}:<br />

<div class="tablewrapper" id="top_countries">
<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
	<thead>
	<tr>
		<th>{="Country"}</th>
		<th colspan="5" style="text-align: center">{="Listeners"}</th>
	</tr>
</thead>
<tbody>
	<tr><td class="rowodd" colspan="5" style="text-align: center">{="None"}</td></tr>
</tbody>
</table>
</div>

{check $showuseragent>0}
<br />
{="Current top user agents"}:<br />

<div class="tablewrapper" id="top_agents">
<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
<thead>
	<tr>
		<th>{="User Agent"}</th>
		<th colspan="5" style="text-align: center">{="Listeners"}</th>
	</tr>
</thead>
<tbody>
	<tr><td class="rowodd" colspan="5" style="text-align: center">{="None"}</td></tr>
</tbody>
</table>
</div>

{/check}

{check $showgmaps>0}
<br />
{="Listener locations map"}:<br />

		<div class="box">
			<div id="cc_gmaps_{$username|htmlentities}{$charset|htmlentities}" class="cc_gmaps_map" style="height: 400px"></div>
		</div>
		<script language="javascript" type="text/javascript" src="http{if $_SERVER.HTTPS=="on"}s{/if}://maps.google.com/maps/api/js{if $gmapsident}?{$gmapsident}{/if}"></script>
		<script language="javascript" type="text/javascript" src="/system/googlemaps.js" defer="true"></script>
{/check}

