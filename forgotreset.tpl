<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">
	
<div id="login_block">
	{if !$mobile}<img id="login_logo" src="../theme/images/login-logo.png" width="187" height="63" alt="Centova Cast" /><br />{/if}
		
	{if $error}<div id="loginerror">{$error|htmlentities}</div>{/if}
	
	{="Enter a new password below."}<br /><br />
	
	<table cellspacing="1" cellpadding="0" border="0">
	<tr><td>{="Password"}:&nbsp;</td><td><input type="password" name="password1" value="" size="12" maxlength="32" /></td></tr>
	<tr><td>{="Confirm password"}:&nbsp;</td><td><input type="password" name="password2" value="" size="12" maxlength="32" /></td></tr>
	<tr><td></td><td></td></tr>
	</table>

	{if !$mobile}<div class="login_sep"><img src="../theme/images/iconpane-sep.png" width="224" height="2" /></div>{/if}

	<input type="hidden" name="code" value="{$code|htmlentities}" />
	<input type="submit" name="login" value="{="Reset password"}" />

</div>        

</form>