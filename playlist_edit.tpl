{css}
.box { margin-bottom: 4px; }
{/css}
{javascript}<script>
function set_select_element(id,value) {
	var el = document.getElementById(id);
	if (!el) return;
	for (var i=0; i<el.options.length; i++) {
		if (el.options[i].value==value) {
			el.selectedIndex = i;
			break;
		}
	}
}
function update_scheduled_date(cal) {
	var date = cal.date;
	
	set_select_element('scheduled_date_month',date.getMonth() + 1);
	set_select_element('scheduled_date_day',date.getDate());
	set_select_element('scheduled_date_year',date.getFullYear());
}

function update_panes() {
	var sel = document.getElementById('playlisttype');
	if (!sel || !sel.options) return;
	
	var activetype = sel.options[sel.selectedIndex].value;
	for (var i=0; i<sel.options.length; i++) {
		var thistype = sel.options[i].value;
		
		var el = document.getElementById(thistype+'_options');
		if (el) el.style.display = (activetype==thistype) ? '' : 'none';
		var el = document.getElementById(thistype+'_info');
		if (el) el.style.display = (activetype==thistype) ? '' : 'none';
	}
	
	var el = document.getElementById('sort_options');
	el.style.display = (activetype=='general') || (activetype=='now') ? '' : 'none';
}

function update_scheduled_repeat() {
	var sel = document.getElementById('scheduled_repeat');
	if (!sel) return;
	
	var turnoffs = [ 'weekly','monthly' ];
	for (turnoff in turnoffs) {
		var el = document.getElementById('row_scheduled_'+turnoffs[turnoff]);
		if (el) el.style.display = 'none';
	}
	
	var scheduled_repeat = sel.options[sel.selectedIndex].value;
	var el = document.getElementById('row_scheduled_'+scheduled_repeat);
	if (el) el.style.display = '';
}

