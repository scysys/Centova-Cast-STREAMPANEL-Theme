{onready}
	window.stats.associate_tab({$stats_tabid},new StatsPage_Tracks());
{/onready}

<div style="text-align: center; font-weight: bold">{="Period Overview"}</div>

<div class="tablewrapper" id="track_overview">
<table cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
<tr>
	<th width="25%">{="Metric"}</th>
	<th width="25%" style="text-align: right">{="Value"}</th>
	<th width="20%">{="Metric"}</th>
	<th width="30%" style="text-align: right">{="Value"}</th>
</tr>
<tr>
	<td class="rowodd">{="Total tracks"}</td>
	<td class="rowodd" align="right" id="tracks_tracks_total">{="%s track(s)",$zero}</td>
	
	<td class="rowodd">{="Peak listeners"}</td>
	<td class="rowodd" align="right" id="tracks_mostlisteners_listeners">{="%s listener(s)",$zero}</td>
</tr>
<tr>
	<td class="roweven">{="Unique tracks"}</td>
	<td class="roweven" align="right" id="tracks_tracks_totalunique">{="%s track(s)",$zero}</td>

	<td class="roweven">{="Peak track"}</td>
	<td class="roweven" align="right" id="tracks_mostlisteners_name"></td>
</tr>
<tr>
	<td class="rowodd">{="Average per hour"}</td>
	<td class="rowodd" align="right" id="tracks_tracks_perhour">{="%.2f track(s)",$zero}</td>
	
	<td class="rowodd">{="Peak time"}</td>
	<td class="rowodd" align="right" id="tracks_mostlisteners_starttime">-</td>
</tr>
<tr>
	<td class="roweven">{="Average length"}</td>
	<td class="roweven" align="right" id="tracks_tracks_avglength"></td>
	
	<td colspan="2" class="rowodd">&nbsp;</td>
</tr>
</table>
</div>

<br />

<div id="track_popularity">
	
	<div style="text-align: center; font-weight: bold">{="Most Popular Tracks"} ({="by Connections per Minute"})</div>
	
	<div class="tablewrapper">
	<table id="tracks_most_popular" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
	<thead>
		<tr>
			<th>{="Track"}</th>
			<th style="text-align: right" width="130">{="Total Airtime"}</th>
			<th style="text-align: right" width="70">{="Net Conn."}</th>
			<th style="text-align: right" width="70">{="Conn./Min"}</th>
		</tr>
	</thead>
	<tbody>
    	<tr><td class="rowodd" colspan="4" style="text-align: center">{="None"}</td></tr>
	</tbody>
	</table>
	</div>
	
	<br />
	
	<div style="text-align: center; font-weight: bold">{="Least Popular Tracks"} ({="by Disconnections per Minute"})</div>
	
	<div class="tablewrapper">
	<table id="tracks_least_popular" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
	<thead>
		<tr>
			<th>{="Track"}</th>
			<th style="text-align: right" width="130">{="Total Airtime"}</th>
			<th style="text-align: right" width="70">{="Net Discon."}</th>
			<th style="text-align: right" width="70">{="Discon./Min"}</th>
		</tr>
	</thead>
	<tbody>
    	<tr><td class="rowodd" colspan="4" style="text-align: center">{="None"}</td></tr>
	</tbody>
	</table>
	</div>

</div>

<br />

<div id="track_frequency">

	<div style="text-align: center; font-weight: bold">{="Top Tracks by Playbacks"}</div>
	
	<div class="tablewrapper">
	<table id="tracks_top_playbacks" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
	<thead>
		<tr>
			<th>{="Track"}</th>
			<th style="text-align: right" width="200">{="Playbacks"}</th>
		</tr>
	</thead>
	<tbody>
    	<tr><td class="rowodd" colspan="2" style="text-align: center">{="None"}</td></tr>
	</tbody>
	</table>
	</div>
	
	<br />
	
	<div style="text-align: center; font-weight: bold">{="Top Tracks by Airtime"}</div>
	
	<div class="tablewrapper">
	<table id="tracks_top_airtime" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
	<thead>
		<tr>
			<th>{="Track"}</th>
			<th style="text-align: right" width="200">{="Airtime"}</th>
		</tr>
	</thead>
	<tbody>
    	<tr><td class="rowodd" colspan="2" style="text-align: center">{="None"}</td></tr>
	</tbody>
	</table>
	</div>
	
</div>

<br />
