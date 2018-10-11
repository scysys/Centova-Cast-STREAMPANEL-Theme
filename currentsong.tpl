<span id="nowplaying"></span>

{options type="streaminfo"}
	local: true,
	manual: true,
	before_change_callback: function(json){ window.centovacast.clientarea.before_track_change(json.data[0]); },
	after_change_callback: function(json){ window.centovacast.clientarea.after_track_change(json.data[0]); },
	initial: {
		currentsong: "{$serverstatus.currentsong|jsescape}",
		title: "{$serverstatus.title|jsescape}",
		url: "{$serverstatus.url|jsescape}",
		bitrate: "{$serverstatus.bitrate|jsescape}",
		date: "{$_|gettime:locale:time:$timezoneoffset}",
		secsleft: {$serverstatussecsleft}
	}
{/options}
{resource type="js" src="/system/streaminfo.js" depends="jq"}

