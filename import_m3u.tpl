<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}" enctype="multipart/form-data">

{box title="Import M3U playlist"}

{="Select an M3U playlist file to upload below.  Imported tracks will be added to the selected target playlist."}<br /><br />

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td width="150">{="Target playlist"}:&nbsp;</td>
	<td><strong>{$playlist.title|htmlentities}</strong></td>
</tr>
<tr><td colspan="2"><br /></td></tr>
<tr>
	<td>{="M3U playlist file"}:&nbsp;</td>
	<td><input type="file" name="m3ufile" /></td>
</tr>
<tr><td colspan="2"><br /></td></tr>
<tr>
	<td>{="Duplicate track handling"}:&nbsp;</td>
	<td>
		<select name="unique" size="1">
		<option value="0">{="Add duplicate tracks to target playlist"}</option>
		<option value="1">{="Skip tracks that already exist in target playlist"}</option>
		</select>
	</td>
</tr>
<tr>
	<td>{="Existing track handling"}:&nbsp;</td>
	<td>
		<select name="exclusive" size="1">
		<option value="0">{="Leave any existing (non-duplicate) tracks in target playlist"}</option>
		<option value="1">{="Remove any existing (non-duplicate) tracks in target playlist"}</option>
		</select>
	</td>
</tr>
</table>

<br />

<input type="submit" name="upload" value="{="Upload"}" />
<input type="button" value="{="Cancel"}" onclick="window.location='index.php?page=library'; return false" />
<input type="hidden" name="playlistid" value="{$playlist.id}" />

{/box}

</form>