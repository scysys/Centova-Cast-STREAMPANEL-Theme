{javascript}<script>
window.ccselfurl = './';
window.listenerpoints = new Array(
{loop $listener=$listeners}{check $listener.geoip.latitude!=""}{ 
	addr: '{$listener.hostname|jsescape}',
	loc: '{if $listener.geoip.city}{$listener.geoip.city|jsescape}, {/if}{if $listener.geoip.region}{$listener.geoip.region|jsescape}, {/if}{$listener.geoip.country_name|jsescape}',
	code: '{$listener.geoip.country_code|strtolower|jsescape}',
	lat: '{$listener.geoip.latitude|jsescape}', 
	lon: '{$listener.geoip.longitude|jsescape}', 
	agent: '{$listener.useragent.name|jsescape}', 
	elapsed: '{$listener.elapsed|timetext|jsescape}' 
}{if $_loop.last==0},{/if}
{/check}{/loop}
);
</script>{/javascript}

<br />
{="Current geographic listener locations (click markers for details)"}:<br />
<div class="box">
	<div id="cc_google_maps"></div>
</div>
<br />

