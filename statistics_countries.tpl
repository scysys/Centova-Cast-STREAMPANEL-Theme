{onready}
	window.stats.associate_tab({$stats_tabid},new StatsPage_Countries());
{/onready}

<div style="text-align: center; font-weight: bold">{="Top Countries by Listener Sessions"}</div>

<div class="tablewrapper" id="top_countries_by_sessions">
<table id="top_countries_sessions" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
<thead>
	<tr>
		<th></th>
		<th colspan="2">{="Country"}</th>
		<th></th>
		<th style="text-align: right">{="Sessions"}</th>
		<th></th>
	</tr>
</thead>
<tbody>
    <tr><td class="rowodd" colspan="6" style="text-align: center">{="None"}</td></tr>
</tbody>
</table>
</div>

<br />


<div style="text-align: center; font-weight: bold">{="Top Countries by Listener Minutes"}</div>

<div class="tablewrapper" id="top_countries_by_minutes">
<table id="top_countries_minutes" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
<thead>
	<tr>
		<th></th>
		<th colspan="2">{="Country"}</th>
		<th></th>
		<th style="text-align: right">{="Minutes"}</th>
		<th></th>
	</tr>
</thead>
<tbody>
    <tr><td class="rowodd" colspan="6" style="text-align: center">{="None"}</td></tr>
</tbody>
</table>
</div>

<br />

<div align="center">
	<form>
		{="Show"}: <select id="stats_countries_limit" size="1" onchange="window.stats.reload_tab_statistics({$stats_tabid})">
		<option value="10">{="Top %d","10"}</option>
		<option value="25">{="Top %d","25"}</option>
		<option value="50">{="Top %d","50"}</option>
		<option value="100">{="Top %d","100"}</option>
		<option value="250">{="Top %d","250"}</option>
		<option value="-1">{="All"}</option>
		</select>
	</form>
</div>

