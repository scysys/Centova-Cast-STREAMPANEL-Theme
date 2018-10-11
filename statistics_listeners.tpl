{language}
    player: '{="Player"}',
    ripper: '{="Ripper"}',
    player_ripper: '{="Player/Ripper"}',
    unknown: '{="Unknown"}',
    user_agent: '{="User agent: %s%s%s, type: %s%s%s"}',
    mb: '{="%.1f MB"}',
    pct_of_total_sessions: '{="%s%d%s sessions, comprising %s%.1f%%%s of %s%d%s total sessions"}',
    pct_of_total_minutes: '{="%s%d%s minutes, comprising %s%.1f%%%s of %s%d%s total minutes"}',
	listener_country: '{="Listener country: %s%s%s (%s%s%s)"}',
	avgsesslen_meter_caption: '{="%s%s%s of your total listener sessions during the selected period were %s%s%s in length."}'
	
{/language}

{onready}
	window.stats.associate_tab({$stats_tabid},new StatsPage_Listeners());
{/onready}

<table width="100%" cellspacing="0" cellpadding="0" border="0" id="listeners_overview">
<tr>	

	<td width="70%" valign="top">
		<div style="text-align: center; font-weight: bold">{="Period Overview"}</div>
		
		<div class="tablewrapper"">
		<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
		<tr>
			<th width="30%">{="Metric"}</th>
			<th width="20%" style="text-align: right">{="Value"}</th>
			<th width="30%">{="Metric"}</th>
			<th width="20%" style="text-align: right">{="Value"}</th>
		</tr>
		<tr>
			<td class="rowodd">{="Total listener minutes"}</td>
			<td class="rowodd" align="right" id="listeners_totalminutes">{="%s minute(s)",$zero}</td>
		
			<td class="rowodd">{="Total data transfer"}</td>
			<td class="rowodd rawstring" align="right" id="listeners_totaltransfer">{="%s",$zero}</td>
		</tr>
		<tr>
			<td class="roweven">{="Total listening hours (TLH)"}</td>
			<td class="roweven" align="right" id="listeners_tlh">{="%.2f",$zero}</td>
		
			<td class="roweven">{="Average data transfer"}</td>
			<td class="roweven rawstring" align="right" id="listeners_avgtransfer">{="%s",$zero}/{="session"}</td>
		</tr>
		<tr>
			<td class="rowodd">{="Total sessions"}</td>
			<td class="rowodd" align="right" id="listeners_totalsessions">{="%s session(s)",$zero}</td>
		
			<td class="rowodd">{="Unique listeners"}</td>
			<td class="rowodd" align="right" id="listeners_uniquelisteners">{="%s listener(s)",$zero}</td>
		</tr>
		<tr>
			<td class="roweven">{="%s music sessions","ASCAP"}</td>
			<td class="roweven" align="right" id="listeners_musicsessions">{="%s session(s)",$zero}</td>

			<td class="roweven">{="Unique countries"}</td>
			<td class="roweven" align="right" id="listeners_totalcountries">{="%s countries",$zero}</td>
		</tr>
		<tr>
			<td class="rowodd">{="Average session length"}</td>
			<td class="rowodd" align="right" id="listeners_avgminutes">{="%.1f minute(s)",$zero}</td>
		
			<td class="rowodd"></td>
			<td class="rowodd" align="right"></td></td>
		</tr>
		</table>
		</div>
	</td>
	<td width="8">&nbsp;</td>
	<td valign="top">
		
		<div style="text-align: center; font-weight: bold">{="Listener Trends"}</div>
		
		<div class="tablewrapper">
		<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
		<tr>
			<th width="25%">{="Period"}</th>
			<th width="25%" style="text-align: right">{="Value"}</th>
		</tr>
		<tr>
			<td class="rowodd">{="7-day trend"}</td>
			<td class="rowodd" align="right"><span id="listeners_trend7">{="%.2f%%",$zero}</span> <img id="listeners_trend7_img" src="../system/images/icons/trend-up.png" align="absmiddle" alt="{="Up"}/{="Down"}" /></td>
		</tr>
		<tr>
			<td class="roweven">{="14-day trend"}</td>
			<td class="roweven" align="right"><span id="listeners_trend14">{="%.2f%%",$zero}</span> <img id="listeners_trend14_img" src="../system/images/icons/trend-up.png" align="absmiddle" alt="{="Up"}/{="Down"}" /></td>
		</tr>
		<tr>
			<td class="rowodd">{="30-day trend"}</td>
			<td class="rowodd" align="right"><span id="listeners_trend30">{="%.2f%%",$zero}</span> <img id="listeners_trend30_img" src="../system/images/icons/trend-up.png" align="absmiddle" alt="{="Up"}/{="Down"}" /></td>
		</tr>
		</table>
		</div>
		
		
	</td>
</tr>
</table>

<br />

<div style="text-align: center; font-weight: bold">{="Average Listener Session Length"}</div>

<div class="tablewrapper" id="listener_session_lengths">
<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
<tr>
	<th></th>
	<th colspan="2">{="Length"}</th>
	<th style="text-align: right">{="Sessions"}</th>
