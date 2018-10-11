<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">

{if $errors|count}
{box title="Update Failed"}{="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).{/box}
{elseif $error}
{box title="Update Failed"}{="An error occurred while attempting to save this update."}{/box}
{/if}

{$form}

<input type="submit" name="update" value="{="Save"}" />
<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" />
</form>
