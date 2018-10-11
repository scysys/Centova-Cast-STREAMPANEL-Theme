{resource type="js" class="rpc"}
{resource type="js" class="client"}

{object name="clientinfo"}
	dj: {if $isdj}1{else}0{/if},
	privilegeduser: {if $privileged}1{else}0{/if},
	serveronline: {if $serveronline}1{else}0{/if},
	autodjonline: {if $autodjonline}1{else}0{/if},
	username: '{$account.username|jsescape}',
	tuneinurl: '{$serverdetails.tuneinurl|jsescape}',
	directtuneinurl: '{$serverdetails.directtuneinurl|jsescape}',
	proxytuneinurl: '{$serverdetails.proxytuneinurl|jsescape}',
	tuneinformat: '{$serverdetails.tuneinformat|jsescape}',
	coverurl: '{$serverdetails.coverurl|jsescape}',
	webplayer: '{$serverdetails.webplayer|jsescape}',
	players: [{loop $player=$players}
		{ title: '{$player.title|jsescape}', link: '{$player.tunein|jsescape}' }{if $_loop.last==0},{/if}{/loop}
	]
{/object}

{language}
	nowplaying: '{="Now Playing"}',
	onstream: '{="on %s"}',
	atkbps: '{="at %skbps"}',
	songnotavail: '{="Current song not available"}',
	stationoffline: '{="Station is offline"}',
	retrieving: '{="Retrieving current song..."}',
	notrunning: '{="The server is not currently running.  Please start the server, then try again."}',
	other: '{="Other"}',
	tuneinwith: '{="Tune in with ..."}'
{/language}
