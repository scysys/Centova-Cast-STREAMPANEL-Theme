{include "password_field.tpl"}

{onready}
<script language="javascript">
$('input[type="password"]').centovaPassword({
	validate: true,
	updating: {if $staffaccount.username==""}false{else}true{/if}
});

$('#perm_superuser').change(function(){
	var $this = $(this);
	var is_superuser = $this.prop('checked');
	var first = false;
	if (!$this.data('initialized')) {
		$this.data('initialized',true);
		first = true;
	}
	$('input[name="staffaccount[permissions][]"][value!="superuser"][value!="cli"][value!="api"]')
		.prop('checked',is_superuser ? true : ( first ? function(){ return $(this).prop('checked'); } : false) )
		.prop('disabled',is_superuser)
		.next()
		.css('opacity',is_superuser ? 0.5 : 1.0);
	$('input[name="staffaccount[permissions][]"][value="cli"],input[name="staffaccount[permissions][]"][value="api"]')
		.prop('checked',!is_superuser ? false : (first ? function(){ return $(this).prop('checked'); } : false) )
		.prop('disabled',!is_superuser)
		.next()
		.css('opacity',!is_superuser ? 0.5 : 1.0);
}).change();

{if ($restrict_permissions) and ($staffaccount.id==$staff_id)}
	$('input[name="staffaccount[permissions][]"]')
		.prop('name','restricted_staffaccount[permissions][]')
		.prop('disabled',true)
		.next()
		.css({ color: '#990000' });
	$('#privlimits').html("<br />{="Note"}: {="As a staff member you are not permitted to modify your own account permissions"}.")
{elseif $restrict_permissions}
	var permitted_perms = "{$permitted_permissions|implode:","}".split(',');
	$('input[name="staffaccount[permissions][]"]').each(function(){
		var $input = $(this);
		var name = $input.val();
		if (permitted_perms.indexOf(name) == -1) {
			$input
				.prop('name','restricted_staffaccount[permissions][]')
				.prop('disabled',true)
				.next()
				.css({ color: '#990000' });
		}
	});
	$('#privlimits').html("<br />{="Note"}: {="As a staff member you are not permitted to grant or revoke permissions that you, yourself, do not possess.  The permissions %sindicated above%s have been disabled for this reason, and will not be affected by any changes you make.","<span style='color: #990000'>","</span>"}")
{/if}
</script>
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

{box title="Staff Account Settings"}
	<table cellspacing="1" cellpadding="1" border="0">
	<tr>
        <td>{="Username"}: {$errors.username|checkerror}</td>
        <td>
            {if $staffaccount.id}
            <strong>{$staffaccount.username}</strong>
            <input type="hidden" name="staffaccount[username]" value="{$staffaccount.username|htmlentities}" />
            {else}
            <input type="text" name="staffaccount[username]" size="16" maxlength="16" value="{$staffaccount.username|htmlentities}" />
            {/if}
        </td>
    </tr>
    <tr>
        <td>{="Password"}: {$errors.password|checkerror}</td>
        <td><input type="password" name="staffaccount[password1]" size="16" maxlength="32" value="{$staffaccount.password1|htmlentities}" /> {if $staffaccount.id}({="leave blank to remain unchanged"}){/if}</td>
    </tr>
    <tr>
        <td>{="Confirm password"}: {$errors.password|checkerror}</td>
        <td><input type="password" name="staffaccount[password2]" size="16" maxlength="32" value="{$staffaccount.password2|htmlentities}" /></td>
    </tr>
    <tr>
		<td>{="Real name"}: {$errors.realname|checkerror}</td>
		<td><input type="text" name="staffaccount[realname]" size="50" maxlength="255" value="{$staffaccount.realname|htmlentities}" /></td>
	</tr>
		<tr>
		<td>{="E-mail address"}: {$errors.email|checkerror}</td>
		<td><input type="text" name="staffaccount[email]" size="50" maxlength="255" value="{$staffaccount.email|htmlentities}" /></td>
	</tr>
    <tr>
		<td>{="Status"}: {$errors.status|checkerror}</td>
		<td>
			<select name="staffaccount[status]" size="1">
			<option value="enabled"{if $staffaccount.status=="enabled"} selected="selected"{/if}>{="Enabled"}</option>
			<option value="disabled"{if $staffaccount.status=="disabled"} selected="selected"{/if}>{="Disabled"}</option>
			</select>
		</td>		
	</tr>
    </table>
{/box}

