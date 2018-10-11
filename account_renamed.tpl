{box title="Change account username"}
	{check $successful}
	{="Username for account %s%s%s successfully changed to %s%s%s","<strong>",$old_username,"</strong>","<strong>",$new_username,"</strong>"}.
	{otherwise}
	{="Username could not be updated"}{if $reason}: {$reason|htmlentities}{/if}.
	{/check}
	<br /><br />

	<a href="index.php?page=accounts">{="Return"}</a>
{/box}
