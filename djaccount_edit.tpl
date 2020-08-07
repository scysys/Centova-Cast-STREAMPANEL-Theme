{css}
.m-portlet__head.sp-box-table {
background-color: #1E1E2D;
border-color: #1E1E2D;
}
.m-portlet__head-text.sp-box-table {
color: white !important;
}
.m-subheader {
display: none;
}
.centovapassword {
display: none !important;
}
{/css}

{include "password_field.tpl"}

{onready}
$('input[type="password"]').centovaPassword({
	validate: true,
	updating: {if $djaccount.username==""}false{else}true{/if}
});
{/onready}

{css}
.box { margin-bottom: 4px; }
{/css}
{javascript}<script>
function set_select_element(id,value) {
	var el = document.getElementById(id);
	if (!el) return;
	for (var i=0; i<el.options.length; i++) {
		if (el.options[i].value==value) {
			el.selectedIndex = i;
			break;
		}
	}
}
</script>{/javascript}

<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">

<!-- Error -->
{if $errors|count}
<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Error"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
        {="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).
    </div>
</div>
{elseif $error}
<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Error"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
        {="An error occurred while attempting to save this update."}
    </div>
</div>
{/if}

<!-- DJ-Account Settings -->
<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="DJ Account Settings"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
	<table class="table table-striped table-bordered table-checkable">
	<tr>
        <td>{="Username"} {$errors.username|checkerror}</td>
        <td>
            {if $djaccount.id}
            <strong>{$djaccount.username|htmlentities}</strong>
            <input class="form-control" type="hidden" name="djaccount[username]" value="{$djaccount.username|htmlentities}" />
            {else}
            <input class="form-control" type="text" name="djaccount[username]" size="16" maxlength="16" value="{$djaccount.username|htmlentities}" />
            {/if}
        </td>
    </tr>
    <tr>
        <td>{="Password"} {$errors.password|checkerror}</td>
        <td><input class="form-control" type="password" name="djaccount[password1]" size="16" maxlength="32" value="{$djaccount.password1|htmlentities}" /> {if $djaccount.id}({="leave blank to remain unchanged"}){/if}</td>
    </tr>
    <tr>
        <td>{="Confirm password"} {$errors.password|checkerror}</td>
        <td><input class="form-control" type="password" name="djaccount[password2]" size="16" maxlength="32" value="{$djaccount.password2|htmlentities}" /></td>
    </tr>
    <tr>
		<td>{="Real name"} {$errors.realname|checkerror}</td>
		<td><input class="form-control" type="text" name="djaccount[realname]" size="50" maxlength="255" value="{$djaccount.realname|htmlentities}" /></td>
	</tr>
    <tr>
		<td>{="Status"} {$errors.status|checkerror}</td>
		<td>
			<select class="form-control" name="djaccount[status]" size="1">
			<option value="enabled"{if $djaccount.status=="enabled"} selected="selected"{/if}>{="Enabled"}</option>
			<option value="disabled"{if $djaccount.status=="disabled"} selected="selected"{/if}>{="Disabled"}</option>
			</select>
		</td>		
	</tr>
    </table>
    </div>
</div>

<!-- Privileges -->
<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Privileges"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
    <table class="table table-striped table-bordered table-checkable">
<!-- coming soon :)
{check $haveautodj}
    <tr>
        <td>{="AutoDJ FTP access"}: {$errors.permitftp|checkerror}</td>
        <td>
            <select name="djaccount[permitftp]" size="1">
            <option value="enabled"{if $djaccount.permitftp=="enabled"} selected="selected"{/if}>{="Enabled"}</option>
            <option value="disabled"{if $djaccount.permitftp=="disabled"} selected="selected"{/if}>{="Disabled"}</option>
            </select>
        </td>        
    </tr>
{/check}    
-->
    <tr>
        <td valign="top">
            {="Permissions"} {$errors.permissions|checkerror}<br /><br />
            
            <span class="info">
            ({="Hold Ctrl to%sselect multiple.","<br />"})
            </span>
        </td>
        <td>
            <select class="form-control" name="djaccount[permissions][]" size="{if $haveautodj}8{else}4{/if}" multiple="multiple">
            <option value="controlserver"{if $djaccount.permissions|contains:"controlserver"} selected="selected"{/if}>{="Start/stop the stream"}</option>
{check $haveautodj}
            <option value="controlautodj"{if $djaccount.permissions|contains:"controlautodj"} selected="selected"{/if}>{="Start/stop the autoDJ"}</option>
            <option value="manageplaylists"{if $djaccount.permissions|contains:"manageplaylists"} selected="selected"{/if}>{="Manage playlist settings"}</option>
            <option value="medialibrary"{if $djaccount.permissions|contains:"medialibrary"} selected="selected"{/if}>{="Access media library"}</option>
            <option value="managefiles"{if $djaccount.permissions|contains:"managefiles"} selected="selected"{/if}>{="Manage media files"}</option>
			<option value="ftpglobal"{if $djaccount.permissions|contains:"ftpglobal"} selected="selected"{/if}>{="Full FTP access"}</option>
			<option value="ftpprivate"{if $djaccount.permissions|contains:"ftpprivate"} selected="selected"{/if}>{="Private FTP folder"}</option>
{/check}
            <option value="viewstatistics"{if $djaccount.permissions|contains:"viewstatistics"} selected="selected"{/if}>{="View statistics"}</option>
            <option value="viewlisteners"{if $djaccount.permissions|contains:"viewlisteners"} selected="selected"{/if}>{="View listeners"}</option>
            <option value="viewlogs"{if $djaccount.permissions|contains:"viewlogs"} selected="selected"{/if}>{="View logs"}</option>
            </select>
        </td>        
    </tr>
{check $haveautodj}
	<tr>
		<td valign="top">
			{="Disk quota"} {$errors.diskquota|checkerror}
		</td>
		<td>
			<input class="form-control" type="text" name="djaccount[diskquota]" size="6" maxlength="8" value="{$djaccount.diskquota|htmlentities}" /> {="MB"} ({="0 to permit the use of your full quota"})
		</td>
	</tr>
{otherwise}
	<input type="hidden" name="djaccount[diskquota]" value="{$djaccount.diskquota|htmlentities}" />
{/check}
<tr>
		<td valign="top">
			{="Note"}
		<td>
			{="The Permissions are only for the Interface itself. DJ-Accounts can also Login to our Panel and handle based on the Permissions!"}
		</td>
	</tr>
	</table>
    </div>
