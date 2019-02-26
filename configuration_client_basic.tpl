{javascript}<script>
function field_tip(anchor,show,id) {
	if (show) {
		$(anchor).centovaTip({
			content: $('#'+id),
			delay: 0,
			immediate: true
		});
	} else {
		$(anchor).centovaTip(false);
	}
}

function update_limits() {
	var dq = document.getElementById('diskquota');
	var ndq = document.getElementById('nodiskquota');
	var tl = document.getElementById('transferlimit');
	var ntl = document.getElementById('noxferlimit');
	
	if (dq) dq.disabled = (ndq && ndq.checked);
	if (tl) tl.disabled = (ntl && ntl.checked);
	
}
</script>{/javascript}
{onready}
	$('.fstabset').centovaTabSet({ tabclass: 'smalltabs' });
	update_limits();
{/onready}

<div class="ctip" id="iptip">
	<h1>{="IP address"}</h1>
	{="Set this to 'auto' (recommended) to use the default IP address configured for the target host."}
</div>
<div class="ctip" id="porttip">
	<h1>{="Port"}</h1>
	{="Set this to 'auto' (recommended) to automatically choose an available port from the target host.  Note that specifying a port that is already in use will cause the stream to fail to start."}
</div>

{if $_CONSTANTS.DEV_MODE}
<input type="button" value="Debug Population" id="debugpopbtn" style="float: right" />
<script language="javascript">
$(function(){
	$('#debugpopbtn').click(function(){
		var vals = {
			username: 'dbgtest', 
			title: 'Example stream',
			email: 'example@example.com',
			organization: 'Example',
			sourcepassword: 'testing',
			adminpassword: 'testing'
		}
		for (var v in vals) {
			$('input[name=config\['+v+'\]]').val(vals[v]);
		}
		$('select[name=config\[usesource\]]').setSelectedOption('1');
	});
});
</script>
{/if}

<table cellspacing="1" cellpadding="0" border="0">
{check $template_editor>0}
<tr>
	<td width="130">{="Template name"}:</td>
	<td colspan="4"><input type="text" name="config[templatename]" size="32" maxlength="255" value="{$config.templatename|htmlentities}" /> ({="letters and numbers only"})
</tr>
<tr>
	<td width="130">{="Template description"}:</td>
	<td colspan="4"><input type="text" name="config[templatetitle]" size="30" maxlength="255" value="{$config.templatetitle|htmlentities}" /> ({="for your reference only"})
</tr>

<tr><td colspan="5"><br /></td></tr>
{/check}
{if ($creating) && ($template_editor==0)}
<tr>
	<td>{="Username"}:</td>
	<td colspan="4">
		<input type="text" name="config[username]" size="12" maxlength="20" value="{$config.username|htmlentities}" /> {$errors.username|checkerror}
	</td>
</tr>
{/if}
{if ($actual_privileged>0) && ($caps.suppress_hostname==0)}
<tr>
	<td>{="Hostname"}:</td>
	<td colspan="4">
		<div style="float: right; color: #808080; margin-left: 15px">{="Server software"}: <strong>{$servertype.title}</strong></div>
		<input type="text" name="config[hostname]" size="35" maxlength="255" value="{$config.hostname|htmlentities}" /> {$errors.hostname|checkerror}
	</td>
</tr>
{/if}
{check $caps.auto_ipport>0}
<input type="hidden" name="config[ipaddress]" value="{if $creating}auto{else}{$config.ipaddress|htmlentities}{/if}" />
<input type="hidden" name="config[port]" value="{if $creating}auto{else}{$config.port|htmlentities}{/if}" />
{otherwisecheck $actual_admin}
<tr>
	<td>{="IP address"}:</td>
	<td><input type="text" name="config[ipaddress]" size="16" maxlength="15" value="{$config.ipaddress|htmlentities}" onfocus="field_tip(this,true,'iptip')" onblur="field_tip(this,false)" /> {$errors.ipaddress|checkerror}</td>
	<td width="40">{="Port"}:</td>
	<td colspan="2">{if $template_editor}({="auto"}){else}<input type="text" name="config[port]" size="6" maxlength="5" value="{$config.port|htmlentities}" onfocus="field_tip(this,true,'porttip')" onblur="field_tip(this,false)"/>{/if} {$errors.port|checkerror}</td>