</tr>
{loop $listenerperiod=$listenerperiods onlast=" tdlast"}
<tr>
	{if $_loop.first}
	<td rowspan="{$listenerperiods|count}" width="170" class="statspiecell">
        {ccpie id="listener_session_lengths"}
	</td>
	{/if}
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">
		<div class="colorbox" id="color_listener_session_lengths_{$_loop.key}">&nbsp;</div>
        <span id="stats_avgsesslen_caption_{$_loop.key}">{$listenerperiod|htmlentities}</span>
	</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" width="100" id="stats_avgsesslen_meter_{$_loop.key}">
	</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="right" width="100"><span id="stats_avgsesslen_total_{$_loop.key}">{$zero}</span> (<span id="stats_avgsesslen_pct_{$_loop.key}">{="%.1f%%",$zero}</span>)</td>
</tr>
{/loop}
</table>
</div>

<br />

<table cellspacing="0" cellpadding="0" border="0">
<tr>
	<td valign="top" width="50%">
		<div style="text-align: center; font-weight: bold">{="Top Listeners by Listener Sessions"}</div>

		<div class="tablewrapper">
		<table id="top_listeners_sessions" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
        <thead>
		    <tr>
   			    <th colspan="4">{="Listener"}</th>
			    <th colspan="2" style="text-align: right">{="Xfer"}</th>
			    <th style="text-align: right">{="Sessions"}</th>
		    </tr>
        </thead>
        <tbody>
		    <tr><td class="rowodd" colspan="7" style="text-align: center">{="None"}</td></tr>
		</tbody>
        </table>
		</div>
		
		<br />
		
	</td>
	<td width="16">&nbsp;</td>
	<td valign="top" width="50%">

		<div style="text-align: center; font-weight: bold">{="Top Listeners by Listener Minutes"}</div>

		<div class="tablewrapper">
		<table id="top_listeners_minutes" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
		<thead>
        <tr>
			<th colspan="4">{="Listener"}</th>
			<th colspan="2" style="text-align: right">{="Xfer"}</th>
			<th style="text-align: right">{="Minutes"}</th>
		</tr>
        </thead>
        <tbody>
		<tr><td class="rowodd" colspan="7" style="text-align: center">{="None"}</td></tr>
		{loop $listener=$toplistenerminutes onlast=" tdlast"}
		<tr>
			<td class="row{$_loop.oetxt}{$_loop.lasttxt}" width="16">{$_loop.iteration}.</td>
			<td class="row{$_loop.oetxt}{$_loop.lasttxt}" width="16">{if $listener.countrycode!=""}<img src="../system/images/flags/{$listener.countrycode|strtolower}.png" alt="{$listener.countrycode}" align="absmiddle" {tip}{$listener.countryname|htmlentities}{/tip} />{else}&nbsp;{/if}</td>
			<td class="row{$_loop.oetxt}{$_loop.lasttxt}" width="16">
				{if $listener.agenttype=="players"}<img src="../system/images/icons/ua-player.png" alt="{="Player"}" align="absmiddle" {tip}{="User agent: %s%s%s","<strong>",$listener.agent,"</strong>"} ({="Player"}){/tip} />
				{elseif $listener.agenttype=="rippers"}<img src="../system/images/icons/ua-ripper.png" alt="{="Ripper"}" align="absmiddle" {tip}{="User agent: %s%s%s","<strong>",$listener.agent,"</strong>"} ({="Ripper"}){/tip} />
				{elseif $listener.agenttype=="hybrid"}<img src="../system/images/icons/ua-hybrid.png" alt="{="Player/Ripper"}" align="absmiddle" {tip}{="User agent: %s%s%s","<strong>",$listener.agent,"</strong>"} ({="Player/Ripper"}){/tip} /> 
				{else}<img src="../system/images/icons/ua-hybrid.png" alt="{="Unknown"}" align="absmiddle" {tip}{="User agent: %s%s%s","<strong>",$listener.agent,"</strong>"} ({="Unknown"}){/tip} />
				{/if}
			</td>				
			<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$listener.ipaddr|htmlentities}</td>
			<td class="row{$_loop.oetxt}{$_loop.lasttxt}" width="75">
				<div style="width: 75px; height: 4px; border: 1px solid #629DCD; text-align: left" {tip}{="%s%.1f%%%s of total minutes","<strong>",$listener.total|mul:100|div:$maxminutes,"</strong>"}{/tip}>
					<div style="width: {$listener.total|mul:75|div:$maxminutes|round}px; height: 4px; background-color: #C0DDF9; border-right: 1px solid #9AB9D9; font-size: 0px;">&nbsp;</div>
				</div>
			</td>
			<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="right" width="60">{="%.1f MB",$listener.bandwidth|div:1024}</td>
			<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="right" width="50">{$listener.total}</td>
		</tr>
		{/loop}
		</tbody>
        </table>
		</div>
		
		<br />
	
	</td>
</tr>
	
</table>

<div align="center">
	<form>
		{="Show"}: <select id="stats_listeners_limit" size="1" onchange="window.stats.reload_tab_statistics({$stats_tabid})">
		<option value="10">{="Top %d","10"}</option>
		<option value="25">{="Top %d","25"}</option>
		<option value="50">{="Top %d","50"}</option>
		<option value="100">{="Top %d","100"}</option>
		<option value="250">{="Top %d","250"}</option>
		<option value="-1">{="All"}</option>
		</select>
	</form>
</div>

