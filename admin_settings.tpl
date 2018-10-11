{resource type="js" src="/system/jquery.centova.tabset.js" depends="common"}
{javascript}
<script>
function set_reencode(reencodeidx) {
	var el = document.getElementById('reencode_status');
	if (!el) return;

	var enabled = 1-el.selectedIndex;
	var reencode_elements = [ 'reencode_channels','reencode_samplerate','reencode_crossfade' ];
	for (var i=0; i<reencode_elements.length; i++) {
		el = document.getElementById(reencode_elements[i]);
		if (el) el.disabled = !enabled;
	}
}
</script>
{/javascript}
{onready}
<script>
	$('#settings_tabs').centovaTabSet();
	$('.fstabset').centovaTabSet({ tabclass: 'smalltabs' });
	set_reencode();
</script>
{/onready}

<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">

{check $successful}
{box title="Update Successful"}{="Settings updated successfully."}{/box}<br />
{otherwisecheck $failure}
{box title="Update Failed"}{if $failure_reason!=""}{$failure_reason|htmlentities}{else}{="An error occurred while attempting to save this update"}.{/if}{/box}<br />
{/check}

<div id="settings_tabs">

<fieldset>
	<legend>{="General"}</legend>
	
	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="150">{="Site name"}:</td>
		<td><input type="text" name="settings[sitename]" size="50" maxlength="255" value="{$settings.sitename|htmlentities}" /> {$errors.sitename|checkerror}</td>
	</tr>
	<tr>
		<td>{="Notification E-mail address"}:&nbsp;</td>
		<td>
			<input type="text" name="settings[notifyemail]" size="50" maxlength="255" value="{$settings.notifyemail|htmlentities}" /> {$errors.notifyemail|checkerror}
		</td>
	</tr>
	<tr><td></td><td class="info">{="Administrative notices will be sent to the above address."}</td></tr>
	<tr>
		<td>{="Sender E-mail address"}:</td>
		<td>
			<input type="text" name="settings[senderemail]" size="50" maxlength="255" value="{$settings.senderemail|htmlentities}" /> {$errors.senderemail|checkerror}
		</td>
	</tr>
	<tr><td></td><td class="info">({="All outbound messages will use the above as a return address."})</td></tr>
	</table>
</fieldset>


<fieldset>
	<legend>{="E-mail"}</legend>

	<div class="info">{="These settings are required if you want Centova Cast to send notification emails."}</div>
	<br />

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="220">{="SMTP server"}:</td>
		<td><input type="text" name="settings[smtphost]" value="{$settings.smtphost|htmlentities}" size="30" maxlength="128" /></td>
	</tr>
	<tr>
		<td>{="SMTP port"}:</td>
		<td><input type="text" name="settings[smtpport]" value="{$settings.smtpport|htmlentities}" size="6" maxlength="5" /></td>
	</tr>
	<tr>
		<td>{="SMTP username"}:</td>
		<td><input type="text" name="settings[smtpuser]" value="{$settings.smtpuser|htmlentities}" size="15" maxlength="128" /></td>
	</tr>
	<tr>
		<td>{="SMTP password"}:</td>
		<td><input type="password" name="settings[smtppass]" value="{$settings.smtppass|htmlentities}" size="15" maxlength="128" /></td>
	</tr>

	</table>
</fieldset>

