{resource type="js" src="/system/jquery.centova.tabset.js" depends="common"}

<div class="fstabset" id="widgets_tabs">

	<fieldset>
		<legend>{="General"}</legend>

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td>{="Activate start page"}:&nbsp;</td>
	<td>
		<select name="config[usestartpage]" size="1">
		<option value="1"{if $config.usestartpage>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.usestartpage==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
</tr>
<tr>
	<td>{="Enable on-demand content widget"}:&nbsp;</td>
	<td>
		<select name="config[allowondemand]" size="1">
		<option value="1"{if $config.allowondemand>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.allowondemand==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
</tr>
<tr>
	<td>{="Enable Google Maps%s widget","&reg;"}:&nbsp;</td>
	<td>
		<select name="config[allowgmaps]" size="1">
		<option value="1"{if $config.allowgmaps>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.allowgmaps==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
</tr>
<tr>
	<td></td>
	<td class="info">({="provides realtime geographic mapping of your listeners' locations"})</td>
</tr>
</table>

	</fieldset>
	<fieldset>
		<legend>{="Song Requests"}</legend>

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td>{="Enable song request widget"}:&nbsp;</td>
	<td>
		<select name="config[allowrequests]" size="1">
		<option value="1"{if $config.allowrequests>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.allowrequests==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
</tr>
<tr>
	<td>{="Automatically queue requests"}:&nbsp;</td>
	<td>
		<select name="config[autoqueuerequests]" size="1">
		<option value="1"{if $config.autoqueuerequests>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.autoqueuerequests==0} selected="selected"{/if}>{="No"}</option>
		</select>
		{tip type="icon"}{="If enabled, the requested song will be identified automatically (when possible) and added to the playback queue with no DJ intervention."}{/tip}
	</td>
</tr>
<tr>
	<td>{="Request delay"}:</td>
	<td>
		<input type="text" name="config[requestdelay]" size="4" maxlength="4" value="{$config.requestdelay|htmlentities}" /> {="minute(s)"} {$errors.requestdelay|checkerror}
		{tip type="icon"}{="Specifies the length of time to wait before queueing a requested song, as may be required by some music licensing authorities."}{/tip}
	</td>
</tr>
<tr>
	<td>{="Request probability"}:</td>
	<td>
		<input type="text" name="config[requestprobability]" size="4" maxlength="3" value="{$config.requestprobability|htmlentities}" /> {="percent (0-100)"} {$errors.requestprobability|checkerror}
		{tip type="icon"}{="This feature can be used to further delay the playback of a requested track by a random interval after it is queued.  Specifying 100 indicates that the track should be played immediately when the Request Delay expires; reducing the percentage will cause a further corresponding delay of a random number of songs."}{/tip}
	</td>
</tr>
<tr>
	<td>{="E-mail unknown requests"}:&nbsp;</td>
	<td>
		<select name="config[emailunknownrequests]" size="1">
		<option value="1"{if $config.emailunknownrequests>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.emailunknownrequests==0} selected="selected"{/if}>{="No"}</option>
		</select>
		{tip type="icon"}{="Specifies whether requests should be forwarded to the administrator if Automatically Queue Requests is enabled and the requested song cannot be automatically identified (due to a typo in the request, or the song being unavailable)."}{/tip}
	</td>
</tr>
</table>

	</fieldset>
	<fieldset>
		<legend>{="Recent Tracks"}</legend>

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td>{="Enable recent tracks widget"}:&nbsp;</td>
	<td>
		<select name="config[allowrecent]" size="1">
		<option value="1"{if $config.allowrecent>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.allowrecent==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
</tr>
<tr>
	<td>{="Number of recent tracks"}:</td>
	<td>
		<input type="text" name="config[recenttracks]" size="4" maxlength="3" value="{$config.recenttracks|htmlentities}" /> ({="maximum of %d",10}) {$errors.recenttracks|checkerror}
	</td>
</tr>
</table>

	</fieldset>
	<fieldset>
		<legend>{="Player"}</legend>

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td>{="Preferred web player"}:&nbsp;</td>
	<td>
		{check $webplayers|count>1}
		<select name="config[webplayer]" size="1">
		{loop $player=$webplayers}
			<option value="{$player}"{if $config.webplayer==$player} selected="selected"{/if}>{$player}</option>
		{/loop}
		</select>
		{otherwise}
		<strong>{$webplayers[0]}</strong>
		<input type="hidden" name="config[webplayer]" value="{$webplayers[0]}" />
		{/check}
	</td>
</tr>
</table>

	</fieldset>


</div>

<br />
{="The start page for this stream (if enabled) is available at: "}<br />
<a target="_blank" href="{$startpageurl}">{$startpageurl}</a>
	
	