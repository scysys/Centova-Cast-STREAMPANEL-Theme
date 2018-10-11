		{include "startpage_tunein.tpl"}

		<div style="white-space: nowrap; overflow: hidden; margin-right: 8px">
			{="Now playing"}: <a href="/tunein/{$username|htmlentities}.pls" id="cc_strinfo_summary_{$username|htmlentities}{$charset|htmlentities}" class="cc_streaminfo" style="text-overflow: ellipsis">Loading...</a> (<span id="cc_strinfo_server_{$username|htmlentities}{$charset|htmlentities}" class="cc_streaminfo"></span>)<br />
		</div>
		<script language="javascript" type="text/javascript" src="/system/streaminfo.js"></script>
