{box title="DJ Account Update"}
	{check $saved}
	{="DJ Account saved successfully."}
	{otherwise}
	{="Sorry, an error occurred while attempting to update this DJ account"}: {$error|htmlentities}
	{/check}
	<br /><br />
	
	<a href="index.php?page=djaccounts">{="Return"}</a>
{/box}
