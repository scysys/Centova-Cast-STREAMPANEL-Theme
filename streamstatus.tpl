{language}
	server_online: '{="Server online"}',
	server_offline: '{="Server offline"}',
	autodj_online: '{="AutoDJ online"}',
	autodj_offline: '{="AutoDJ offline"}',
	source_connected: '{="Source connected"}',
	no_source_connected: '{="No source connected"}',

	server_status: '{="Server status"}',
	autodj_status: '{="AutoDJ status"}',
	audio_source: '{="Audio source"}',
	server_online_tip: '{="Your streaming server is currently online and operational."}',
	server_offline_tip: '{="Your streaming server is currently offline."}',
	autodj_online_tip: '{="Your autoDJ is currently active and operational."}',
	autodj_offline_tip: '{="Your autoDJ is currently offline."}',
	source_connected_tip: '{="Your stream currently has an active source connection and is broadcasting audio."}',
	no_source_connected_tip: '{="Your server is currently online but there is no active source connection so no audio is being broadcasted."}',
	offline_no_source_tip: '{="Your server is offline and thus no source is connected."}',

{/language}
		<div class="streamstatus">
			{check $account.useserver>0}<img id="streamstatus_server" alt="{if $serveronline}{="Server online"}{else}{="Server offline"}{/if}" src="../theme/images/status/server{if $serveronline}up{else}down{/if}.png" />{/check}
			{check $account.usesource>0}<img id="streamstatus_autodj" alt="{if $sourceonline}{="AutoDJ online"}{else}{="AutoDJ offline"}{/if}" src="../theme/images/status/autodj{if $sourceonline}up{else}down{/if}.png" />{/check}
			<img id="streamstatus_source" alt="{if $sourceconnected}{="Source connected"}{else}{="No source connected"}{/if}" src="../theme/images/status/source{if $sourceconnected}up{else}down{/if}.png"/>
		</div>

