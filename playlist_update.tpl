{box title="Playlist Update"}
	{check $saved}
	{="Playlist saved successfully."}
	{otherwise}
	{="Sorry, an error occurred while attempting to update your playlist"}: {$error|htmlentities}
	{/check}
	<br /><br />
	
	<a href="index.php?page=playlists">{="Return"}</a>
{/box}