{box title="Privileges"}
    <table cellspacing="1" cellpadding="1" border="0">
    <tr>
        <td valign="top">
            {="Permissions"}: {$errors.permissions|checkerror}<br /><br />
        </td>
        <td>
			<input type="checkbox" name="staffaccount[permissions][]" value="superuser" id="perm_superuser"{if $staffaccount.permissions|contains:"superuser"} checked="checked"{/if}> <label for="perm_superuser">{="Superuser (unrestricted access)"}</label><br /><br />

			<div style="float: left; width: 200px">
			<input type="checkbox" name="staffaccount[permissions][]" value="accounts" id="perm_accounts"{if $staffaccount.permissions|contains:"accounts"} checked="checked"{/if}> <label for="perm_accounts">{="List accounts"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="accounts_status" id="perm_accounts_status"{if $staffaccount.permissions|contains:"accounts_status"} checked="checked"{/if}> <label for="perm_accounts_status">{="Change account statuses"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="accounts_create" id="perm_accounts_create"{if $staffaccount.permissions|contains:"accounts_create"} checked="checked"{/if}> <label for="perm_accounts_create">{="Create accounts"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="accounts_edit" id="perm_accounts_edit"{if $staffaccount.permissions|contains:"accounts_edit"} checked="checked"{/if}> <label for="perm_accounts_edit">{="Edit accounts"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="accounts_delete" id="perm_accounts_delete"{if $staffaccount.permissions|contains:"accounts_delete"} checked="checked"{/if}> <label for="perm_accounts_delete">{="Delete accounts"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="accounts_control" id="perm_accounts_control"{if $staffaccount.permissions|contains:"accounts_control"} checked="checked"{/if}> <label for="perm_accounts_control">{="Start/stop account streams"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="accounts_setuid" id="perm_accounts_setuid"{if $staffaccount.permissions|contains:"accounts_setuid"} checked="checked"{/if}> <label for="perm_accounts_setuid">{="Log in to client accounts"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="accountstats" id="perm_accountstats"{if $staffaccount.permissions|contains:"accountstats"} checked="checked"{/if}> <label for="perm_accountstats">{="View master statistics"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="settings" id="perm_settings"{if $staffaccount.permissions|contains:"settings"} checked="checked"{/if}> <label for="perm_settings">{="Manage settings"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="emails" id="perm_emails"{if $staffaccount.permissions|contains:"emails"} checked="checked"{/if}> <label for="perm_emails">{="Manage E-mails"}</label><br />
			</div>

			<div style="float: left; width: 200px">
			<input type="checkbox" name="staffaccount[permissions][]" value="rpchosts" id="perm_rpchosts"{if $staffaccount.permissions|contains:"rpchosts"} checked="checked"{/if}> <label for="perm_rpchosts">{="Manage hosts"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="accounttemplates" id="perm_accounttemplates"{if $staffaccount.permissions|contains:"accounttemplates"} checked="checked"{/if}> <label for="perm_accounttemplates">{="Manage account templates"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="news" id="perm_news"{if $staffaccount.permissions|contains:"news"} checked="checked"{/if}> <label for="perm_news">{="Manage news articles"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="serverstatus" id="perm_serverstatus"{if $staffaccount.permissions|contains:"serverstatus"} checked="checked"{/if}> <label for="perm_serverstatus">{="View server status"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="logs" id="perm_logs"{if $staffaccount.permissions|contains:"logs"} checked="checked"{/if}> <label for="perm_logs">{="View logs"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="logs_trim" id="perm_logs_trim"{if $staffaccount.permissions|contains:"logs_trim"} checked="checked"{/if}> <label for="perm_logs_trim">{="Trim logs"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="sessions" id="perm_sessions"{if $staffaccount.permissions|contains:"sessions"} checked="checked"{/if}> <label for="perm_sessions">{="View active user sessions"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="utilities" id="perm_utilities"{if $staffaccount.permissions|contains:"utilities"} checked="checked"{/if}> <label for="perm_utilities">{="Access system utilities"}</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="staff" id="perm_staff"{if $staffaccount.permissions|contains:"staff"} checked="checked"{/if}> <label for="perm_staff">{="Manage staff accounts"}</label><br />
			</div>
			<input type="checkbox" name="staffaccount[permissions][]" value="cli" id="perm_cli"{if $staffaccount.permissions|contains:"cli"} checked="checked"{/if}> <label for="perm_cli">{="Command-line access"} ({="requires superuser"})</label><br />
			<input type="checkbox" name="staffaccount[permissions][]" value="api" id="perm_api"{if $staffaccount.permissions|contains:"api"} checked="checked"{/if}> <label for="perm_api">{="API access"} ({="requires superuser"})</label>
        </td>
    </tr>
	</table>

	<div id="privlimits"></div>

{/box}
{box title="Save"}
	<input type="submit" name="update" value="{="Save"}" />
	<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" />
{/box}

</form>

