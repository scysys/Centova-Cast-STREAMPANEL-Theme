{check ($acctconfig.apptypes|contains:liquidsoap) and ($account.usesource!=2)}
	{box title="Live Source Connections"}
		{="Enter this information into your live source software to perform a live broadcast"}:<br /><br />
		<table cellspacing="1" cellpadding="1" border="0">
		<tr><td>{="Protocol"}:&nbsp;</td><td><strong>{$account.servertype|htmlentities}</strong></td></tr>
		<tr><td>{="Server hostname"}:&nbsp;</td><td><strong>{$serverhostname|htmlentities}</strong></td></tr>
		{if $account.port!=0}
		<tr><td>{="Server port"}:&nbsp;</td><td><strong>{$account.port|add:2|htmlentities}</strong></td></tr>
		{/if}
		<tr><td>{="Password"}:&nbsp;</td><td>({="The username and password of one of your %sDJ accounts%s, separated by a colon","<a href='index.php?page=djaccounts'>","</a>"})</td></tr>
		<tr><td>&nbsp;</td><td>{="Example: %sjsmith:secret%s","<strong>","</strong>"}</td></tr>
		{if $account.servertype=="ShoutCast"}
		{elseif $acctconfig.apptypes==""}
		<tr><td>{="Mount point"}:</td><td><strong>{$acctconfig.mountpoints.0.mountname|htmlentities}</strong></td></tr>
		{else}
		<tr><td>{="Mount point"}:</td><td><strong>/live</strong></td></tr>
		{/if}
		<tr><td>{="Maximum bit rate"}:&nbsp;</td><td><strong>{$account.maxbitrate|htmlentities}</strong> {="kbps"}</td></tr>
		</table>
	{/box}

{otherwise}
	{box title="Live Source Connections"}
		{="Enter this information into your live source software to perform a live broadcast"}:<br /><br />
		<table cellspacing="1" cellpadding="1" border="0">
		<tr><td>{="Protocol"}:&nbsp;</td><td><strong>{$account.servertype|htmlentities}</strong></td></tr>
		<tr><td>{="Server hostname"}:&nbsp;</td><td><strong>{$serverhostname|htmlentities}</strong></td></tr>
		{if $account.port!=0}
		<tr><td>{="Server port"}:&nbsp;</td><td><strong>{$account.port|htmlentities}</strong></td></tr>
		{/if}
		<tr><td>{="Password"}:&nbsp;</td><td>({="The 'Source password' value from your %sstream settings%s","<a href='index.php?page=configure'>","</a>"})</td></tr>
		{if $account.servertype=="ShoutCast"}
		{elseif $acctconfig.apptypes==""}
		<tr><td>{="Mount point"}:</td><td><strong>{$acctconfig.mountpoints.0.mountname|htmlentities}</strong></td></tr>
		{else}
		<tr><td>{="Mount point"}:</td><td><strong>/live</strong></td></tr>
		{/if}
		<tr><td>{="Maximum bit rate"}:&nbsp;</td><td><strong>{$account.maxbitrate|htmlentities}</strong> {="kbps"}</td></tr>
		</table>
	{/box}
{/check}