{if $canschedule==0}
	{* note: scheduling requires ices0 w/shell scripting support, which is only available *}
	{* in recent ices 0.4 nightlies from http://people.xiph.org/~brendan/snapshots/ices0/ *}
	{* or the unofficial ices-cc 0.4.2 from Centova Technologies *}
	function disable_scheduling() {
		var scheduling_elements = new Array('scheduled_datetime','btn_scheduled_datetime','scheduled_repeat','scheduled_weekdays','scheduled_monthdays','scheduled_date_month','scheduled_date_day','scheduled_date_year','scheduled_time_hour','scheduled_time_min','scheduled_time_ampm','scheduled_interruptible');
		for (var i=0; i<scheduling_elements.length; i++) {
			var el = document.getElementById(scheduling_elements[i]);
			if (el) el.disabled = true;
		}
	}
{/if}
</script>{/javascript}

{onready}
update_panes();
update_scheduled_repeat()
{if $canschedule==0}disable_scheduling();{/if}
{/onready}

<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">

{if $errors|count}
{box title="Error"}{="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).{/box}<br />
{elseif $error}
{box title="Error"}{="An error occurred while attempting to save this update."}{/box}<br />
{/if}

{box title="Playlist Settings"}

	<div style="float: right; width: 250px; height: 65px; border-left: 1px dashed #E0E0E0; padding: 0 5px 0 10px">
		<div id="general_info">
		{="General rotation playlists are used to play media from your library when no scheduled or interval playlists are due to be played.  Most stations spend the majority of their air time playing tracks from general rotation playlists."}
		</div>
		<div id="scheduled_info">
		{="Scheduled playlists allow you to schedule a list of tracks to be played at a specific date and time.  These playlists can also be setup to repeat on a schedule, making them ideal for daily/weekly countdowns or pre-recorded shows."}
		</div>
		<div id="interval_info">
		{="Interval playlists allow you to play tracks at regular intervals of several minutes or several songs.  These playlists are useful for playing recurring content, such as station identification or commercial advertisements."}
		</div>
		<div id="now_info">
		{="Immediate playlists allow you to queue tracks to be played immediately after the end of the current track.  These playlists are useful for playing tracks on demand, such as song requests."}
		</div>
	</div>

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td>{="Title"}: {$errors.title|checkerror}</td>
		<td><input type="text" name="playlist[title]" size="50" maxlength="255" value="{$playlist.title|htmlentities}" /></td>
	</tr>
	<tr>
		<td>{="Status"}: {$errors.status|checkerror}</td>
		<td>
			<select name="playlist[status]" size="1">
			<option value="enabled"{if $playlist.status=="enabled"} selected="selected"{/if}>{="Enabled"}</option>
			<option value="disabled"{if $playlist.status=="disabled"} selected="selected"{/if}>{="Disabled"}</option>
			</select>
		</td>		
	</tr>	
	<tr>
		<td>{="Type"}: {$errors.type|checkerror}</td>
		<td>
			<select name="playlist[type]" size="1" onchange="update_panes()" id="playlisttype">
			<option value="general"{if $playlist.type=="general"} selected="selected"{/if}>{="General rotation"}</option>
			<option value="scheduled"{if $playlist.type=="scheduled"} selected="selected"{/if}>{="Scheduled"}</option>
			<option value="interval"{if $playlist.type=="interval"} selected="selected"{/if}>{="Interval"}</option>
			<option value="now"{if $playlist.type=="now"} selected="selected"{/if}>{="Immediate"}</option>
			</select>
		</td>		
	</tr>
	</table>

{/box}

{box title="Playlist sort details" id="sort_options"}
	<strong>{="Playlist sort details"}</strong><br /><br />

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td>{="Playback order"}: {$errors.general_order|checkerror}</td>
		<td>
			<select name="playlist[general_order]" size="1">
			<option value="random"{if $playlist.general_order=="random"} selected="selected"{/if}>{="Random (shuffled)"}</option>
			<option value="sequential"{if $playlist.general_order=="sequential"} selected="selected"{/if}>{="Sequential (in order)"}</option>
			</select>
		</td>		
	</tr>
	</table>
{/box}

{box title="General rotation playlist details" id="general_options"}

	{="General rotation playlists can be 'weighted' to ensure that tracks from one general rotation playlist are played more or less frequently than tracks from other general rotation playlists.  This can be used to ensure that new releases are played more frequently than older tracks, for example."}<br /><br />
	
	{="Select a weight for this playlist below.  Songs in playlists with higher weights play more frequently than songs in playlists with lower weights."}<br /><br />

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="100">{="Playback weight"}: {$errors.general_weight|checkerror}</td>
		<td>
			<select name="playlist[general_weight]" size="1">
			{loop $counter=$_|range:1:20}
			<option value="{$counter}"{if $counter==$playlist.general_weight} selected="selected"{/if}>{$counter} {if $counter==1} - {="Less frequently"}{elseif $counter==20} - {="More frequently"}{/if}</option>
			{/loop}
			</select>
		</td>
	</tr>
	</table>
		
	<br />
	{="General rotation playlists can also be limited to a specific period of the day.  This can be used to play lighter songs in the morning and heavier songs in the afternoon, for example.  If no time period is selected, the playlist will be active for the entire day."}<br /><br />

	{if $canschedule==0}
	<span class="error">{="Note: time-of-day settings are unavailable because the %s streaming source is in use, which does not support scheduling.",$sourcetype}<br /><br /></span>
	{/if}
	
	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="100">{="Active from"}: {$errors.general_starttime|checkerror}</td>
		<td>
			{check $canschedule==0}--{otherwise}
			{$playlist.general_starttime|dateselect:general_starttime:datetime:timeonly:allownull:showtime:ampm:format=locale}
			{/check}
		</td>
	</tr>	
	<tr>
		<td>{="Active until"}: {$errors.general_endtime|checkerror}</td>
		<td>
			{check $canschedule==0}--{otherwise}
			{$playlist.general_endtime|dateselect:general_endtime:datetime:timeonly:allownull:showtime:ampm:format=locale}
			{/check}
		</td>
	</tr>	
	</table>
{/box}

<div id="now_options">

{if $canschedule==0}
	{box title="Warning"}
		{="Immediate playlists are unavailable because the %s streaming source is in use, which does not support scheduling.",$sourcetype}
	{/box}
{/if}
	
</div>

{box title="Scheduled playlist details" id="scheduled_options"}
	
	{if $canschedule==0}
	<span class="error">{="Note: scheduled playlists are unavailable because the %s streaming source is in use, which does not support scheduling.",$sourcetype}<br /><br /></span>
	
	{/if}

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td>{="Scheduled date"}: {$errors.scheduled_datetime|checkerror}</td>
		<td>
			{$playlist.scheduled_datetime|dateselect:scheduled_date:datetime:format=locale}
			<input type="button" value=" ... " id="btn_scheduled_datetime" title="{="Display calendar"}" />
			<input id="scheduled_datetime" type="hidden" name="tmp_scheduled_datetime" value="{$playlist.scheduled_datetime|htmlentities}" />
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "scheduled_datetime",		// ID of the input field
			      ifFormat    : "%Y-%m-%d",    				// the date format
			      button      : "btn_scheduled_datetime",	// ID of the button
			      showOthers  : true,
			      align       : "Bl",
			      onUpdate    : update_scheduled_date
			    }
			  );
			</script>					
			
		</td>
	</tr>
	<tr>
		<td>{="Scheduled time"}: {$errors.scheduled_datetime|checkerror}</td>
		<td>{$playlist.scheduled_datetime|dateselect:scheduled_time:datetime:timeonly:showtime:ampm:format=locale}</td>
	</tr>
	<tr>
		<td>{="Repeat schedule"}: {$errors.scheduled_repeat|checkerror}</td>
		<td>
			<select id="scheduled_repeat" name="playlist[scheduled_repeat]" onchange="update_scheduled_repeat()" size="1">
			<option value="never"{if $playlist.scheduled_repeat=="never"} selected="selected"{/if}>{="Never (one time only)"}</option>
			<option value="daily"{if $playlist.scheduled_repeat=="daily"} selected="selected"{/if}>{="Daily"}</option>
			<option value="weekly"{if $playlist.scheduled_repeat=="weekly"} selected="selected"{/if}>{="Weekly"}</option>
			<option value="monthly"{if $playlist.scheduled_repeat=="monthly"} selected="selected"{/if}>{="Monthly"}</option>
			<option value="yearly"{if $playlist.scheduled_repeat=="yearly"} selected="selected"{/if}>{="Yearly"}</option>
			</select>
		</td>
	</tr>
	<tr id="row_scheduled_weekly">
		<td valign="top">
			{="Repeat on"}: {$errors.scheduled_weekdays|checkerror}<br /><br />
			
			<span class="info">
			({="Hold Ctrl to%sselect multiple.","<br />"})
			</span>
		</td>
		<td>
			<select name="playlist[scheduled_weekdays][]" id="scheduled_weekdays" size="7" multiple="multiple">
			<option value="sun"{if $playlist.scheduled_weekdays|contains:"sun"} selected="selected"{/if}>{="Sun"}</option>
			<option value="mon"{if $playlist.scheduled_weekdays|contains:"mon"} selected="selected"{/if}>{="Mon"}</option>
			<option value="tue"{if $playlist.scheduled_weekdays|contains:"tue"} selected="selected"{/if}>{="Tue"}</option>
			<option value="wed"{if $playlist.scheduled_weekdays|contains:"wed"} selected="selected"{/if}>{="Wed"}</option>
			<option value="thu"{if $playlist.scheduled_weekdays|contains:"thu"} selected="selected"{/if}>{="Thu"}</option>
			<option value="fri"{if $playlist.scheduled_weekdays|contains:"fri"} selected="selected"{/if}>{="Fri"}</option>
			<option value="sat"{if $playlist.scheduled_weekdays|contains:"sat"} selected="selected"{/if}>{="Sat"}</option>
			</select>
		</td>		
	</tr>
	<tr id="row_scheduled_monthly">
		<td>{="Repeat on"}: {$errors.scheduled_monthdays|checkerror}</td>
		<td>
			<select name="playlist[scheduled_monthdays]" id="scheduled_monthdays" size="1">
			<option value="date"{if $playlist.scheduled_monthdays=="date"} selected="selected"{/if}>{="Scheduled date"}</option>
			<option value="first"{if $playlist.scheduled_monthdays=="first"} selected="selected"{/if}>{="First day of month"}</option>
			<option value="last"{if $playlist.scheduled_monthdays=="last"} selected="selected"{/if}>{="Last day of month"}</option>
			</select>
		</td>		
	</tr>
	<tr>
		<td>{="Playback style"}: {$errors.scheduled_style|checkerror}</td>
		<td>
			<select name="playlist[scheduled_style]" size="1">
			<option value="sequential"{if $playlist.scheduled_style=="sequential"} selected="selected"{/if}>{="Play all tracks sequentially (in order)"}</option>
			<option value="random"{if $playlist.scheduled_style=="random"} selected="selected"{/if}>{="Play all tracks randomly (shuffled)"}</option>
			<option value="onerandom"{if $playlist.scheduled_style=="onerandom"} selected="selected"{/if}>{="Play only one randomly selected track from this playlist"}</option>
			</select>
		</td>		
	</tr>	
	<tr id="row_scheduled_interruptible">
		<td>{="Interruptible"}: {$errors.scheduled_interruptible|checkerror}</td>
		<td>
			<select name="playlist[scheduled_interruptible]" id="scheduled_interruptible" size="1">
			<option value="0"{if $playlist.scheduled_interruptible==0} selected="selected"{/if}>{="No, always play to completion or stop time"}</option>
			<option value="1"{if $playlist.scheduled_interruptible>0} selected="selected"{/if}>{="Yes, terminate if another scheduled playlist is due to begin"}</option>
			</select>
		</td>		
	</tr>
	<tr>
		<td>{="Stop after"}: {$errors.scheduled_duration|checkerror}</td>
		<td><input type="text" name="playlist[scheduled_duration]" size="5" maxlength="5" value="{$playlist.scheduled_duration|htmlentities}" /> {="minutes (0 to play to completion)"}</td>
	</tr>			
	</table>
{/box}
{box title="Interval playlist details" id="interval_options"}
	
	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td>{="Repeat every"}: {$errors.interval_type|checkerror}{$errors.interval_length|checkerror}</td>
		<td>
			<input type="text" name="playlist[interval_length]" size="5" maxlength="5" value="{if $playlist.interval_length}{$playlist.interval_length|htmlentities}{else}20{/if}" />
			{check $canschedule>0}
			<select name="playlist[interval_type]" size="1" id="playlist_interval_type">
			<option value="songs"{if $playlist.interval_type=="songs"} selected="selected"{/if}>{="Songs"}</option>
			<option value="minutes"{if $playlist.interval_type=="minutes"} selected="selected"{/if}>{="Minutes"}</option>
			</select>
			{otherwise}
			{="Songs"}
			<input type="hidden" name="playlist[interval_type]" value="songs" />
			{/check}
		</td>		
	</tr>
	<tr>
		<td>{="Playback style"}: {$errors.interval_style|checkerror}</td>
		<td>
			<select name="playlist[interval_style]" size="1">
			<option value="onerandom"{if $playlist.interval_style=="onerandom"} selected="selected"{/if}>{="Play only one randomly selected track from this playlist"}</option>
			<option value="playall"{if $playlist.interval_style=="playall"} selected="selected"{/if}>{="Play all tracks from this playlist in order"}</option>
			</select>
		</td>		
	</tr>
	</table>
{/box}
{box title="Save"}
	<input type="submit" name="update" value="{="Save"}" />
	<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}&plimit=200'; return false" />
{/box}

</form>
