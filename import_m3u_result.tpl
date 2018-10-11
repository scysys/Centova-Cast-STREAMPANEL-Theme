{box title="Import Results"}

{check $error!=""}
	<strong>{="Error"}: </strong>{$error|htmlentities}<br /><br />
{otherwise}
	{="%s%s%s tracks(s) were successfully imported into the %s%s%s playlist","<strong>",$goodtracks,"</strong>","<strong>",$playlist.title,"</strong>"}.
	{if $skippedtracks>0}{="%s%s%s track(s) were skipped because they already existed in the %s%s%s playlist","<strong>",$skippedtracks,"</strong>","<strong>",$playlist.title,"</strong>"}.{/if}
	{if $deletedtracks>0}{="%s%s%s existing track(s) were deleted from the %s%s%s playlist","<strong>",$deletedtracks,"</strong>","<strong>",$playlist.title,"</strong>"}.{/if}
	<br /><br />


	{if $badtracks|count>0}
		{="%s%s%s track(s) were not found in the media library and could not be imported:","<strong>",$badtracks|count,"</strong>"}<br /><br />

		<div style="font-family: Courier New, Courier, monospace; font-size: 10px">
		{loop $badtrack=$badtracks}
		<img align="absmiddle" src="/system/images/icons/failure.png" /> {$badtrack|htmlentities}<br />
		{/loop}
		</div>
	{/if}
{/check}

<br />
{/box}

{box}
<img src="/system/images/icons/models/playlist.png" align="absmiddle" /> <a href="index.php?page=importm3u&playlistid={$playlist.id}">{="Import another playlist"}</a><br />
<img src="/system/images/icons/return.png" align="absmiddle" /> <a href="index.php?page=library">{="Return to media library"}</a>
{/box}
