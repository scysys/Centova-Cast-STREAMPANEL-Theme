<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">
	
<div id="login_block">
	{if !$mobile}
	<img id="login_logo" src="../theme/images/login-logo.png" width="187" height="63" alt="Centova Cast" /><br />
	{/if}
		
	{if $error}<div id="loginerror">{$error|htmlentities}</div>{/if}
		
	{="Enter your E-mail address below continue."}<br /><br />
	
	<table id="login_table" cellspacing="1" cellpadding="0" border="0">
	<tr><th>{="E-mail address"}:&nbsp;</th><td><input type="text" name="email" id="emailfield" value="" size="15" maxlength="255" /></td></tr>
	</table>
		
	{if !$mobile}
	<div class="login_sep"><img src="../theme/images/iconpane-sep.png" width="224" height="2" /></div>
	{/if}

	<input type="submit" name="login" value="{="Reset password"}" />

</div>

</form>
	