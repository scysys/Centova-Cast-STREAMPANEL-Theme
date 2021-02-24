{resource type="js" src="/system/jquery.centova.tabset.js" depends="common"}

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {="Widgets"} </h3>
</div>
</div>
</div>
<div class="m-portlet__body">

<div class="fstabset" id="widgets_tabs">
<fieldset>
<legend>{="General"}</legend>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Activate start page"}</span>
</div>
<select name="config[usestartpage]" class="form-control">
<option value="1"{if $config.usestartpage>0} selected="selected"{/if}>{="Yes"}</option>
<option value="0"{if $config.usestartpage==0} selected="selected"{/if}>{="No"}</option>
</select>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Enable on-demand content widget"}</span>
</div>
<select name="config[allowondemand]" class="form-control">
<option value="1"{if $config.allowondemand>0} selected="selected"{/if}>{="Yes"}</option>
<option value="0"{if $config.allowondemand==0} selected="selected"{/if}>{="No"}</option>
</select>
</div>

<div class="input-group mb-6">
<div class="input-group-prepend">
<span class="input-group-text" id="help-spgooglemapswidget">{="Enable Google Maps%s widget","&reg;"}</span>
</div>
<select name="config[allowgmaps]" class="form-control" id="help-spgooglemapswidget-text" aria-describedby="help-spgooglemapswidget">
<option value="1"{if $config.allowgmaps>0} selected="selected"{/if}>{="Yes"}</option>
<option value="0"{if $config.allowgmaps==0} selected="selected"{/if}>{="No"}</option>
</select>
</div>
<label for="help-spgooglemapswidget-text"><small>{="provides realtime geographic mapping of your listeners' locations"}</small></label>

</fieldset>
<fieldset>
<legend>{="Song Requests"}</legend>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Enable song request widget"}</span>
</div>
<select name="config[allowrequests]" class="form-control">
<option value="1"{if $config.allowrequests>0} selected="selected"{/if}>{="Yes"}</option>
<option value="0"{if $config.allowrequests==0} selected="selected"{/if}>{="No"}</option>
</select>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Automatically queue requests"}&nbsp;{tip type="icon"}{="If enabled, the requested song will be identified automatically (when possible) and added to the playback queue with no DJ intervention."}{/tip}</span>
</div>
<select name="config[autoqueuerequests]" class="form-control">
<option value="1"{if $config.autoqueuerequests>0} selected="selected"{/if}>{="Yes"}</option>
<option value="0"{if $config.autoqueuerequests==0} selected="selected"{/if}>{="No"}</option>
</select>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Request delay"}&nbsp;{tip type="icon"}{="Specifies the length of time to wait before queueing a requested song, as may be required by some music licensing authorities."}{/tip}</span>
</div>
<input type="text" name="config[requestdelay]" class="form-control" maxlength="4" value="{$config.requestdelay|htmlentities}" /> {$errors.requestdelay|checkerror}
<div class="input-group-append">
<span class="input-group-text">{="minute(s)"}</span>
</div>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Request probability"}&nbsp;{tip type="icon"}{="This feature can be used to further delay the playback of a requested track by a random interval after it is queued.  Specifying 100 indicates that the track should be played immediately when the Request Delay expires; reducing the percentage will cause a further corresponding delay of a random number of songs."}{/tip}</span>
</div>
<input type="text" name="config[requestprobability]" class="form-control" maxlength="3" value="{$config.requestprobability|htmlentities}" /> {$errors.requestprobability|checkerror}
<div class="input-group-append">
<span class="input-group-text">{="percent (0-100)"}</span>
</div>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="E-mail unknown requests"}&nbsp;{tip type="icon"}{="Specifies whether requests should be forwarded to the administrator if Automatically Queue Requests is enabled and the requested song cannot be automatically identified (due to a typo in the request, or the song being unavailable)."}{/tip}</span>
</div>
<select name="config[emailunknownrequests]" class="form-control">
<option value="1"{if $config.emailunknownrequests>0} selected="selected"{/if}>{="Yes"}</option>
<option value="0"{if $config.emailunknownrequests==0} selected="selected"{/if}>{="No"}</option>
</select>
</div>

</fieldset>
<fieldset>
<legend>{="Recent Tracks"}</legend>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Enable recent tracks widget"}</span>
</div>
<select name="config[allowrecent]" class="form-control">
<option value="1"{if $config.allowrecent>0} selected="selected"{/if}>{="Yes"}</option>
<option value="0"{if $config.allowrecent==0} selected="selected"{/if}>{="No"}</option>
</select>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Number of recent tracks"}</span>
</div>
<input type="text" name="config[recenttracks]" class="form-control" maxlength="3" value="{$config.recenttracks|htmlentities}" /> {$errors.recenttracks|checkerror}
<div class="input-group-append">
<span class="input-group-text">{="maximum of %d",10}</span>
</div>
</div>

</fieldset>
<fieldset>
<legend>{="Player"}</legend>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Preferred web player"}&nbsp;{tip type="icon"}{="Use jPlayer for a working HTML5 Player."}{/tip}</span>
</div>
{check $webplayers|count>1}
<select name="config[webplayer]" class="form-control">
{loop $player=$webplayers}
<option value="{$player}"{if $config.webplayer==$player} selected="selected"{/if}>{$player}</option>
{/loop}
</select>
{otherwise}
<strong>{$webplayers[0]}</strong>
<input type="hidden" name="config[webplayer]" value="{$webplayers[0]}" />
{/check}
</div>

</fieldset>
</div>
	
</div>
</div>
