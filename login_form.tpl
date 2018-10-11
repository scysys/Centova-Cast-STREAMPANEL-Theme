{resource type="js" src="/system/jquery.centova.password.js" depends="common"}
{resource type="css" src="/system/jquery.centova.password.css"}

<form id="login_form" method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">
        
<div id="login_block">
	<img id="login_logo" src="../theme/images/login-logo.png" width="187" height="63" alt="Centova Cast" />

	<table id="login_table" cellspacing="1" cellpadding="0" border="0">
	<tr><th>{="Username"}:&nbsp;</th><td>					<input type="text"     name="username" id="usernamefield" class="loginfield" validate="/^[a-z0-9_]{2,}$/i" valmsg="{="Please enter a valid username."}" value="{$_REQUEST.username|htmlentities}" size="12" maxlength="32" /></td></tr>
	<tr><th>{="Password"}:&nbsp;</th><td nowrap="nowrap">	<input type="password" name="password" id="passwordfield" class="loginfield" validate="/^[^\s]{4,}$/" valmsg="{="Please enter a valid password."}" value="" size="12" maxlength="32" /></td></tr>
	</table>

	{check $error}
		<div id="loginerror">{$error|htmlentities}</div>
		{if $_REQUEST.remember}<input type="hidden" name="remember" value="1" />{/if}
	{otherwise}
		<div id="login_remember"><input type="checkbox" name="remember" {if $_REQUEST.remember}checked="checked" {/if}value="1" /> {="Remember me"}</div>
	{/check}
	
	<div class="login_sep"></div>
    <input type="submit" name="login" value="{="Login"}" />
</div>        

{if $unsupported_iexplorer}
<br />
<div align="center">
{="Please note that your browser is outdated and may not function correctly with %s.","Centova Cast"}<br />
{="%s requires %s or greater, or another standards-compliant browser.","Centova Cast","Internet Explorer 7.0"}
</div>
{/if}

</form>
