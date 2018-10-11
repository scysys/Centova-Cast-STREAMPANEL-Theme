	
	<table cellspacing="0" cellpadding="1" border="0">
	<tr><td>{="Username"}:</td><td style="font-weight: bold">{$account.username}</td></tr>
	{if $account.hostname!=""}<tr><td>{="Hostname"}:</td><td style="font-weight: bold">{$account.hostname}</td></tr>{/if}
	{if $account.reseller==0}
	<tr><td>{="IP address"}:&nbsp;</td><td style="font-weight: bold">{$account.ipaddress}</td></tr>
	<tr><td>{="Port"}:</td><td style="font-weight: bold">{$account.port}</td></tr>
	{/if}
	</table>