<fieldset>
	<legend>{="Limits"}</legend>

	<h1>{="Transfer limits"}</h1>
	
	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="220">{="Notify clients and resellers via E-mail when"}:</td>
		<td>
			<input type="text" name="settings[xferwarning]" size="3" maxlength="2" value="{$settings.xferwarning|htmlentities}" />% {$errors.xferwarning|checkerror} {="of data transfer limit is reached"}
		</td>
	</tr>
	<tr>
		<td>{="When a client's transfer limit is exceeded"}:&nbsp;</td>
		<td>
			<select name="settings[xferexceed]" size="1">
			<option value="suspend"{if $settings.xferexceed=="suspend"} selected="selected"{/if}>{="Shutdown streaming server and suspend account"}</option>
			<option value="none"{if $settings.xferexceed=="none"} selected="selected"{/if}>{="Notify client and administrator but take no action"}</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>{="When a reseller's transfer limit is exceeded"}:&nbsp;</td>
		<td>
			<select name="settings[resellerxferexceed]" size="1">
			<option value="suspend"{if $settings.resellerxferexceed=="suspend"} selected="selected"{/if}>{="Suspend reseller and shutdown/suspend reseller's clients"}</option>
			<option value="none"{if $settings.resellerxferexceed=="none"} selected="selected"{/if}>{="Notify reseller and administrator but take no action"}</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>{="When an account has been suspended"}:&nbsp;</td>
		<td>
			<select name="settings[autounsuspend]" size="1">
			<option value="1"{if $settings.autounsuspend>0} selected="selected"{/if}>{="Automatically unsuspend it the following month"}</option>
			<option value="0"{if $settings.autounsuspend==0} selected="selected"{/if}>{="Leave it suspended until unsuspended by an administrator"}</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>{="Total data transfer limit for this server"}:</td>
		<td>
			<input type="text" name="settings[serverxferlimit]" size="10" maxlength="16" value="{$settings.serverxferlimit|htmlentities}" /> {$errors.serverxferlimit|checkerror} {="MB/month"}
		</td>
	</tr>
	<tr><td></td><td class="info">{="This is used only to display the server's data transfer usage graph on the administrator's accounts page."}</td></tr>
	</table>
	<br />

	<h1>{="Disk quota"}</h1>

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="220">{="Notify clients and resellers via E-mail when"}:</td>
		<td>
			<input type="text" name="settings[quotawarning]" size="3" maxlength="2" value="{$settings.quotawarning|htmlentities}" />% {$errors.quotawarning|checkerror} {="of disk quota is used"}
		</td>
	</tr>
	<tr>
		<td>{="When a client's disk quota is exceeded"}:&nbsp;</td>
		<td>
			<select name="settings[quotaexceed]" size="1">
			<option value="suspend"{if $settings.quotaexceed=="suspend"} selected="selected"{/if}>{="Shutdown streaming server and suspend account"}</option>
			<option value="none"{if $settings.quotaexceed=="none"} selected="selected"{/if}>{="Notify client and administrator but take no action"}</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>{="When a reseller's disk quota is exceeded"}:&nbsp;</td>
		<td>
			<select name="settings[resellerquotaexceed]" size="1">
			<option value="suspend"{if $settings.resellerquotaexceed=="suspend"} selected="selected"{/if}>{="Suspend reseller and shutdown/suspend reseller's clients"}</option>
			<option value="none"{if $settings.resellerquotaexceed=="none"} selected="selected"{/if}>{="Notify reseller and administrator but take no action"}</option>
			</select>
		</td>
	</tr>

	</table>
	<br />

	<h1>{="Logins"}</h1>

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="220">{="Login failures"}:</td>
		<td>
			{setlangfields name="logins"}{="After %s failed logins in %s minute(s), ban the user for %s minute(s)"}{/setlangfields}
			{getlangfield name="logins" index="1"}<input type="text" name="settings[maxfailedlogins]" size="3" maxlength="3" value="{$settings.maxfailedlogins|htmlentities}" /> {$errors.maxfailedlogins|checkerror}
			{getlangfield name="logins" index="2"}<input type="text" name="settings[maxfailedtime]" size="3" maxlength="3" value="{$settings.maxfailedtime|htmlentities}" /> {$errors.maxfailedtime|checkerror}
			{getlangfield name="logins" index="3"}<input type="text" name="settings[loginbantime]" size="4" maxlength="4" value="{$settings.loginbantime|htmlentities}" /> {$errors.loginbantime|checkerror}
			{getlangfield name="logins" index="4"}
		</td>
	</tr>

	</table>
	
