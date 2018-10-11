	<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">
	
	<div id="installtop"></div>
	<div id="installmiddle">

		Please fill out the following form to finish installing Centova Cast.<br /><br />
		
		{if $error}<div id="installerror">{$error|htmlentities|nl2br}</div>{/if}
		
		<table cellspacing="1" cellpadding="0" border="0" id="installtable">
		{check ($progress.config==0) || ($progress.db==0)}
		<tr><td colspan="2" style="font-weight: bold">Administrator Account</td></tr>
		<tr><td colspan="2" style="font-size: 2px">&nbsp;</td></tr>
		<tr><td width="150">{="Administrator E-mail address"}:&nbsp;</td><td><input type="text" name="settings[email]" value="{$settings.email|htmlentities}" size="30" maxlength="128" /></td></tr>
		<tr><td>{="Administrator password"}:</td><td><input type="password" name="settings[password1]" value="{$settings.password1|htmlentities}" size="12" maxlength="32" /></td></tr>
		<tr><td>{="Confirm password"}:</td><td><input type="password" name="settings[password2]" value="{$settings.password2|htmlentities}" size="12" maxlength="32" /></td></tr>
		<tr><td colspan="2" style="font-size: 8px">&nbsp;</td></tr>
		{/check}
		{check $dbinstalled==0}
		<tr><td colspan="2" style="font-size: 8px">&nbsp;</td></tr>
		<tr><td colspan="2" style="font-weight: bold">MySQL Database</td></tr>
		<tr><td colspan="2" style="font-size: 2px">&nbsp;</td></tr>
		<tr><td>{="Database name"}:</td><td><input type="text" name="settings[dbname]" value="{$settings.dbname|htmlentities}" size="20" maxlength="64" /></td></tr>
		<tr><td>{="MySQL username"}:</td><td><input type="text" name="settings[dbuser]" value="{$settings.dbuser|htmlentities}" size="20" maxlength="64" /></td></tr>
		<tr><td>{="MySQL password"}:</td><td><input type="password" name="settings[dbpass]" value="{$settings.dbpass|htmlentities}" size="20" maxlength="64" /></td></tr>
		<tr><td>{="MySQL hostname"}:</td><td><input type="text" name="settings[dbhost]" value="{if $settings.dbhost}{$settings.dbhost|htmlentities}{else}localhost{/if}" size="20" maxlength="64" /></td></tr>
		{/check}

		</table>
		
	</div>
	<div id="installbottom"></div>
	
	<br />

{loop $state=$progress}
<input type="hidden" name="progress[{$_loop.key}]" value="{$state}" />
{/loop}	
	<input type="hidden" name="step" value="settings" />
	<input type="submit" name="install" value="{="Next"} &gt;" />
	
	<br /><br />
	

	</form>
