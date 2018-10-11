{adminwarning title="Licensing warning"}
	{="The license data for the following server(s) is nearing or has reached its expiration date:"}
	<br /><br />

	{loop $expiration=$expirations}
	<strong>{$expiration.title}</strong><br />
	{$expiration.hostname} - {if $expiration.remain>0}{="expires in %s",$expiration.remain|timetext:brief}{else}<span style="color: red">{="inactive"}</span><br /><span style="color: #505050">{$expiration.status.licerror}</span>{/if}<br />
	{/loop}
	<br />

	{if $expiration.0.remain>0}
	{="Typically a renewal should have been received by this time; this may indicate a problem with your license(s) or a problem communicating with the Centova Technologies licensing servers."}
	<br /><br />
	{/if}
	{="For assistance in diagnosing this problem, please consult the %sLicense Expiration article%s in the Centova Cast knowledge base.","<a target='_blank' href='http://www.centova.com/faq/cast3/troubleshooting/license_expiration_warning_for_an_active_license'>","</a>"}
{/adminwarning}