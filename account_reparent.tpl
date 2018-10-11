{box title="Reparent account"}
	<form method="get" action="index.php">
		
		{="Select a new reseller for account %s",$username|htmlentities}:<br /><br />
		
		<select name="targetreseller" size="1">
		<option value="0">{$settings.sitename} ({="no reseller"})</option>
		{loop $reseller=$otherresellers}
		<option value="{$reseller.id}">{if $reseller.organization!=""}{$reseller.organization|htmlentities} ({$reseller.username}){else}{$reseller.username}{/if}
		{/loop}
		</select>
		
		<br /><br />

		<input type="hidden" name="page" value="manageaccount" />
		<input type="hidden" name="action" value="reparent" />
		<input type="hidden" name="username" value="{$username|htmlentities}" />
		<input type="submit" name="confirm" value="{="Move account"}" />
		<input type="button" value="{="Cancel"}" onclick="window.location='index.php?page=accounts'; return false" />
	</form>	
{/box}