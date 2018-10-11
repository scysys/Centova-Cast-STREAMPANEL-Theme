		{check $account.allowrecent>0}
		<h3>{="Recent Tracks"}</h3>
		
		<div id="cc_recenttracks_{$username|htmlentities}{$charset|htmlentities}" class="cc_recenttracks_list">Loading...</div>
		
		<script language="javascript" type="text/javascript" src="/system/recenttracks.js"></script>
		{/check}