<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">

{if $errors|count}
{box title="Update Failed"}{="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).{/box}
{elseif $error}
{box title="Update Failed"}{="An error occurred while attempting to save this update."}{/box}
{/if}

{box title="News Article"}
<table cellspacing="1" cellpadding="1" border="0" width="100%">
<tr>
	<td width="140">{="Headline"}: {$errors.title|checkerror}</td>
	<td><input type="text" name="newsarticle[title]" size="50" maxlength="255" value="{$newsarticle.title|htmlentities}" /></td>
</tr>
<tr>
	<td valign="top">{="Content"}:</td>
	<td>
		<textarea name="newsarticle[content]" rows="10" cols="50" style="width: 80%">{$newsarticle.content|htmlentities}</textarea>
	</td>
</tr>
<tr>
	<td>{="Publish date"}: {$errors.publishdate|checkerror}</td>
	<td>
		{$newsarticle.publishdate|dateselect:publishdate:datetime:showtime:ampm:format=locale:timezone=$timezoneoffset}
	</td>
</tr>
<tr>
	<td>{="Unpublish date"}: {$errors.unpublishdate|checkerror}</td>
	<td>
		{$newsarticle.unpublishdate|dateselect:unpublishdate:datetime:allownull:showtime:ampm:format=locale:timezone=$timezoneoffset}
	</td>
</tr>
<tr>
	<td>{="Visible"}: {$errors.visible|checkerror}</td>
	<td>
		<select name="newsarticle[visible]" size="1">
		<option value="1"{if $newsarticle.visible>0} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $newsarticle.visible==0} selected="selected"{/if}>{="No"}</option>
		</select>
	</td>
</tr>
<tr>
 <td valign="top">
	 {="Display for"}: {$errors.display|checkerror}<br /><br />

	 <span class="info">
	 ({="Hold Ctrl to%sselect multiple.","<br />"})
	 </span>
 </td>
 <td>
	 <select name="newsarticle[display][]" size="2" multiple="multiple">
	 <option value="client"{if $newsarticle.display|contains:"client"} selected="selected"{/if}>{="Clients"}</option>
	 <option value="reseller"{if $newsarticle.display|contains:"reseller"} selected="selected"{/if}>{="Resellers"}</option>
	 </select>
 </td>
</tr>
</table>
{/box}

<input type="submit" name="update" value="{="Save"}" />
<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" />
</form>
