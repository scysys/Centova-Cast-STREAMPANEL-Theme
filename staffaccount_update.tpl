{box title="Staff Account Update"}
	{check $saved}
	{="Staff account saved successfully."}
	{otherwise}
	{="Sorry, an error occurred while attempting to update this staff account"}: {$error|htmlentities}
	{/check}
	<br /><br />

	<a href="index.php?page=staffaccounts">{="Return"}</a>
{/box}