</fieldset>

<fieldset>
	<legend>{="Defaults"}</legend>

	<h1>{="General"}</h1>
	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="220">{="Port range for new servers"}:</td>
		<td>
			<input type="text" name="settings[portrangemin]" size="5" maxlength="5" value="{$settings.portrangemin|htmlentities}" /> -
			<input type="text" name="settings[portrangemax]" size="5" maxlength="5" value="{$settings.portrangemax|htmlentities}" />
		</td>
	</tr>
	<tr>
		<td>{="Default character encoding for new servers"}:</td>
		<td>
			<select name="settings[defaultcharset]" size="1">
			{loop $charset=$charsets}
			<option value="{$_loop.key}"{if $_loop.key==$settings.defaultcharset} selected="selected"{/if}>{$_loop.key}: {$charset}</option>
			{/loop}
			</select>
		</td>
	</tr>
	</table>
	<br />

	<h1>{="AutoDJ"}</h1>

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="220">{="Enable re-encoding on new servers"}:</td>
		<td>
			<select name="settings[defaultreencode]" size="1" onchange="set_reencode()" id="reencode_status">
			<option value="1"{if $settings.defaultreencode>0} selected="selected"{/if}>{="Yes, re-encode media to stream bit rate"}</option>
			<option value="0"{if $settings.defaultreencode==0} selected="selected"{/if}>{="No, disable re-encoding (if supported by source)"}</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>{="Default channels for re-encoding"}:&nbsp;</td>
		<td>
			<select name="settings[defaultchannels]" size="1" id="reencode_channels">
			<option value="2"{if $settings.defaultchannels>1} selected="selected"{/if}>{="Stereo"}</option>
			<option value="1"{if $settings.defaultchannels==1} selected="selected"{/if}>{="Mono"}</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>{="Default sample rate for re-encoding"}:&nbsp;</td>
		<td>
			{* Note: You can add custom sample rates by simply appending them to *}
			{* this list, separated by commas as shown. *}
			{set $samplerates}8000,11025,22050,32000,44100,48000,88200,96000{/set}

			<select name="settings[defaultsamplerate]" size="1" id="reencode_samplerate">
			{loop $samplerate=$samplerates|explode:",":1000}
			<option value="{$samplerate}"{if $settings.defaultsamplerate==$samplerate} selected="selected"{/if}>{="%s Hz",$samplerate}</option>
			{/loop}
			</select> {$errors.samplerate|checkerror}
		</td>
	</tr>
	<tr>
		<td>{="Default crossfade length for re-encoding"}:&nbsp;</td>
		<td><input id="reencode_crossfade" type="text" name="settings[defaultcrossfade]" size="5" maxlength="5" value="{$settings.defaultcrossfade|htmlentities}" /> {$errors.crossfade|checkerror} {="second(s)"} ({="0 to disable"})</td>
	</tr>
	</table>
</fieldset>

