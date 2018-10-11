{onready}
$('.fstabset').centovaTabSet({ tabclass: 'smalltabs' });
{/onready}
<table cellspacing="1" cellpadding="0" border="0">
{if ($creating) and ($template_editor==0)}
<tr>
	<td>{="Username"}:</td>
	<td colspan="2"><input type="text" name="config[username]" size="12" maxlength="20" value="{$config.username|htmlentities}" /> {$errors.username|checkerror}</td>
</tr>
<tr>
	<td>{="Password"}:</td>
	<td colspan="2"><input type="password" name="config[adminpassword]" size="15" maxlength="32" value="{$config.adminpassword|htmlentities}" /> {$errors.adminpassword|checkerror}</td>
</tr>
{/if}
{check $template_editor==0}
<tr>
	<td width="130">{="E-mail address"}:</td>
	<td colspan="2"><input type="text" name="config[email]" size="50" maxlength="255" value="{$config.email|htmlentities}" /> {$errors.email|checkerror}</td>
</tr>
<tr>
	<td>{="Company/organization"}:</td>
	<td colspan="2"><input type="text" name="config[organization]" size="50" maxlength="255" value="{$config.organization|htmlentities}" /> {$errors.organization|checkerror}</td>
</tr>
{otherwise}
<tr>
	<td width="130">{="Template name"}:</td>
	<td colspan="4"><input type="text" name="config[templatename]" size="32" maxlength="255" value="{$config.templatename|htmlentities}" /> ({="letters and numbers only"})
</tr>
<tr>
	<td width="130">{="Template description"}:</td>
	<td colspan="4"><input type="text" name="config[templatetitle]" size="30" maxlength="255" value="{$config.templatetitle|htmlentities}" /> ({="for your reference only"})
</tr>
{/check}

<tr><td colspan="3"><br /></td></tr>
<tr>
	<td>{="Time zone"}:</td>
	<td colspan="2">
		<select name="config[timezone]" size="1">
		<option value="127"{if $config.timezone==127} selected="selected"{/if}>{="Server default"} ({$defaulttimezone})</option>
		{loop $description=$timezones}
		<option value="{$_loop.key}"{if $_loop.key==$config.timezone} selected="selected"{/if}>{$description|htmlentities}</option>
		{/loop}
		</select>
	</td>
</tr>
<tr>
	<td>{="Locale"}:&nbsp;</td>
	<td colspan="4">
		<select name="config[locale]" size="1">
		<option value=""{if $config.locale=""} selected="selected"{/if}>{="Server default"} - {$locales[$_CONSTANTS.LOCALE]} ({$_CONSTANTS.LOCALE})</option>
		{loop $locale=$locales}
		<option value="{$_loop.key}"{if $_loop.key==$config.locale} selected="selected"{/if}>{$locale} ({$_loop.key})</option>
		{/loop}
		</select>
	</td>
</tr>
<tr>
	<td>{="Character encoding"}:</td>
	<td colspan="2">
		<select name="config[charset]" size="1">
		{loop $charset=$charsets}
		<option value="{$_loop.key}"{if $_loop.key==$config.charset} selected="selected"{/if}>{$_loop.key}: {$charset|htmlentities}</option>
		{/loop}
		</select>
	</td>
</tr>

</table>
