<div class="ctip" id="tip_pathname">
	<h1>{="Pathname"}</h1>
	
	<p>
	{="Before you can use a server or autoDJ application, you must first install it on the server.  After installing it, you need to enter its path and filename here."}<br /><br />
	{="Note that if you are using Centova Cast on multiple clustered hosts, the server or autoDJ application must be installed on the REMOTE host, and the pathname you enter here needs to specify the path to the application on the REMOTE host (not the main web interface server)."}
	</p>
</div>

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
