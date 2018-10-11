<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">

{if $errors|count}
{box title="Update Failed"}{="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).{/box}
{elseif $error}
{box title="Update Failed"}{="An error occurred while attempting to save this update."}{/box}
{/if}


{box title="Remote Server"}
<table cellspacing="1" cellpadding="1" border="0">
<tr>
	<td>{="Server title"}: {$errors.title|checkerror}</td>
	<td><input type="text" name="remoteserver[title]" size="50" maxlength="255" value="{$remoteserver.title|htmlentities}" /></td>
</tr>
<tr>
	<td>{="Centova Cast URL"}: {$errors.url|checkerror}</td>
	<td><input type="text" name="remoteserver[url]" size="50" maxlength="255" value="{$remoteserver.url|htmlentities}" /></td>
</tr>
<tr>
	<td>{="Administrator password"}: {$errors.password|checkerror}</td>
	<td><input type="password" name="remoteserver[password]" size="12" maxlength="32" value="{$remoteserver.password|htmlentities}" /></td>
</tr>
{check $_CONSTANTS.ENABLE_API_CLUSTERING}
<tr>
	<td>{="Include in API cluster"}: {$errors.apicluster|checkerror}</td>
	<td>
		<select name="remoteserver[apicluster]" size="1">
		<option value="0"{if $remoteserver.apicluster==0} selected="selected"{/if}>{="No"}</option>
		<option value="1"{if $remoteserver.apicluster>0} selected="selected"{/if}>{="Yes"}</option>
		</select>
	</td>
</tr>
{/check}
</table>

<br />

<input type="submit" name="update" value="{="Save"}" />
<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" />
</form>
{/box}
