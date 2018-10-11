{box title="Change Account Username"}
	<form method="get" action="index.php">
		{="When changing the username for an account, please be aware of the following"}:

		<ul>
		<li>{="The username for an account can only be changed when its stream is offline"}.</li>
		<li>{="If the user is currently logged in, all of his login sessions will expire immediately after changing the username, and the user will need to log in again."}</li>
		<li>{="After the username is changed, the old username will cease to exist; login attempts using the old username will fail, and any URLs containing the old username (including start page URLs) will become invalid."}</li>
		</ul>

		<table cellspacing="1" cellpadding="0" border="0">
		<tr>
			<td>{="Current username"}:&nbsp;</td>
			<td><strong>{$old_username|htmlentities}</strong></td>
		</tr>
		<tr>
			<td>{="New username"}:</td>
			<td><input type="text" name="newusername" size="12" maxlength="20" value="{$new_username|htmlentities}" /></td>
		</tr>
		</table>

		<br />

		<input type="hidden" name="page" value="manageaccount" />
		<input type="hidden" name="action" value="rename" />
		<input type="hidden" name="username" value="{$old_username|htmlentities}" />
		<input type="submit" name="confirm" value="{="Change account username"}" />
		<input type="button" value="{="Cancel"}" onclick="window.location='index.php?page=accounts'; return false" />
	</form>
{/box}