</div>

<!-- Login Restrictions -->
<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Login Restrictions"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
    <table class="table table-striped table-bordered table-checkable">
    <tr>
        <td valign="top">
            {="Allow logins"} {$errors.login_weekdays|checkerror}<br /><br />
            
            <span class="info">
            ({="Hold Ctrl to%sselect multiple.","<br />"})
            </span>
        </td>
        <td>
            <select class="form-control" name="djaccount[login_weekdays][]" id="login_weekdays" size="7" multiple="multiple">
            <option value="sun"{if $djaccount.login_weekdays|contains:"sun"} selected="selected"{/if}>{="Sun"}</option>
            <option value="mon"{if $djaccount.login_weekdays|contains:"mon"} selected="selected"{/if}>{="Mon"}</option>
            <option value="tue"{if $djaccount.login_weekdays|contains:"tue"} selected="selected"{/if}>{="Tue"}</option>
            <option value="wed"{if $djaccount.login_weekdays|contains:"wed"} selected="selected"{/if}>{="Wed"}</option>
            <option value="thu"{if $djaccount.login_weekdays|contains:"thu"} selected="selected"{/if}>{="Thu"}</option>
            <option value="fri"{if $djaccount.login_weekdays|contains:"fri"} selected="selected"{/if}>{="Fri"}</option>
            <option value="sat"{if $djaccount.login_weekdays|contains:"sat"} selected="selected"{/if}>{="Sat"}</option>
            </select>
        </td>        
    </tr>
    <tr>
        <td>{="Allow from"} {$errors.login_starttime|checkerror}</td>
        <td>
            {$djaccount.login_starttime|dateselect:login_starttime:datetime:timeonly:allownull:showtime:ampm:format=locale:timezone=$timezoneoffset}
        </td>
    </tr>    
    <tr>
        <td>{="Allow until"} {$errors.login_endtime|checkerror}</td>
        <td>
            {$djaccount.login_endtime|dateselect:login_endtime:datetime:timeonly:allownull:showtime:ampm:format=locale:timezone=$timezoneoffset}
        </td>
    </tr>    
	</table>
    </div>
</div>

<div class="row">
<div class="col-md-6">
	<input type="submit" name="update" value="{="Save"}" class="btn btn-success btn-block" />
</div>
<div class="col-md-6">
	<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" class="btn btn-danger btn-block" />
</div>
</div>

</form>
