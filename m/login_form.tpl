{if $error!=""}
<div class="modal">{$error}</div>
{/if}

<form id="login_form" method="post" action="{$_SERVER.REQUEST_URI}">

	<fieldset class="form">
		<div class="row">
			<label>{="Username"}</label>
			<input type="text" name="username" id="usernamefield" sample="jsmith" value="{$_REQUEST.username}" size="12" maxlength="32" />
		</div>
		<div class="row">
			<label>{="Password"}</label>
			<input type="password" name="password" id="passwordfield" sample="...." value="" size="12" maxlength="32" />
		</div>
	</fieldset>

	<input type="hidden" name="login" value="1" />
	<input type="submit" value="Login" id="btn_next" />
</form>

