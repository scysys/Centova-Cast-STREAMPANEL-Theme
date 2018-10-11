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

{if $errors|count}
{box title="Error"}{="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).{/box}<br />
{elseif $error}
{box title="Error"}{="An error occurred while attempting to save this update."}{/box}<br />
{/if}

{box title="DJ Account Settings"}
	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
        <td>{="Username"}: {$errors.username|checkerror}</td>
        <td>
            {if $djaccount.id}
            <strong>{$djaccount.username|htmlentities}</strong>
            <input type="hidden" name="djaccount[username]" value="{$djaccount.username|htmlentities}" />
            {else}
            <input type="text" name="djaccount[username]" size="16" maxlength="16" value="{$djaccount.username|htmlentities}" />
            {/if}
        </td>
    </tr>
    <tr>
        <td>{="Password"}: {$errors.password|checkerror}</td>
        <td><input type="password" name="djaccount[password1]" size="16" maxlength="32" value="{$djaccount.password1|htmlentities}" /> {if $djaccount.id}({="leave blank to remain unchanged"}){/if}</td>
    </tr>
    <tr>
        <td>{="Confirm password"}: {$errors.password|checkerror}</td>
        <td><input type="password" name="djaccount[password2]" size="16" maxlength="32" value="{$djaccount.password2|htmlentities}" /></td>
    </tr>
    <tr>
		<td>{="Real name"}: {$errors.realname|checkerror}</td>
		<td><input type="text" name="djaccount[realname]" size="50" maxlength="255" value="{$djaccount.realname|htmlentities}" /></td>
	</tr>
    <tr>
		<td>{="Status"}: {$errors.status|checkerror}</td>
		<td>
			<select name="djaccount[status]" size="1">
			<option value="enabled"{if $djaccount.status=="enabled"} selected="selected"{/if}>{="Enabled"}</option>
			<option value="disabled"{if $djaccount.status=="disabled"} selected="selected"{/if}>{="Disabled"}</option>
			</select>
		</td>		
	</tr>
    </table>
{/box}

{box title="Privileges"}
    <table cellspacing="1" cellpadding="1" border="0">
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
            {="Permissions"}: {$errors.permissions|checkerror}<br /><br />
            
            <span class="info">
            ({="Hold Ctrl to%sselect multiple.","<br />"})
            </span>
        </td>
        <td>
            <select name="djaccount[permissions][]" size="{if $haveautodj}8{else}4{/if}" multiple="multiple">
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
			{="Disk quota"}: {$errors.diskquota|checkerror}
		</td>
		<td>
			<input type="text" name="djaccount[diskquota]" size="6" maxlength="8" value="{$djaccount.diskquota|htmlentities}" /> {="MB"} ({="0 to permit the use of your full quota"})
		</td>
	</tr>
{otherwise}
	<input type="hidden" name="djaccount[diskquota]" value="{$djaccount.diskquota|htmlentities}" />
{/check}
	</table>

{/box}

{box title="Login Restrictions"}
    <table cellspacing="1" cellpadding="1" border="0">
    <tr>
        <td valign="top">
            {="Allow logins"}: {$errors.login_weekdays|checkerror}<br /><br />
            
            <span class="info">
            ({="Hold Ctrl to%sselect multiple.","<br />"})
            </span>
        </td>
        <td>
            <select name="djaccount[login_weekdays][]" id="login_weekdays" size="7" multiple="multiple">
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
        <td>{="Allow from"}: {$errors.login_starttime|checkerror}</td>
        <td>
            {$djaccount.login_starttime|dateselect:login_starttime:datetime:timeonly:allownull:showtime:ampm:format=locale:timezone=$timezoneoffset}
        </td>
    </tr>    
    <tr>
        <td>{="Allow until"}: {$errors.login_endtime|checkerror}</td>
        <td>
            {$djaccount.login_endtime|dateselect:login_endtime:datetime:timeonly:allownull:showtime:ampm:format=locale:timezone=$timezoneoffset}
        </td>
    </tr>    
	</table>
{/box}

{box title="Save"}
	<input type="submit" name="update" value="{="Save"}" />
	<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" />
{/box}

</form>

