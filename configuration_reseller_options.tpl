<h1>{="Branding"}</h1>

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td width="200">{="Sender E-mail address"}:</td>
	<td>
		<input type="text" name="config[resellersenderemail]" size="50" maxlength="255" value="{$config.resellersenderemail|htmlentities}" /> {$errors.resellersenderemail|checkerror}
	</td>
</tr>
<tr><td></td><td class="info">({="All outbound messages will use the above as a return address."})</td></tr>
{check $template_editor==0}
<tr>
	<td>{="Logo image"}:</td>
	<td>
        <input type="file" name="logofile" />
        {tip type="icon" title="Reseller logo"}{="If provided, this logo will be displayed in the upper-left corner of the control panel when any of your clients log in."}{/tip}
    </td>
</tr>
{if $config.logofile}
<tr>
	<td></td>
	<td>
		{="Custom logo is active."}<br />
		<input type="checkbox" name="removefile[logofile]" value="1" /> {="Remove logo image"}
	</td>
</tr>
{/if}
{/check}
</table>
<br />

<h1>{="General"}</h1>

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td width="200">{="Character encoding for new accounts"}:</td>
	<td>
		<select name="config[resellerdefcharset]" size="1">
		{loop $charset=$charsets}
		<option value="{$_loop.key}"{if $_loop.key==$config.resellerdefcharset} selected="selected"{/if}>{$_loop.key}: {$charset}</option>
		{/loop}
		</select>
	</td>
</tr>
</table>

<br />

<h1>{="Google Maps"}&reg;</h1>

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td width="200">{="Enable Google Maps%s widget","&reg;"}:</td>
	<td>
		<select name="config[allowgmaps]" size="1">
		<option value="1"{if $config.allowgmaps>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.allowgmaps==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
</tr>
<tr>
	<td width="200">{="Google Maps API Key"}:</td>
	<td><input type="text" name="config[resellergmapsapikey]" value="{$config.resellergmapsapikey|htmlentities}" size="40" maxlength="128" /></td>
</tr>
<tr>
	<td>{="Google Maps Client ID"}:</td>
	<td><input type="text" name="config[resellergmapsclientid]" value="{$config.resellergmapsclientid|htmlentities}" size="20" maxlength="128" /></td>
</tr>
</table>
