
{language}
	download:		'{="Download"}',
{/language}

{onready}
	window.stats.associate_tab({$stats_tabid},new StatsPage_Downloads());
{/onready}

<div id="download_reports">

	<div style="text-align: center; font-weight: bold">{="Track Broadcast Reports"}</div>

	<div class="tablewrapper" style="margin-bottom: 4px">
	<table id="download_reports_list" cellspacing="1" cellpadding="3" border="0" class="listtable" width="100%">
	<thead>
		<tr>
			<th>{="Report"}</th>
			<th style="text-align: right" width="200">{="Size"}</th>
			<th style="text-align: center" width="70">{="Download"}</th>
		</tr>
	</thead>
	<tbody>
		<tr><td class="rowodd" colspan="3" style="text-align: center">{="None"}</td></tr>
	</tbody>
	</table>
	</div>
	{box}
		{="These reports provide the track name, air time, and number of listeners for each track broadcasted during the reporting period."}<br />
		{="Reports are generated in CSV format on the first of each month, and may be useful for licensing/royalty reporting."}
	{/box}

	<div style="float: right; margin-top: 4px"><a style="font-weight: normal; color: #666666" href='index.php?page=reportdownloads'">{="Configure custom reports"}</a> <img align="absmiddle" src="/system/images/csv.png" /></div>

	<br />
</div>
<br />
