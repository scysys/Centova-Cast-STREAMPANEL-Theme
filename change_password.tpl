{include "password_field.tpl"}

{onready}
$('input.oldpass').centovaPassword({
	validate: false
});
$('input.newpass').centovaPassword({
	validate: true,
	updating: true
});
{/onready}

<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">

{if $successful}
{box title="Update Successful"}{="Password updated successfully."}{/box}
{elseif $failure}
{box title="Update Failed"}{="An error occurred while attempting to save this update"}. {="Please correct the fields marked below."}{/box}
{/if}

{box title="Password Change"}

<table cellspacing="1" cellpadding="1" border="0">
{if $reseller_username}
<tr>
	<td colspan="2" style="padding: 8px 0 8px 0">
		{="Changing password for reseller: %s%s%s","<strong>",$reseller_username,"</strong>"}
	</td>
</tr>
{else}
<tr>
	<td>{="Current password"}:</td>
	<td><input type="password" name="password[oldpassword]" class="oldpass" size="15" maxlength="255" value="" /> {$errors.oldpassword|checkerror}</td>
</tr>
{/if}
<tr>
	<td>{="New password"}:</td>
	<td><input type="password" name="password[newpassword1]" class="newpass" size="15" maxlength="255" value="" /> {$errors.newpassword1|checkerror}</td>
</tr>
<tr>
	<td>{="Confirm new password"}:</td>
	<td><input type="password" name="password[newpassword2]" class="newpass" size="15" maxlength="255" value="" /> {$errors.newpassword2|checkerror}</td>
</tr>
</table>

{if $reseller_username}
<input type="hidden" name="username" value="{$reseller_username|htmlentities}" />
{/if}
<input type="submit" name="update" value="{="Update password"}" />
</form>

{/box}