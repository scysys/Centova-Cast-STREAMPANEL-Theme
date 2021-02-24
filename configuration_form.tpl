{include "password_field.tpl"}

{onready}
$('input[type="password"]').centovaPassword({
	validate: true,
	updating: {if $creating==0}true{else}false{/if}
});
window.cc_orig_bitrate = {if $origbitrate}{$origbitrate|htmlentities}{else}0{/if};
{if ($creating==0) && ($template_editor==0)}
window.upload = new Upload(window.centovacast.options.upload,new UploadHandler_introfallback());
{/if}
{/onready}

<script type="text/javascript" language="javascript">
function go_mp_tab() {
	if (window.centovacast.tabset) window.centovacast.tabset.select("{="Mount Points"}");
}
function go_autodj_tab() {
	if (window.centovacast.tabset) window.centovacast.tabset.select("{="AutoDJ"}");
}
</script>

<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}" enctype="multipart/form-data" role="form">

{check ($errors|count>0) or ($fatal!="")}
{box title="Error"}
{if $fatal!=""}
	{$fatal|htmlentities}
{/if}

{if $errors|count>0}
	{="The following fields contain invalid values:"}<br /><br />
	
	<div class="error">
{/if}
	{loop $error=$errors}
	{if $error.text}{$error.text|htmlentities}{else}{$_loop.key}{/if}<br />
	{/loop}
{if $errors|count>0}
	</div>
	
	<br />
	{="Please correct these values and try again."}
{/if}
{/box}
{/check}

{$fields}

<br />

{check ($reseller_editor>0) && ($creating==0) && ($template_editor==0)}
	<input type="button" value="{="Change password"}" onclick="window.location='index.php?page=resellerpassword{if $admin}&username={$config.username|htmlentities}{/if}'" />
{otherwisecheck ($admin) && ($config.reseller==0) && ($creating==0) && ($template_editor==0)}
	<input type="button" value="{="Move to another reseller"}" onclick="window.location='index.php?page=manageaccount&action=reparent&username={$config.username|htmlentities}'" />
{/check}

{check ($privileged>0) and ($creating==0) and ($editingself==0) and ($template_editor==0)}
	<input type="button" value="{="Login to this account"}" onclick="window.location='index.php?page=accounts&action=setuid&username={$config.username|htmlentities}'" />
	<input type="button" value="{="Change account username"}" onclick="window.location='index.php?page=manageaccount&action=rename&username={$config.username|htmlentities}'" />
	<input type="button" value="{="Change account type"}" onclick="window.location='index.php?page=convertaccount&username={$config.username|htmlentities}'" />
{/check}

{check ($reseller_editor==0) && ($rawconfigpermitted>0)}
	<input type="button" value="{="Raw configuration"}" onclick="window.location='index.php?page=confeditor'" />
{/check}


<div class="col-sm-12">
<div class="row">
<div class="col-sm-6">
<input type="submit" class="btn btn-success btn-block" name="{if $creating}create{else}update{/if}" value="{if $creating}{="Create"}{else}{="Update"}{/if}" />
</div>
<div class="col-sm-6">
<input type="button" class="btn btn-danger btn-block" value="{="Cancel"}" onclick="window.location='index.php?page={if $template_editor==0}accounts{else}accounttemplates{/if}'; return false" />
</div>
</div>

</form>