<fieldset>
	<legend>{="Features"}</legend>

	<h1>{="General"}</h1>

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="220">{="Allow server log downloads"}:&nbsp;</td>
		<td>
			<select name="settings[allowlogdownload]" size="1">
			<option value="0"{if $settings.allowlogdownload==0} selected="selected"{/if}>{="No"}</option>
			<option value="1"{if $settings.allowlogdownload>0} selected="selected"{/if}>{="Yes"}</option>
			</select>
		</td>
	</tr>
	<tr><td></td><td class="info">{="Allows users to download their streaming server/source logs in ZIP or tarball format.  Note that log compression is very CPU-intensive."}</td></tr>
		<tr>
			<td>{="Provide stream directory"}:&nbsp;</td>
			<td>
				<select name="settings[allowstreamlist]" size="1">
				<option value="0"{if $settings.allowstreamlist==0} selected="selected"{/if}>{="No"}</option>
				<option value="1"{if $settings.allowstreamlist>0} selected="selected"{/if}>{="Yes"}</option>
				</select>
			</td>
		</tr>
		<tr><td></td><td class="info">{="Enables a widget which provides a directory of all streams hosted in Centova Cast."}</td></tr>

	</table>

	<h1>{="Google Maps"}&reg;</h1>

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td width="200">{="Enable Google Maps%s widget","&reg;"}:</td>
		<td>
			<select name="settings[allowgmaps]" size="1">
			<option value="1"{if $settings.allowgmaps>0} selected="selected"{/if}>{="Yes"}</option>
			<option value="0"{if $settings.allowgmaps==0} selected="selected"{/if}>{="No"}</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="220">{="Google Maps API Key"}:</td>
		<td><input type="text" name="settings[gmapsapikey]" value="{$settings.gmapsapikey|htmlentities}" size="40" maxlength="128" /></td>
	</tr>
	<tr>
		<td>{="Google Maps Client ID"}:</td>
		<td><input type="text" name="settings[gmapsclientid]" value="{$settings.gmapsclientid|htmlentities}" size="20" maxlength="128" /></td>
	</tr>
	</table>

</fieldset>

<fieldset>
	<legend>{="Albums"}</legend>

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td>{="Import album cover images when available"}:&nbsp;</td>
		<td>
			<select name="settings[importimages]" size="1">
			<option value="1"{if $settings.importimages>0} selected="selected"{/if}>{="Yes"}</option>
			<option value="0"{if $settings.importimages==0} selected="selected"{/if}>{="No"}</option>
			</select>
		</td>
	</tr>
	</table>

	<br />

	<div class="fstabset">
	{$adsforms}
	</div>

	<div class="info" style="margin-top: 8px">
	{="Album covers are shown in the media library and on the recent tracks list. %sClick here%s for more information.","<a style='color: #909090' href='http://www.centova.com/pages/faqs/display/can_i_display_my_own_cover_art_94' target='_blank'>","</a>"}
	</div>
</fieldset>

<fieldset>
	<legend>{="Legacy SSO"}</legend>

	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
		<td colspan="2" width="350">
			<strong>Deprecated:</strong> This setting is used to configure Centova Cast v2-style, legacy single sign-on.  This has been deprecated in favor of v3's clustering functionality, and should not normally be used.
			<br /><br />
		</td>
	</tr>
	<tr>
		<td width="220">{="Allow this server to be controlled remotely"}:&nbsp;</td>
		<td>
			<select name="settings[allowsso]" size="1">
			<option value="0"{if $settings.allowsso==0} selected="selected"{/if}>{="No"}</option>
			<option value="1"{if $settings.allowsso>0} selected="selected"{/if}>{="Yes"}</option>
			</select>
		</td>
	</tr>
<!--
	<tr>
		<td>{="Provisioning server for API clustering"}:&nbsp;</td>
		<td>
			<select name="settings[apiclusterdefault]" size="1">
			<option value="-1"{if $settings.apiclusterdefault<0} selected="selected"{/if}>{="The server with the fewest accounts"}</option>
			<option value="0"{if $settings.apiclusterdefault==0} selected="selected"{/if}>{="This server (%s)",$_SERVER.HTTP_HOST}</option>
			{loop $remoteserver=$remoteservers}
			<option value="{$remoteserver.id}"{if $settings.apiclusterdefault==$remoteserver.id} selected="selected"{/if}>{="Server %s",$remoteserver.title}</option>
			{/loop}
			</select>
		</td>
	</tr>
	<tr><td></td><td class="info">{="This setting is used only when API clustering is enabled, and does not affect accounts created manually."}</td></tr>
-->
	</table>
</fieldset>

</div>


<br />

<div style="float: right">
<input type="submit" name="emailtest" value="{="E-mail test"}" />
<input type="button" value="{="Change administrator password"}" onclick="window.location='index.php?page=adminpassword'" />
</div>

<input type="submit" name="update" value="{="Update"}" />
</form>
