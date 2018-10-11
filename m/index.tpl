{set $multipage}1{/set}

{onready mobile="true"}
<script>
	$("[data-role='navbar']").navbar();
	$( "[data-role='header'], [data-role='footer']" ).toolbar();
	</script>
{/onready}

<div data-role="page" id="index">

	<div data-role="content">

		<ul data-role="listview" id="recent_tracks_list">
		<li>{="Loading"} ...</li>
		</ul>
	</div>
</div>

<div date-role="page" id="autodj">
	<div data-role="content">
		<ul data-role="listview" id="recent_tracks_list">
			<li><a href="index.php?page=library">{="Media library"}</a></li>
			<li><a href="index.php?page=playlists">{="Configure playlists"}</a></li>
		</ul>
	</div>
</div>

<div data-role="page" id="statistics">
	<div data-role="content">
		Statistics.
	</div>
</div>

<div data-role="page" id="setup">
	<div data-role="content">
		Setup.
	</div>
</div>


{onready mobile="true"}

function time_diff(current, previous) {

	var mn = 60 * 1000,
		hr = mn * 60,
		dy = hr * 24,
		mo = dy * 31,
		yr = dy * 365,
		elapsed = current - previous;

	if (elapsed < 5) {
		return 'now';
	} else if (elapsed < mn) {
		return Math.round(elapsed/1000) + 'sec';
	} else if (elapsed < hr) {
		return Math.round(elapsed/mn) + 'min';
	} else if (elapsed < dy) {
		return Math.round(elapsed/hr) + 'hr';
	} else if (elapsed < mo) {
		return Math.round(elapsed/dy) + 'day';
	} else if (elapsed < yr) {
		return Math.round(elapsed/mo,1) + 'mo';
	} else {
		return Math.round(elapsed/yr,1) + 'yr';
	}

}

$.ajax({
	type: 'GET',
	url: '/recentfeed/{$account.username}/json/',
	dataType: 'json',
	success: function(data) {
		var $container = $('#recent_tracks_list');
		$container.empty();

		$.each(data.items,function(index, track) {
			console.log(track);
			$details = $('<li />');

			var trackdate = track.date * 1000;
			var now = (new Date()).getTime();

			if (track.enclosure && track.enclosure.url && track.enclosure.url.length) $('<img/>').attr('src',track.enclosure.url).appendTo($details);
			$('<h2/>').text(track.title).appendTo($details);
			$('<span/>').text(time_diff(now,trackdate)).css({ float: 'right', 'font-size': '80%' }).appendTo($details);
			$('<p/>').text(track.description).appendTo($details);

			$container.append($details);
		});
		$container.listview('refresh');
	},
	error: function(msg) {
	}
});
{/onready}