{onready}
	window.stats.associate_tab({$stats_tabid},new StatsPage_RecentActivity());
{/onready}
	<div style="text-align: center; font-weight: bold">{="48 Hour Overview"}</div>

	<table cellspacing="0" cellpadding="0" border="0" width="100%">
	<tr>
		<td valign="top" width="50%">
			<div class="tablewrapper recent_activity_table">
			<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
			<tr>
				<th colspan="2">{="Metric"}</th>
				<th style="text-align: right">{="Value"}</th>
			</tr>
			<tr>
				<td class="roweven" style="font-weight: bold">{="Listener Minutes"}</td>
				<td class="roweven">{="Total"}</td>
				<td class="roweven" align="right" id="recentstats_totalminutes">{="%s minute(s)",$zero}</td>
			</tr>
			<tr>
				<td class="rowodd">&nbsp;</td>
				<td class="rowodd">{="Total listening hours (TLH)","<span class='recent_activity_days'>1</span>"}</td>
				<td class="rowodd" align="right" id="recentstats_tlh">{="%.2f",$zero}</td>
			</tr>
			<tr>
				<td class="roweven">&nbsp;</td>
				<td class="roweven">{="Average session length"}</td>
				<td class="roweven" align="right" id="recentstats_avgminutes">{="%.1f minute(s)",$zero}</td>
			</tr>
			<tr>
				<td class="roweven" style="font-weight: bold">{="Listeners"}</td>
				<td class="roweven">{="Total sessions"}</td>
				<td class="roweven" align="right" id="recentstats_totalsessions">{="%s session(s)",$zero}</td>
			</tr>
			<tr>
				<td class="rowodd">&nbsp;</td>
				<td class="rowodd">{="Unique listeners"}</td>
				<td class="rowodd" align="right" id="recentstats_uniquelisteners">{="%s listener(s)",$zero}</td>
			</tr>
			<tr>
				<td class="roweven">&nbsp;</td>
				<td class="roweven">{="Unique countries"}</td>
				<td class="roweven" align="right" id="recentstats_totalcountries">{="%s countries",$zero}</td>
			</tr>
			</table>
			</div>
			
		</td>
		<td width="16">&nbsp;</td>
		<td valign="top" width="50%">

			<div class="tablewrapper recent_activity_table">
			<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
			<tr>
				<th colspan="2">{="Metric"}</th>
				<th style="text-align: right">{="Value"}</th>
			</tr>
			<tr>
				<td class="rowodd" style="font-weight: bold">{="Data transfer"}</td>
				<td class="rowodd">{="Total"}</td>
				<td class="rowodd" align="right" id="recentstats_totaltransfer">{="%.1f MB",$zero}</td>
			</tr>
			<tr>
				<td class="roweven">&nbsp;</td>
				<td class="roweven">{="Session average"}</td>
				<td class="roweven" align="right" id="recentstats_avgtransfer">{="%.1f MB",$zero}</td>
			</tr>
			<tr>
				<td class="rowodd" style="font-weight: bold">{="Tracks"}</td>
				<td class="rowodd">{="Total"}</td>
				<td class="rowodd" align="right" id="recentstats_tracks_total">{="%s track(s)",$zero}</td>
			</tr>
			<tr>
				<td class="roweven">&nbsp;</td>
				<td class="roweven">{="Total unique"}</td>
				<td class="roweven" align="right" id="recentstats_tracks_totalunique">{="%s track(s)",$zero}</td>
			</tr>
			<tr>
				<td class="rowodd">&nbsp;</td>
				<td class="rowodd">{="Average per hour"}</td>
				<td class="rowodd" align="right" id="recentstats_tracks_perhour">{="%.2f track(s)",$zero}</td>
			</tr>
			<tr>
				<td class="roweven">&nbsp;</td>
				<td class="roweven">{="Average length"}</td>
				<td class="roweven" align="right" id="recentstats_tracks_avglength"></td>
			</tr>

			<tr>
				<td class="rowodd" style="font-weight: bold">{="Peak Period"}</td>
				<td class="rowodd">{="Listeners"}</td>
				<td class="rowodd" align="right" id="recentstats_mostlisteners_listeners">{="%s listener(s)",$zero}</td>
			</tr>
			<tr>
				<td class="roweven">&nbsp;</td>
				<td class="roweven">{="Track"}</td>
				<td class="roweven" align="right" id="recentstats_mostlisteners_name"></td>
			</tr>
			<tr>
				<td class="rowodd tdlast">&nbsp;</td>
				<td class="rowodd tdlast">{="Time"}</td>
				<td class="rowodd tdlast" align="right" id="recentstats_mostlisteners_starttime">-</td>
			</tr>
			
			</table>
			</div>

		</td>
	</tr>
	</table>

	<br />

	<table cellspacing="0" cellpadding="0" border="0" width="100%">
	<tr>
		<td align="left" width="25%">&nbsp;</td>
		<td align="left" width="50%">
		
		{ccgraph title="Listeners, Past 48 Hours" id="recent_listeners" class="narrowgraphmargin"}
		
		</td>
		<td align="left" width="25%">&nbsp;</td>
	</tr>
	</table>

