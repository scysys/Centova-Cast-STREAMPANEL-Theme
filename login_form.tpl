{resource type="js" src="/system/jquery.centova.password.js" depends="common"}
{resource type="css" src="/system/jquery.centova.password.css"}
<form class="m-login__form m-form" action="" _lpchecked="1" method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">
{check $error}
<div class="m-alert m-alert--outline alert alert-danger alert-dismissible animated fadeIn" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
  <span>{$error|htmlentities}</span></div>
{/check}
<div class="form-group m-form__group">
  <input class="form-control m-input" type="text" placeholder="{="Username"}" validate="/^[a-z0-9_]{2,}$/i" name="username" id="usernamefield" autocomplete="off" valmsg="{="Please enter a valid username."}" value="{$_REQUEST.username|htmlentities}" size="12" maxlength="32" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=&quot;); cursor: auto;">
</div>
<div class="form-group m-form__group">
  <input class="form-control m-input m-login__form-input--last" type="password" placeholder="{="Password"}" validate="/^[^\s]{4,}$/" name="password" id="passwordfield" autocomplete="off" valmsg="{="Please enter a valid password."}" value="" size="12" maxlength="32" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=&quot;); cursor: auto;">
</div>
<!--begin::Action-->
<div class="m-login__action"> <a href="https://www.streampanel.net/kb/centova-cast-passwort-vergessen-aendern/" target="_blank" class="m-link m--font-danger"> <span>{="Forgot password?"}</span> </a>
  <button type="submit" value="{="Login"}" name="login" class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary">{="Login"}</button>
</div>
<!--end::Action-->
</form>
