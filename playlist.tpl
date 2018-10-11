<form action="{$_SERVER.REQUEST_URI|htmlentities}" method="post">
	<div id="heading_library">{="Media Library"}</div>
	<div id="heading_playlist">{="Playlist"}</div>
	
	<textarea id="library" class="box" readonly="readonly">{$library}</textarea>

	<textarea name="playlistdata" id="playlist" class="lbt">{$playlist}</textarea>
	
	<div id="options">
		<div id="buttons">
			<input type="hidden" name="playlistid" value="{$playlistid}" />
			<input type="submit" name="setajax" value="{="Full Mode"}" style="width: 75px" onclick="return confirm('{="This will switch to the full (drag-and-drop) playlist editor.  Any unsaved changes you have made to this playlist will be lost.  Click OK to proceed to the full editor, or Cancel to return."}')" />

			&nbsp;&nbsp;
			
			<input type="submit" name="save" value="{="Save"}" style="width: 50px"/>
			<input type="submit" name="cancel" value="{="Discard"}" style="width: 50px" onclick="return confirm('{="Any unsaved changes you have made to this playlist will be lost.  Click OK to discard all changes, or Cancel to return to the editor."}')" onclick="window.location='index.php'; return false" />
		</div>
		{="Construct your playlist by copying tracks from your media library to your playlist."}
	</div>

</form>

