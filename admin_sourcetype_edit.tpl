
{if $errors|count}
{box title="Update Failed"}{="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).{/box}
{elseif $error}
{box title="Update Failed"}{="An error occurred while attempting to save this update."}{/box}
{/if}

{box title="Source Configuration"}

<form method="post" action="{$_REQUEST.REQUEST_URI|htmlentities}">

<table cellspacing="1" cellpadding="1" border="0">
<tr>
	<td>{="Title"}: {$errors.title|checkerror}</td>
	<td><input type="text" name="sourcetype[title]" size="50" maxlength="255" value="{$sourcetype.title|htmlentities}" /></td>
</tr>
<tr>
	<td>{="Pathname"}: {$errors.pathname|checkerror}</td>
	<td>
		<input type="text" name="sourcetype[pathname]" size="50" maxlength="255" value="{$sourcetype.pathname|htmlentities}" /><br />
	</td>
</tr>
<tr><td></td><td class="note">{="Note: this must specify the full path and filename to the %s source software on your source.  If you have not yet installed the software, you will need to do so before configuring this option.",$sourcetype.name}</td></tr>
<tr>
	<td>{="Enabled"}: {$errors.enabled|checkerror}</td>
	<td>
		<select name="sourcetype[enabled]" size="1">
		<option value="0"{if $sourcetype.enabled==0} selected="selected"{/if}>{="No"}</option>
		<option value="1"{if $sourcetype.enabled>0} selected="selected"{/if}>{="Yes"}</option>
		</select>
	</td>
</tr>
</table>

<br />

<input type="submit" name="update" value="{="Save"}" />
<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" />
</form>

{/box}