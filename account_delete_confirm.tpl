{box title="Delete Account"}
	<form method="get" action="index.php">
	{check $deletingreseller}
		{="Warning: This will permanently delete the %s%s%s reseller account and all associated configuration data.","<strong>",$username|htmlentities,"</strong>"}<br /><br />
	{otherwise}
		{="Are you sure you want to permanently delete the %s selected account(s)?","<strong>1</strong>"}<br /><br />
	{/check}
	
	{check ($deletingreseller) and ($resellerusers>0)}
		{="This reseller account currently owns %s%s%s client accounts.  How would you like to handle these accounts?","<strong>",$resellerusers,"</strong>"}<br />
		
		<table cellspacing="0" cellpadding="2" border="0">
		<tr><td><input type="radio" name="clientaction" value="reparent" checked="checked"></td><td>{="Move the clients to another reseller"}:</td></tr>
		<tr><td></td><td>
			<select name="targetreseller" size="1">
			<option value="0">{$settings.sitename} ({="no reseller"})</option>
			{loop $reseller=$otherresellers}
			<option value="{$reseller.id}">{if $reseller.organization!=""}{$reseller.organization|htmlentities} ({$reseller.username}){else}{$reseller.username}{/if}
			{/loop}
			</select>
		</td></tr>
		<tr><td><input type="radio" name="clientaction" value="delete"></td><td>{="Delete the client accounts"}</td></tr>
		</table>
		
		<br />
	{/check}

		<input type="hidden" name="page" value="manageaccount" />
		<input type="hidden" name="action" value="delete" />
		<input type="hidden" name="delusername" value="{$username|htmlentities}" />
		<input type="submit" name="confirm" value="{if $deletingreseller}{="Delete reseller account"}{else}{="Delete Account"}{/if}" />
		<input type="button" value="{="Cancel"}" onclick="window.location='index.php?page=accounts'; return false" />
	</form>	
{/box}
