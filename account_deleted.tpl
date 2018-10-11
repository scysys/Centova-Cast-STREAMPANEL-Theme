{box title="Delete Account"}
	{check $successful}
	{="Account deleted successfully."}
	{otherwise}
	{="Account could not be deleted"}{if $reason}: {$reason|htmlentities}{/if}.
	{/check}
	<br /><br />
	
	<a href="index.php?page=accounts">{="Return"}</a>
{/box}