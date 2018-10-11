{box title="Stream status"}
	{check $successful}
	{="Status updated successfully"}.
	{otherwise}
	{="Status could not be updated"}{if $reason}: {$reason|htmlentities}{/if}.
	{/check}
	<br /><br />
	
	<a href="index.php?page=accounts">{="Return"}</a>
{/box}
