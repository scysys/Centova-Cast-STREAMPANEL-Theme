<link type="text/css" href="{$urlself}/jplayer/skin/blue.monday.startpage/css/jplayer.blue.monday.css" rel="stylesheet" />
<script type="text/javascript" src="{$urlself}/jplayer/jplayer/jquery.jplayer.min.js"></script>

<script language="javascript" type="text/javascript">
$(function(){
	var stream = {
		title: "{$account.title|jsescape}",
		{if $tuneinformat=="aac"}m4a{elseif $tuneinformat=="ogg"}oga{else}{$tuneinformat}{/if}: "{$tuneinurl}{if $account.servertype=="ShoutCast"};stream/1{/if}"
	},
	ready = false,
	eurlattempts = 0;

	$("#startpage_jplayer").jPlayer({
		ready: function (event) {
			ready = true;
			$(this).jPlayer("setMedia", stream);
		},
		playing: function(event) {
			eurlattempts = 0;
			$('#jp_container_1 .jp-info-bar').text('');
		},
		pause: function() {
			$(this).jPlayer("clearMedia");
			$(this).jPlayer("setMedia", stream);
			//$.dbg('pause');
		},
		error: function(event) {
			if (ready && event.jPlayer.error.type == $.jPlayer.error.URL && eurlattempts<5) {
				var self = this;
				eurlattempts++;

				setTimeout(function(){
					$(self).jPlayer("setMedia", stream).jPlayer("play");
				},1000);
			} else if (ready && event.jPlayer.error.type === $.jPlayer.error.URL_NOT_SET) {
				// Setup the media stream again and play it.
				$(this).jPlayer("setMedia", stream).jPlayer("play");
			} else {
				eurlattempts = 0;
				$('#jp_container_1 .jp-info-bar').text('Error: '+event.jPlayer.error.message+' '+event.jPlayer.error.hint+' ('+event.jPlayer.error.type+' context '+event.jPlayer.error.context+')' + ( event.jPlayer.error.type === $.jPlayer.error.URL_NOT_SET ? 'Y':'N') );
			}
		},

		swfPath: "{$urlself}/jplayer/",
		supplied: "{if $tuneinformat=="aac"}m4a{elseif $tuneinformat=="ogg"}oga{else}{$tuneinformat}{/if}",
		preload: "none",
		wmode: "window",
		keyEnabled: true

		/*
		flashreset: function(event) { $.dbg('flashreset'); },
		resize: function(event) { $.dbg('resize'); },
		repeat: function(event) { $.dbg('repeat'); },
		click: function(event) { $.dbg('click'); },
		warning: function(event) { $.dbg('warning: '+event.jPlayer.warning.type+' context '+event.jPlayer.warning.context+' '+event.jPlayer.warning.message+'; hint: '+event.jPlayer.warning.hint); },
		loadstart: function(event) { $.dbg('loadstart'); },
		progress: function(event) {
			$.dbg('progress: src: '+event.jPlayer.status.src+', seek: '+event.jPlayer.status.seekPercent+' time: '+event.jPlayer.status.currentTime);
		},
		suspend: function(event) { $.dbg('suspend'); },
		abort: function(event) { $.dbg('abort'); },
		emptied: function(event) { $.dbg('emptied'); },
		stalled: function(event) { $.dbg('stalled'); },
		play: function(event) { $.dbg('play'); },
		loadedmetadata: function(event) { $.dbg('loadedmetadata'); },
		loadeddata: function(event) { $.dbg('loadeddata'); },
		waiting: function(event) { $.dbg('waiting'); },
		playing: function(event) { $.dbg('playing'); },
		canplay: function(event) { $.dbg('canplay'); },
		canplaythrough: function(event) { $.dbg('canplaythrough'); },
		seeking: function(event) { $.dbg('seeking'); },
		seeked: function(event) { $.dbg('seeked'); },
		timeupdate: function(event) { $.dbg('timeupdate'); },
		ended: function(event) { $.dbg('ended'); },
		ratechange: function(event) { $.dbg('ratechange'); },
		durationchange: function(event) { $.dbg('durationchange'); },
		volumechange : function(event) { $.dbg('volumechange'); },
		*/
	});

});
</script>
<div id="startpage_jplayer" class="jp-jplayer"></div>

<div id="jp_container_1" class="jp-audio-stream" role="application" aria-label="media player">
	<div class="jp-type-single">
		<div class="jp-gui jp-interface">
			<div class="jp-volume-controls">
				<button class="jp-mute" role="button" tabindex="0">mute</button>
				<button class="jp-volume-max" role="button" tabindex="0">max volume</button>
				<div class="jp-volume-bar">
					<div class="jp-volume-bar-value" style="width: 80%;"></div>
				</div>
			</div>
			<div class="jp-controls">
				<button class="jp-play" role="button" tabindex="0">play</button>
			</div>
		</div>
		<div class="jp-no-solution">
			<span>Update Required</span>
			To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
		</div>
	</div>
	<div class="jp-info-bar"></div>
</div>
