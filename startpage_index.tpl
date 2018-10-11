		<h3>{="Web Audio Player"}</h3>

		<div class="block">
			<div class="content" style="text-align: center; margin: 0 auto 0 auto">

				<div class="cc_player" data-username="{$username|htmlentities}" data-charset="{$charset|htmlentities}"{if $account.webplayer|substr:0:7=="jplayer"} data-skin="blue.monday.startpage"{/if}>Loading ...</div>

			</div>
		</div>
		<script language="javascript" type="text/javascript" src="/system/player.js"></script>

		{check $account.allowrequests>0}
		<h3>{="Request a song"}</h3>
	
		<div class="block">
			<div class="content">
			
				<div id="cc_req_result_{$username|htmlentities}{$charset|htmlentities}"></div>
				<form>
				{="Song artist"}: <input type="text" id="cc_req_artist_{$username|htmlentities}{$charset|htmlentities}" name="request[artist]" size="40" maxlength="127" /><br />
				{="Song title"}: <input type="text" id="cc_req_title_{$username|htmlentities}{$charset|htmlentities}" name="request[title]" size="40" maxlength="127" /><br />
				{="Dedicated to"}: <input type="text" id="cc_req_dedi_{$username|htmlentities}{$charset|htmlentities}" name="request[dedication]" size="40" maxlength="127" /><br />
				{="Your name"}: <input type="text" id="cc_req_sender_{$username|htmlentities}{$charset|htmlentities}" name="request[sender]" size="40" maxlength="127" /><br />
				{="Your E-mail"}: <input type="text" id="cc_req_email_{$username|htmlentities}{$charset|htmlentities}" name="request[email]" size="40" maxlength="127" /><br />
				<input type="button" id="cc_req_button_{$username|htmlentities}{$charset|htmlentities}" class="cc_request_form" value="{="Submit song request"}" /><br />
				</form>			
			</div>
		</div>
		<script language="javascript" type="text/javascript" src="/system/request.js"></script>
		{/check}
	
		{check $account.allowondemand>0}
		<h3>{="On-demand Content"}</h3>
	
		<div class="block">
			<div class="content">
				<div id="cc_ondemand_{$username|htmlentities}{$charset|htmlentities}" class="cc_ondemand_content">Loading...</div>
			</div>
		</div>
		<script language="javascript" type="text/javascript" src="/system/ondemand.js"></script>
		{/check}
		
		{check ($showgmaps>0)}
		<h3>{="Current Listener Locations"}</h3>

		<div class="block">
			<div id="cc_gmaps_{$username|htmlentities}{$charset|htmlentities}" class="cc_gmaps_map" style="width: 370px; height: 400px"></div>
		</div>
		<script language="javascript" type="text/javascript" src="http{if $_SERVER.HTTPS=="on"}s{/if}://maps.google.com/maps/api/js{if $gmapsident}?{$gmapsident}{/if}"></script>
		<script language="javascript" type="text/javascript" src="/system/googlemaps.js" defer="true"></script>
		{/check}
