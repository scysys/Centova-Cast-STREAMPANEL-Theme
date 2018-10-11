
{if $errors|count}
{box title="Update Failed"}{="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).{/box}
{elseif $error}
{box title="Update Failed"}{="An error occurred while attempting to save this update"}.{/box}
{/if}

{box title="Server Configuration"}

<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">

<table cellspacing="1" cellpadding="1" border="0">
<tr>
	<td>{="Title"}: {$errors.title|checkerror}</td>
	<td><input type="text" name="servertype[title]" size="50" maxlength="255" value="{$servertype.title|htmlentities}" /></td>
</tr>
<tr>
	<td>{="Pathname"}: {$errors.pathname|checkerror}</td>
	<td>
		<input type="text" name="servertype[pathname]" size="50" maxlength="255" value="{$servertype.pathname|htmlentities}" /><br />
	</td>
</tr>
<tr><td></td><td class="note">{="Note: this must specify the full path and filename to the %s server software on your server.  If you have not yet installed the software, you will need to do so before configuring this option.",$servertype.name}</td></tr>
<tr>
	<td>{="Enabled"}: {$errors.enabled|checkerror}</td>
	<td>
		<select name="servertype[enabled]" size="1">
		<option value="0"{if $servertype.enabled==0} selected="selected"{/if}>{="No"}</option>
		<option value="1"{if $servertype.enabled>0} selected="selected"{/if}>{="Yes"}</option>
		</select>
	</td>
</tr>
</table>

<br />

<input type="submit" name="update" value="{="Save"}" />
<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" />
</form>

{/box}