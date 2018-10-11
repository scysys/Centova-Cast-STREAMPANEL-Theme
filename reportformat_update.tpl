{box title="Custom Report Format Update"}
	{check $saved}
	{="Custom report format saved successfully."}
	{otherwise}
	{="Sorry, an error occurred while attempting to update this custom report"}: {$error|htmlentities}
	{/check}
	<br /><br />

	<a href="index.php?page=reportdownloads">{="Return"}</a>
{/box}
