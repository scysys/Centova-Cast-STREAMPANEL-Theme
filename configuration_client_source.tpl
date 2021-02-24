{language}
set_autodj_mounts_title: '{="No autoDJ mount points"}',
set_autodj_mounts_content: '{="You currently have no autoDJ-based mount points configured."}  {="Be sure to configure at least one on the Mount Points tab, otherwise your autoDJ will not activate when the stream is started."}',
{/language}

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {="AutoDJ"} </h3>
</div>
</div>
<div class="m-portlet__head-tools">
<ul class="m-portlet__nav">
<li class="m-portlet__nav-item spwhite"> {="AutoDJ Software:&nbsp; %s%s%s","<strong>",$sourcetype,"</strong>"} </li>
</ul>
</div>
</div>
<div class="m-portlet__body">

<div class="input-group mb-6">
<div class="input-group-prepend">
<span class="input-group-text" id="help-spautodjstatus">{="AutoDJ status"}</span>
</div>
{check $stream_is_up>0}

<input class="form-control" type="hidden" name="config[usesource]" value="{$config.usesource|htmlentities}" id="help-spautodjstatus-text" aria-describedby="help-spautodjstatus" />
{otherwisecheck ($config.usesource==2) and ($actual_privileged==0)}
{="Disabled"}

{otherwise}
<select class="form-control" name="config[usesource]" id="config_usesource" id="help-spautodjstatus-text" aria-describedby="help-spautodjstatus">
{if $actual_privileged>0}<option value="2"{/if}{if ($config.usesource==2) && ($actual_privileged>0)} selected="selected"{/if}{if $actual_privileged>0}>{="Prohibited (stream MUST use an offsite source)"}</option>{/if}
<option value="1"{if $config.usesource==1} selected="selected"{/if}>{if $actual_privileged>0}{="Permitted and enabled"}{else}{="Enabled"}{/if}</option>
<option value="0"{if $config.usesource==0} selected="selected"{/if}>{if $actual_privileged>0}{="Permitted, but disabled"}{else}{="Disabled"}{/if}</option>
</select>
{/check}

{if $stream_is_up>0}<input class="form-control" disabled="disabled" value="{="cannot be modified while stream is online"}" />{/if}

<div class="input-group-append">
<span class="input-group-text">{if $config.usesource==2}{="Prohibited"}{elseif $config.usesource==1}{="Enabled"}{elseif $config.usesource==0}{="Disabled"}{/if}</span>
</div>

</div>
<label for="help-spautodjstatus-text"><small>{="If enabled, the stream cannot be started until at least one MP3 is uploaded and added to an active playlist."}</a></small></label>

{check ($scriptable_playlists>0) && ($autodj_caps|contains:royaltymode)}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Song title codes"}&nbsp;{tip type="icon"}{="If enabled, the autoDJ will include a small tracking code at the end of the song titles shown in your listeners' media players.  For example, instead of:<br /><br /><strong>Artist Name - Song Title</strong><br /><br />You might see the following instead:<br /><br /><strong>Artist Name - Song Title [C51B]</strong><br /><br />This helps ensure that correct album covers are displayed in Centova Cast, and allows detailed reports to be generated (on the 'Tracks' tab of the 'View Statistics' page) containing most of the information needed to make reports to the appropriate entities for royalty determination purposes.<br /><br />If this option is disabled, album cover accuracy may be reduced, and generated royalty reports will be much less detailed and may not contain sufficient information for royalty reporting purposes."}{/tip}</span>
</div>
<select class="form-control" name="config[royaltymode]">
<option value="0"{if $config.royaltymode==0} selected="selected"{/if}>{="Disabled"}</option>
<option value="1"{if $config.royaltymode>0} selected="selected"{/if}>{="Enabled"}</option>
</select>
</div>
{/check}

<!-- Not in use -->
{check $scriptable_playlists==0}
<table class="table">
<tr><td colspan="4" style="font-size: 4px">&nbsp;</td></tr>
<tr>
	<td>{="Rebuild playlist"}:&nbsp;</td>
	<td colspan="3">
		<select name="config[autorebuildlist]" size="1">
		<option value="1"{if $config.autorebuildlist>0} selected="selected"{/if}>{="Yes, rebuild playlist on each stream startup"}</option>
		<option value="0"{if $config.autorebuildlist==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
<tr>
<tr>
	<td>{="Randomize playlist"}:&nbsp;</td>
	<td colspan="3">
		<select name="config[randomplaylist]" size="1">
		<option value="1"{if $config.randomplaylist>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.randomplaylist==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
</tr>
</table>
{/check}

{check ($actual_privileged==0) and ($client_bitrate_modify>0) and ($icy_options>0)}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Bit rate"}</span>
</div>
<input class="form-control" type="text" name="config[maxbitrate]" maxlength="5" value="{$config.maxbitrate|htmlentities}" /> {$errors.maxbitrate|checkerror}
<div class="input-group-append">
<span class="input-group-text">{="Kbps"}</span>
</div>
</div>
{/check}

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Genre"}</span>
</div>
<input class="form-control" type="text" name="config[genre]" maxlength="127" value="{$config.genre|htmlentities}" /> {$errors.genre|checkerror}
</div>

{check $icy_options==0}
{otherwisecheck $encoder_settings==0}
{otherwisecheck ($actual_admin>0) or ($client_encoder_settings>0)}
{if $actual_admin>0}
<tr>
	<td colspan="4">
		{="Note: altering the channels, sample rate, or crossfade settings may significantly increase CPU usage."}<br /><br />
	</td>
</tr>
{/if}

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Channels"}</span>
</div>
<select class="form-control" name="config[channels]">
<option value="0"{if $config.channels==0} selected="selected"{/if}>{="Auto"}</option>
<option value="2"{if $config.channels>1} selected="selected"{/if}>{="Stereo"}</option>
<option value="1"{if $config.channels==1} selected="selected"{/if}>{="Mono"}</option>
</select>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Sample rate"}</span>
</div>
{* Note: You can add custom sample rates by simply appending them to *}
{* this list, separated by commas as shown. *}
{set $samplerates}8000,11025,22050,32000,44100,48000,88200,96000{/set}
	
<select name="config[samplerate]" class="form-control">
<option value="0"{if $config.samplerate==0} selected="selected"{/if}>{="Auto"}</option>
{loop $samplerate=$samplerates|explode:",":1000}
<option value="{$samplerate}"{if $config.samplerate==$samplerate} selected="selected"{/if}>{="%s Hz",$samplerate}</option>
{/loop}
</select> {$errors.samplerate|checkerror}
</div>
{/check}

{check $icy_options==0}
{otherwisecheck ($actual_admin>0) or ($client_encoder_settings>0)}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Crossfade length"}</span>
</div>
<input class="form-control" type="text" name="config[crossfade]" maxlength="5" value="{$config.crossfade|htmlentities}" /> {$errors.crossfade|checkerror}
<div class="input-group-append">
<span class="input-group-text">{="second(s)"} ({="0 to disable"})</span>
</div>
</div>
{/check}

</div>
</div>