</tr>
{otherwisecheck $actual_privileged}
<tr>
	<td>{="IP address"}:</td>
	<td style="font-weight: bold; padding: 3px">{if $creating}({="auto"}){else}{$config.ipaddress|htmlentities}{/if}</td>
	<td width="40">{="Port"}:</td>
	<td style="font-weight: bold; padding: 3px" colspan="2">{if ($creating) || ($template_editor)}({="auto"}){else}{$config.port|htmlentities}{/if}</td>
</tr>
{/check}

{if $actual_privileged}
<tr><td colspan="5"><br /></td></tr>
{/if}

{check $template_editor==0}
<tr>
	<td width="130">{="Stream title"}</td>
	<td colspan="4"><input type="text" name="config[title]" size="50" maxlength="255" value="{$config.title|htmlentities}" /> {$errors.title|checkerror}</td>
</tr>
<tr>
	<td width="130">{="E-mail address"}</td>
	<td colspan="4"><input type="text" name="config[email]" size="50" maxlength="255" value="{$config.email|htmlentities}" /> {$errors.email|checkerror}</td>
</tr>
<tr>
	<td>{="Company/organization"}</td>
	<td colspan="4"><input type="text" name="config[organization]" size="50" maxlength="255" value="{$config.organization|htmlentities}" /> {$errors.organization|checkerror}</td>
</tr>
<tr>
	<td>{="Website URL"}</td>
	<td colspan="4"><input type="text" name="config[url]" size="50" maxlength="255" value="{$config.url|htmlentities}" /> {$errors.url|checkerror}</td>
</tr>
<tr><td colspan="5"><br /></td></tr>
{if $caps.suppress_sourcepassword==0}
<tr>
	<td>{="Source password"}</td>
	<td colspan="4"><input type="password" name="config[sourcepassword]" size="15" maxlength="32" value="{$config.sourcepassword|htmlentities}" /> {$errors.sourcepassword|checkerror}</td>
</tr>
{/if}
<tr>
	<td>{="Administrator password"}</td>
	<td colspan="4"><input type="password" name="config[adminpassword]" size="15" maxlength="32" value="{$config.adminpassword|htmlentities}" /> {$errors.adminpassword|checkerror}
	<small><a href="https://www.streampanel.net/kb/centova-cast-passwort-vergessen-aendern/" target="_blank">{="We recommend you to only change your Administrator Password over our Customer Area!"} {="To learn how to change your Administrator / Login Password, click here."}</a></small>
	</td>
</tr>
<tr><td colspan="5"><br /></td></tr>
{/check}
<tr>
	<td>{="Time zone"}</td>
	<td colspan="4">
		<select name="config[timezone]" size="1">
		<option value="127"{if $config.timezone==127} selected="selected"{/if}>{="Server default"} ({$defaulttimezone})</option>
		{loop $description=$timezones}
		<option value="{$_loop.key}"{if $_loop.key==$config.timezone} selected="selected"{/if}>{$description|htmlentities}</option>
		{/loop}
		</select>
	</td>
</tr>
<tr>
	<td>{="Locale"}</td>
	<td colspan="4">
		<select name="config[locale]" size="1">
		<option value=""{if $config.locale=""} selected="selected"{/if}>{="Server default"} - {$locales[$_CONSTANTS.LOCALE]} ({$_CONSTANTS.LOCALE})</option>
		{loop $locale=$locales}
		<option value="{$_loop.key}"{if $_loop.key==$config.locale} selected="selected"{/if}>{$locale} ({$_loop.key})</option>
		{/loop}
		</select>
		<small>{="To apply the language changes, you must log out and log in again."}</small>
	</td>
</tr>
<tr>
	<td>{="Character encoding"}</td>
	<td colspan="4">
		<select name="config[charset]" size="1">
		{loop $charset=$charsets}
		<option value="{$_loop.key}"{if $_loop.key==$config.charset} selected="selected"{/if}>{$_loop.key}: {$charset}</option>
		{/loop}
		</select>
	</td>
</tr>
</table>
