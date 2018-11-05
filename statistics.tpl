{resource type="js" src="/system/flot/excanvas.min.js" iecondition="lte IE 8"}
{resource type="js" class="flot"}
{resource type="js" class="statistics"}

{language}
	none: 			'{="None"}',
    other: 			'{="Other"}',
{/language}

{include file="units_lang.tpl"}

{onready method="prepend"}
	window.stats = new Statistics('window.stats');
	window.stats.initialize({$timezoneoffset});
	collapse_all_tables(true);
{/onready}

	<div class="boxhighlight">
		<div class="innerbox">

			<div id="periodsummary">
				<div style="float: right">
					<a href="#" onclick="set_period(1); return false">{="Yesterday"}</a> |
					<a href="#" onclick="set_period(7); return false">{="%s days",7}</a> |
					<a href="#" onclick="set_period(14); return false">{="%s days",14}</a> |
					<a href="#" onclick="set_period(30); return false">{="%s days",30}</a> |
					<a href="#" onclick="edit_period(); return false">{="Custom"}</a>
				</div>
				{="Statistics for reporting period:"}
				<span id="period_summary_relative">{="Last %s day(s)","<span id="period_summary_relative_days"></span>"}</span>
				<span id="period_summary_range" style="display: none">{="From %s to %s","<span id="period_summary_range_from"></span>","<span id="period_summary_range_to"></span>"}</span>
				<span id="period_summary_month" style="display: none">{="Month of %s","<span id="period_summary_month_month"></span>"}</span>
			</div>

			<div id="periodselect" style="display: none">
				<div style="float: right; color: #909090">
				{="Statistics can be reported for any period of up to %s days.",$_CONSTANTS.MAX_REPORTING_PERIOD}
				</div>
				{="Select a reporting period"}: <br />
			</div>
			<div id="periodchooser" style="display: none">
				<form id="period_form">
					<input type="radio" name="periodtype" value="relative" /> {="Last %s day(s)","<input type='text' id='period_relative_days' size='3' maxlength='2' value='' />"}<br />
					<input type="radio" name="periodtype" value="range" /> {="From %s to %s",$_|dateselect:period_range_from:unix:format=locale:minyear=2006:maxyear=this,$_|dateselect:period_range_to:unix:format=locale:minyear=2006:maxyear=this}<br />
					<input type="radio" name="periodtype" value="month" /> {="Month of %s",$_|dateselect:period_month_sel:unix:format=locale:noday:minyear=2006:maxyear=this}<br />

					<input type="button" value="{="Update"}" onclick="summarize_period();window.stats.change_period()" /> <input type="button" value="{="Cancel"}" onclick="summarize_period()" />
				</form>
			</div>

		</div>
	</div>
	<br />

	{$statistics_tabset}
	