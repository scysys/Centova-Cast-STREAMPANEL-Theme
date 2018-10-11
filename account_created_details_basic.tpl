	
	<table cellspacing="0" cellpadding="1" border="0">
	<tr><td>{="Username"}:</td><td style="font-weight: bold">{$account.username}</td></tr>
	{if $account.reseller==0}
	<tr><td>{="IP address"}:&nbsp;</td><td style="font-weight: bold">{$account.ipaddress}</td></tr>
	{/if}
	</table>
