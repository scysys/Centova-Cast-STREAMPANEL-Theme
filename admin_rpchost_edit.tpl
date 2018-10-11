<table cellspacing="1" cellpadding="1" border="0">
<tr>
	<td width="140">{="Server title"}: {$errors.title|checkerror}</td>
	<td><input type="text" name="rpchost[title]" size="50" maxlength="255" value="{$rpchost.title|htmlentities}" /></td>
</tr>
<tr>
	<td>{="IP address"}: {$errors.ipaddress|checkerror}</td>
	<td>
		<input type="text" name="rpchost[ipaddress]" size="16" maxlength="15" value="{$rpchost.ipaddress|htmlentities}" onchange="if($('#rpcdefaultip').val()=='') $('#rpcdefaultip').val($(this).val());" />
		{tip type="icon"}{="This is the IP address on which the Centova Cast control daemon will be running."}<br/><br/>{="For standalone configurations (or for the master in master/slave configurations), this will usually be '127.0.0.1'.  For slave servers in master/slave configurations, this will usually be the slave server's primary IP address."}{/tip}
	</td>
</tr>
	<tr>
		<td>{="Hostname"}: {$errors.hostname|checkerror}</td>
		<td><input type="text" name="rpchost[hostname]" size="32" maxlength="255" value="{$rpchost.hostname|htmlentities}" /> ({="optional"})</td>
	</tr>
<tr>
	<td>{="Port"}: {$errors.port|checkerror}</td>
	<td><input type="text" name="rpchost[port]" size="6" maxlength="5" value="{$rpchost.port|htmlentities|default:2198}" /></td>
</tr>
<tr>
	<td>{="Authentication key"}: {$errors.authkey|checkerror}</td>
	<td><input type="password" name="rpchost[authkey]" size="40" maxlength="128" value="{$rpchost.authkey|htmlentities}" /></td>
</tr>
<tr>
	<td>{="Role"}:</td>
	<td>
		<input type="checkbox" name="rpchost[ismaster]" value="1" {if $rpchost.ismaster}checked="checked" {/if}/> {="Master"} {$errors.ismaster|checkerror}
		<input type="checkbox" name="rpchost[isrelay]" value="1" {if $rpchost.isrelay}checked="checked" {/if}/> {="Relay"} {$errors.isrelay|checkerror}
		{tip type="icon" title="Host role"}
		{="Centova Cast can make use of your individual servers in different ways depending on your role configuration."}<br /><br />
		
		<strong>{="Master"}</strong><br />
		{="If a server is configured with a master role, it will be used to host new streaming servers and their autoDJs."}<br /><br />
		
		<strong>{="Relay"}</strong><br />
		{="If a server is configured with a relay role, it will be used to relay streams hosted on other servers in your cluster (if server multihoming is enabled for those streams).  This is useful for bandwidth distribution and redundancy."}<br /><br />
		
		<strong>{="Both"}</strong><br />
		{="If a server is configured for both roles, Centova Cast will use it both to host new streams and to relay streams hosted on other machines in your cluster."}
		{/tip}
	</td>
</tr>
<tr>
	<td>{="Default stream IP address"}: {$errors.defaultip|checkerror}</td>
	<td>
		<input type="text" id="rpcdefaultip" name="rpchost[defaultip]" size="16" maxlength="15" value="{$rpchost.defaultip|htmlentities}" />
		{tip type="icon"}{="This is the default IP address which will be assigned to streams created on this server.  In most cases this will be the primary IP public address of the server."}{/tip}
	</td>
</tr>
<tr>
	<td>{="Port 80 proxy IP address"}: {$errors.proxyipaddress|checkerror}</td>
	<td>
		<input type="text" id="proxyipaddress" name="rpchost[proxyipaddress]" size="16" maxlength="128" value="{$rpchost.proxyipaddress|htmlentities}" /> ({="blank to use default stream IP address"})
		{tip type="icon"}{="This is the IP address (or hostname) on which you have configured your port 80 proxy to listen on this host (if enabled).  In most cases this will be the primary public IP address of the server, and will be the same address as the 'default stream IP address' above."}{/tip}
	</td>
</tr>
<tr>
	<td>{="Region"}:</td>
	<td>
{if $regions|count==0}
		{="All servers"}
		<input type="hidden" name="rpchost[regionid]" value="1" />
{else}
		<select name="rpchost[regionid]" size="1">
		{loop $region=$regions}
		<option {if $rpchost.regionid==$region.id}selected="selected" {/if}value="{$region.id}">{$region.title|htmlentities}</option>
{/loop}
		</select>
{/if}
	</td>
</tr>
	
</table>