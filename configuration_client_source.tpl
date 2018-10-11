{language}
set_autodj_mounts_title: '{="No autoDJ mount points"}',
set_autodj_mounts_content: '{="You currently have no autoDJ-based mount points configured."}  {="Be sure to configure at least one on the Mount Points tab, otherwise your autoDJ will not activate when the stream is started."}',
{/language}
{if $actual_privileged>0}
<div style="float: right; color: #808080; margin-left: 15px">{="Source software: %s%s%s","<strong>",$sourcetype,"</strong>"}</div>
{/if}
<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td width="140">{="AutoDJ status"}:&nbsp;</td>
	<td colspan="3">
		{check $stream_is_up>0}
			{if $config.usesource==2}{="Prohibited"}
			{elseif $config.usesource==1}{="Enabled"}
			{elseif $config.usesource==0}{="Disabled"}{/if}
			<input type="hidden" name="config[usesource]" value="{$config.usesource|htmlentities}" />

		{otherwisecheck ($config.usesource==2) and ($actual_privileged==0)}
			{="Disabled"}
		{otherwise}
			<select name="config[usesource]" id="config_usesource" size="1">
			{if $actual_privileged>0}<option value="2"{/if}{if ($config.usesource==2) && ($actual_privileged>0)} selected="selected"{/if}{if $actual_privileged>0}>{="Prohibited (stream MUST use an offsite source)"}</option>{/if}
			<option value="1"{if $config.usesource==1} selected="selected"{/if}>{if $actual_privileged>0}{="Permitted and enabled"}{else}{="Enabled"}{/if}</option>
			<option value="0"{if $config.usesource==0} selected="selected"{/if}>{if $actual_privileged>0}{="Permitted, but disabled"}{else}{="Disabled"}{/if}</option>
			</select>
		{/check}
		{if $stream_is_up>0} ({="cannot be modified while stream is online"}){/if}
		
		{check $actual_privileged>0}
		{tip type="icon"}{="If enabled, the stream cannot be started until at least one MP3 is uploaded and added to an active playlist."}{/tip}
		{/check}
		
	</td>
</tr>
{check ($scriptable_playlists>0) && ($autodj_caps|contains:royaltymode)}
<tr>
	<td>{="Song title codes"}:&nbsp;</td>
	<td colspan="3">
		<select name="config[royaltymode]" size="1">
		<option value="0"{if $config.royaltymode==0} selected="selected"{/if}>{="Disabled"}</option>
		<option value="1"{if $config.royaltymode>0} selected="selected"{/if}>{="Enabled"}</option>
		</select> {tip type="icon"}{="If enabled, the autoDJ will include a small tracking code at the end of the song titles shown in your listeners' media players.  For example, instead of:<br /><br /><strong>Artist Name - Song Title</strong><br /><br />You might see the following instead:<br /><br /><strong>Artist Name - Song Title [C51B]</strong><br /><br />This helps ensure that correct album covers are displayed in Centova Cast, and allows detailed reports to be generated (on the 'Tracks' tab of the 'View Statistics' page) containing most of the information needed to make reports to the appropriate entities for royalty determination purposes.<br /><br />If this option is disabled, album cover accuracy may be reduced, and generated royalty reports will be much less detailed and may not contain sufficient information for royalty reporting purposes."}{/tip}
	</td>
</tr>
{/check}
{check $scriptable_playlists==0}
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
{/check}
<tr><td colspan="4" style="font-size: 4px">&nbsp;</td></tr>
{check ($actual_privileged==0) and ($client_bitrate_modify>0) and ($icy_options>0)}
<tr>
	<td>{="Bit rate"}:&nbsp;</td>
	<td colspan="3"><input type="text" name="config[maxbitrate]" size="5" maxlength="5" value="{$config.maxbitrate|htmlentities}" /> {="Kbps"} {$errors.maxbitrate|checkerror}</td>
</tr>
{/check}
<tr>
	<td>{="Genre"}:&nbsp;</td>
	<td colspan="3"><input type="text" name="config[genre]" size="30" maxlength="127" value="{$config.genre|htmlentities}" /> {$errors.genre|checkerror}</td>
</tr>

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
<tr>
	<td>{="Channels"}:&nbsp;</td>
	<td colspan="3">
		<select name="config[channels]" size="1">
		<option value="0"{if $config.channels==0} selected="selected"{/if}>{="Auto"}</option>
		<option value="2"{if $config.channels>1} selected="selected"{/if}>{="Stereo"}</option>
		<option value="1"{if $config.channels==1} selected="selected"{/if}>{="Mono"}</option>
		</select>
	</td>
</tr>
<tr>
	<td>{="Sample rate"}:&nbsp;</td>
	<td colspan="3">
		{* Note: You can add custom sample rates by simply appending them to *}
		{* this list, separated by commas as shown. *}
		{set $samplerates}8000,11025,22050,32000,44100,48000,88200,96000{/set}
		
		<select name="config[samplerate]" size="1">
		<option value="0"{if $config.samplerate==0} selected="selected"{/if}>{="Auto"}</option>
		{loop $samplerate=$samplerates|explode:",":1000}
		<option value="{$samplerate}"{if $config.samplerate==$samplerate} selected="selected"{/if}>{="%s Hz",$samplerate}</option>
		{/loop}
		</select> {$errors.samplerate|checkerror}
	</td>
</tr>
{/check}

{check $icy_options==0}
{otherwisecheck ($actual_admin>0) or ($client_encoder_settings>0)}
<tr>
	<td>{="Crossfade length"}:&nbsp;</td>
	<td colspan="3"><input type="text" name="config[crossfade]" size="5" maxlength="5" value="{$config.crossfade|htmlentities}" /> {$errors.crossfade|checkerror} {="second(s)"} ({="0 to disable"})</td>
</tr>
{/check}
</table>
