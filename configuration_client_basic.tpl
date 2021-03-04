{css}
.m-portlet__head.sp-box-table {
background-color: #1E1E2D;
border-color: #1E1E2D;
}
.m-portlet__head-text.sp-box-table {
color: white !important;
}
.sp-dj-table-tr {
background-color: #1E1E2D;
border-color: #1E1E2D;
color: white;
}
.m-subheader {
display: none;
}
.m-portlet .m-portlet__body {
background-color: #fbfbfb;
}
a.spred {
    color: red;
}
.spred {
    color: red;
}
div#pagetabs {
    display: none;
}
.sphide {
    display: none;
}
li.m-portlet__nav-item.spwhite {
    color: white;
}
{/css}

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

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {="Settings"} </h3>
</div>
</div>
</div>
<div class="m-portlet__body">

{check $template_editor>0}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Template name"}</span>
</div>
<input class="form-control" type="text" name="config[templatename]" maxlength="255" value="{$config.templatename|htmlentities}" /> ({="letters and numbers only"})
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Template description"}</span>
</div>
<input class="form-control" type="text" name="config[templatetitle]" maxlength="255" value="{$config.templatetitle|htmlentities}" /> ({="for your reference only"})
</div>
{/check}

{if ($creating) && ($template_editor==0)}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Username"}</span>
</div>
<input class="form-control" type="text" name="config[username]" maxlength="20" value="{$config.username|htmlentities}" /> {$errors.username|checkerror}
</div>
{/if}

{if ($actual_privileged>0) && ($caps.suppress_hostname==0)}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Hostname"}</span>
</div>
<input class="form-control" type="text" name="config[hostname]" maxlength="255" value="{$config.hostname|htmlentities}" /> {$errors.hostname|checkerror}
</div>
{/if}

{check $caps.auto_ipport>0}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="IP address"}</span>
</div>
<input class="form-control" type="hidden" name="config[ipaddress]" value="{if $creating}auto{else}{$config.ipaddress|htmlentities}{/if}" />
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Port"}</span>
</div>
<input class="form-control" type="hidden" name="config[port]" value="{if $creating}auto{else}{$config.port|htmlentities}{/if}" />
</div>

{otherwisecheck $actual_admin}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="IP address"}</span>
</div>
<input class="form-control" type="text" name="config[ipaddress]" maxlength="15" value="{$config.ipaddress|htmlentities}" onfocus="field_tip(this,true,'iptip')" onblur="field_tip(this,false)" /> {$errors.ipaddress|checkerror}
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Port"}</span>
</div>
{if $template_editor}({="auto"}){else}<input class="form-control" type="text" name="config[port]" maxlength="5" value="{$config.port|htmlentities}" onfocus="field_tip(this,true,'porttip')" onblur="field_tip(this,false)"/>{/if} {$errors.port|checkerror}
</div>

{otherwisecheck $actual_privileged}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="IP address"}</span>
</div>
{if $creating}({="auto"}){else}{$config.ipaddress|htmlentities}{/if}
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Port"}</span>
</div>
{if ($creating) || ($template_editor)}({="auto"}){else}{$config.port|htmlentities}{/if}
</div>
{/check}

{check $template_editor==0}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Stream title"}</span>
</div>
<input class="form-control" type="text" name="config[title]" maxlength="255" value="{$config.title|htmlentities}" /> {$errors.title|checkerror}
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="E-mail address"}</span>
</div>
<input class="form-control" type="text" name="config[email]" maxlength="255" value="{$config.email|htmlentities}" /> {$errors.email|checkerror}
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Company/organization"}</span>
</div>
<input class="form-control" type="text" name="config[organization]" maxlength="255" value="{$config.organization|htmlentities}" /> {$errors.organization|checkerror}
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Website URL"}</span>
</div>
<input class="form-control" type="text" name="config[url]" maxlength="255" value="{$config.url|htmlentities}" /> {$errors.url|checkerror}
</div>

{if $caps.suppress_sourcepassword==0}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Source password"}</span>
</div>
<input class="form-control" type="password" name="config[sourcepassword]" maxlength="32" value="{$config.sourcepassword|htmlentities}" /> {$errors.sourcepassword|checkerror}
</div>
{/if}

<div class="input-group mb-6">
<div class="input-group-prepend">
<span class="input-group-text" id="help-spadmpw">{="Administrator password"}</span>
</div>
<input class="form-control" type="password" name="config[adminpassword]" id="help-spadmpw-text" aria-describedby="help-spadmpw" maxlength="32" value="{$config.adminpassword|htmlentities}" /> {$errors.adminpassword|checkerror}
</div>
<label for="help-spadmpw-text"><small><a href="https://www.streampanel.net/kb/centova-cast-passwort-vergessen-aendern/" target="_blank" rel="noopener" class="spred">{="We recommend you to only change your Administrator Password over our Customer Area!"} {="To learn how to change your Administrator / Login Password, click here."}</a></small></label>
{/check}

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Time zone"}</span>
</div>
<select class="form-control" name="config[timezone]">
<option value="127"{if $config.timezone==127} selected="selected"{/if}>{="Server default"} ({$defaulttimezone})</option>
{loop $description=$timezones}
<option value="{$_loop.key}"{if $_loop.key==$config.timezone} selected="selected"{/if}>{$description|htmlentities}</option>
{/loop}
</select>
</div>

<div class="input-group mb-6">
<div class="input-group-prepend">
<span class="input-group-text" id="help-splocale">{="Locale"}</span>
</div>
<select class="form-control" name="config[locale]" id="help-splocale-text" aria-describedby="help-splocale">
<option value=""{if $config.locale=""} selected="selected"{/if}>{="Server default"} - {$locales[$_CONSTANTS.LOCALE]} ({$_CONSTANTS.LOCALE})</option>
{loop $locale=$locales}
<option value="{$_loop.key}"{if $_loop.key==$config.locale} selected="selected"{/if}>{$locale} ({$_loop.key})</option>
{/loop}
</select>
</div>
<label for="help-splocale-text"><small class="spred">{="To apply the language changes, you must log out and log in again."}</small></label>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Character encoding"}</span>
</div>
<select class="form-control" name="config[charset]">
{loop $charset=$charsets}
<option value="{$_loop.key}"{if $_loop.key==$config.charset} selected="selected"{/if}>{$_loop.key}: {$charset}</option>
{/loop}
</select>
</div>

</div>
</div>
<!-- configuration_form.tpl -->