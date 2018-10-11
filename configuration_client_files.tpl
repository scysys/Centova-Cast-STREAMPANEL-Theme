
<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td colspan="2">
	{="The introduction file is an audio file that is played immediately after each listener connects, before tuning in to the live stream."}  {="Note that this file must match the bit rate, sample rate, and number of channels configured for your stream."}<br /><br />
	</td>
</tr>
<tr>
	<td width="110">{="Introduction file"}:&nbsp;</td>
	<td>
		<input type="file" name="introfile" />
	</td>
</tr>
{if $config.introfile}
<tr>
	<td></td>
	<td>
		{="Currently"}: <strong>{$config.introfile|htmlentities}</strong><br />
		<input type="checkbox" name="removefile[introfile]" value="1" /> {="Remove introduction file"}
	</td>
</tr>
{/if}
<tr><td colspan="2"><br /><br /></td></tr>
<tr>
	<td colspan="2">
	{="The fallback file is an audio file that is played in a loop if the source stream disconnects."}  {="Note that this file must match the bit rate, sample rate, and number of channels configured for your stream."}<br /><br />
	</td>
</tr>
<tr>
	<td>{="Fallback file"}:</td>
	<td>
		<input type="file" name="fallbackfile" />
	</td>
</tr>
{if $config.fallbackfile}
<tr>
	<td></td>
	<td>
		{="Currently"}: <strong>{$config.fallbackfile|htmlentities}</strong><br />
		<input type="checkbox" name="removefile[fallbackfile]" value="1" /> {="Remove fallback file"}
	</td>
</tr>
{/if}

</table>
