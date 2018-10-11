{onready}
	window.stats.associate_tab({$stats_tabid},new StatsPage_Historical());
{/onready}

	<table cellspacing="0" cellpadding="0" border="0" width="100%">
	<tr>
		<td align="center" width="55%">
			{ccgraph title="Peak Listeners" id="historical_listeners"}
			<br />
		</td>
		<td width="16">&nbsp;</td>
		<td align="left" valign="top" width="45%">
			<br /><br />
			<div class="tablewrapper">
			<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
			<tr>
				<td class="rowodd" width="50%">{="Period from"}:</td>
				<td class="rowodd historical_value" id="historical_listeners_from">-</td>
			</tr>	
			<tr>
				<td class="roweven" width="50%" class="rowodd">{="Period to"}:</td>
				<td class="roweven historical_value" id="historical_listeners_to">-</td>
			</tr>	
			<tr>
				<td class="rowodd" width="50%">{="Peak listeners"}:</td>
				<td class="rowodd historical_value" id="historical_listeners_peak">0</td>
			</tr>	
			<tr>
				<td class="roweven" width="50%" class="rowodd">&nbsp;</td>
				<td class="roweven historical_value" id="historical_listeners_peak_time"></td>
			</tr>	
			</table>
			</div>
			
			<div style="float: right; margin-top: 4px"><a style="font-weight: normal; color: #666666" href='#' onclick="window.stats.get_page({$stats_tabid}).launch_period_csv('get_historical_listeners'); return false">{="Download"}</a> <img align="absmiddle" src="/system/images/csv.png" /></div>
		</td>
	</tr>
	<tr>
		<td align="center">
			{ccgraph title="Listener Minutes" id="historical_minutes"}
			<br />
		</td>
		<td width="16">&nbsp;</td>
		<td align="left" valign="top">
			<br /><br /><br />
			<div class="tablewrapper">
			<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
			<!-- <tr><th>Foo</th><th>Bar</th></tr> -->
			<tr>
				<td class="rowodd" width="50%">{="Period from"}:</td>
				<td class="rowodd historical_value" id="historical_minutes_from">-</td>
			</tr>	
			<tr>
				<td class="roweven" width="50%" class="rowodd">{="Period to"}:</td>
				<td class="roweven historical_value" id="historical_minutes_to">-</td>
			</tr>	
			<tr>
				<td class="rowodd" width="50%">{="Total minutes"}:</td>
				<td class="rowodd historical_value" id="historical_minutes_total">0</td>
			</tr>	
			<tr>
				<td class="rowodd" width="50%">{="Hourly average"}:</td>
				<td class="rowodd historical_value" id="historical_minutes_hourly">0</td>
			</tr>	
			<tr>
				<td class="roweven" width="50%">{="24-hour average"}:</td>
				<td class="roweven historical_value" id="historical_minutes_daily">0</td>
			</tr>	
			</table>
			</div>
			<div style="float: right; margin-top: 4px"><a style="font-weight: normal; color: #666666" href='#' onclick="window.stats.get_page({$stats_tabid}).launch_period_csv('get_historical_minutes'); return false">Download</a> <img align="absmiddle" src="/system/images/csv.png" /></div>

		</td>
	</tr>
	<tr>
		<td align="center">
			{ccgraph title="Data Transfer" id="historical_transfer"}
			<br />
		</td>
		<td width="16">&nbsp;</td>
		<td align="left" valign="top">
			<br /><br /><br />
			<div class="tablewrapper">
			<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
			<!-- <tr><th>Foo</th><th>Bar</th></tr> -->
			<tr>
				<td class="rowodd" width="50%">{="Period from"}:</td>
				<td class="rowodd historical_value" id="historical_transfer_from">-</td>
			</tr>	
			<tr>
				<td class="roweven" width="50%" class="rowodd">{="Period to"}:</td>
				<td class="roweven historical_value" id="historical_transfer_to">-</td>
			</tr>	
			<tr>
				<td class="rowodd" width="50%">{="Total transfer"}:</td>
				<td class="rowodd historical_value" id="historical_transfer_total">0</td>
			</tr>	
			<tr>
				<td class="rowodd" width="50%">{="Hourly average"}:</td>
				<td class="rowodd historical_value" id="historical_transfer_hourly">0</td>
			</tr>	
			<tr>
				<td class="roweven" width="50%">{="24-hour average"}:</td>
				<td class="roweven historical_value" id="historical_transfer_daily">0</td>
			</tr>	
			</table>
			</div>
			<div style="float: right; margin-top: 4px"><a style="font-weight: normal; color: #666666" href='#' onclick="window.stats.get_page({$stats_tabid}).launch_period_csv('get_historical_transfer'); return false">Download</a> <img align="absmiddle" src="/system/images/csv.png" /></div>

		</td>
		
		
	</tr>
	</table>
	
	<br />
	
	{box title="Average Listeners Per Hour"}
	<table cellspacing="1" cellpadding="0" border="0">
	<tr>
		<td width="152"><div style="height: 100px; font-size: 0px">&nbsp;</div></td>
	{loop $weekday=$weekdays}
		<td>&nbsp;</td>
		<td valign="bottom" width="4"><div id="aph_bar_gr{$_loop.key}" style="background-color: #dd8f8f; border: 1px solid #b13535; height: 0px; width: 4px; font-size: 0px;" {tip}{$weekday} {="Graveyard"}: {="%s listener(s)",0}{/tip}>&nbsp;</div></td>
		<td valign="bottom" width="4"><div id="aph_bar_mo{$_loop.key}" style="background-color: #ffca86; border: 1px solid #ff6d00; height: 0px; width: 4px; font-size: 0px;" {tip}{$weekday} {="Morning"}: {="%s listener(s)",0}{/tip}>&nbsp;</div></td>
		<td valign="bottom" width="4"><div id="aph_bar_lu{$_loop.key}" style="background-color: #fce899; border: 1px solid #ebb717; height: 0px; width: 4px; font-size: 0px;" {tip}{$weekday} {="Lunch"}: {="%s listener(s)",0}{/tip}>&nbsp;</div></td>
		<td valign="bottom" width="4"><div id="aph_bar_af{$_loop.key}" style="background-color: #C0DDF9; border: 1px solid #629DCD; height: 0px; width: 4px; font-size: 0px;" {tip}{$weekday} {="Afternoon"}: {="%s listener(s)",0}{/tip}>&nbsp;</div></td>
		<td valign="bottom" width="4"><div id="aph_bar_ev{$_loop.key}" style="background-color: #a7d69e; border: 1px solid #4d8e48; height: 0px; width: 4px; font-size: 0px;" {tip}{$weekday} {="Evening"}: {="%s listener(s)",0}{/tip}>&nbsp;</div></td>
		<td>&nbsp;</td>
	{/loop}
	</tr>
	<tr>
		<td></td>
	{loop $weekday=$weekdays}
		<td colspan="7" style="text-align: center; font-weight: bold" width="72">
			{$weekday}<br /><br />
		</td>
	{/loop}
	</tr>
	</table>			
	
	<table cellspacing="1" cellpadding="3" border="0">
	<tr><td width="150" style="text-align: right">{="Graveyard"} (00:00 - 07:00)</td>{loop $weekday=$weekdays}<td id="aph_ttl_gr{$_loop.key}" width="75" colspan="7" style="text-align: center; background-color: #FFBBBB" id="">0</td>{/loop}</tr>
	<tr><td style="text-align: right">{="Morning"} (07:00 - 11:00)  </td>{loop $weekday=$weekdays}<td id="aph_ttl_mo{$_loop.key}" colspan="7" style="text-align: center; background-color: #ffca86">0</td>{/loop}</tr>
	<tr><td style="text-align: right">{="Lunch"} (11:00 - 13:00)    </td>{loop $weekday=$weekdays}<td id="aph_ttl_lu{$_loop.key}" colspan="7" style="text-align: center; background-color: #fce899">0</td>{/loop}</tr>
	<tr><td style="text-align: right">{="Afternoon"} (13:00 - 19:00)</td>{loop $weekday=$weekdays}<td id="aph_ttl_af{$_loop.key}" colspan="7" style="text-align: center; background-color: #C0DDF9">0</td>{/loop}</tr>
	<tr><td style="text-align: right">{="Evening"} (19:00 - 00:00)  </td>{loop $weekday=$weekdays}<td id="aph_ttl_ev{$_loop.key}" colspan="7" style="text-align: center; background-color: #a7d69e">0</td>{/loop}</tr>
	</table>
	{/box}
	
