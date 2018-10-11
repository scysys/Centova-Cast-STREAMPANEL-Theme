{resource type="js" class="rpc"}
{resource type="js" class="accounts"}

{include file="units_lang.tpl"}

{language}
	unl: '{="UNL"}',
	reseller_account: '{="Reseller account"}',
	all_accounts: '{="All accounts"}',
	all_resellers: '{="All resellers"}',
	all_servers: '{="All servers"}',
	all_servertypes: '{="All server types"}',
	sort: '{="Sort"}',
	unknown: '{="Unknown"}',
	confirm_suspend: '{="Are you sure you want to disable this account?"}',
	confirm_suspend_reseller: '{="All of its client accounts will be disabled as well."}',
	confirm_unsuspend_reseller: '{="WARNING: This account was suspended because it exceeded its resource limits.  If you unsuspend this account now, and its further resource consumption causes you to exceed the limits of your reseller account, your entire reseller account (including all of your client accounts) will be suspended as a result.  Are you sure you want to unsuspend this account?"}',
	confirm_unsuspend_admin: '{="WARNING: This account was suspended because it exceeded its resource limits.  If you unsuspend this account now, and its further resource consumption causes its reseller to exceed its reseller account limits, the entire reseller account (including all of its client accounts) will be suspended as a result.  Are you sure you want to unsuspend this account?"}',
	administrator: '{="Administrator"}',
	group_key: {
		group: '{="Group"}',
		parentresellerid: '{="Reseller"}',
		rpchostid: '{="Host"}',
		servertype: '{="Server type"}',
	},
	displaying_accounts: '{="Displaying %s-%s of %s account(s)"}',
	loading: '{="Loading"}',
	loading_accounts: '{="Loading accounts"}'
{/language}

{object name="accounts"}
	admin: {if $admin}1{else}0{/if},
	staff: {if $staff}1{else}0{/if},
	{if $staff}
	staffpermissions: {$staffpermissions|json_encode},
	{/if}
	softcompat: {$softcompat},
	rpchosts: {$rpchosts},
{if $admin>0}	resellers: {$resellers},
{/if}	sitename: '{$sitename|jsescape}',
	first_page: {$accounts_first_page},
{/object}

<!-- button tooltips -->
<div class="ctip" id="tip_login"><h1>{="Log in"}</h1>{="Log in to the account as the client."}</div>
<div class="ctip" id="tip_edit"><h1>{="Edit account"}</h1>{="Edit the settings and limits for this account."}</div>


<!-- row mouseover highlighting -->
<div id="rowover" style="display: none"></div>

<!-- row mouseover stream info -->
<div id="rowovertab" style="display: none">
    <div id="rowovertab_loading">
        <img src="../system/images/ajax-loading.gif" align="absmiddle" /> &nbsp;{="Loading"} ...
    </div>
    <div id="rowovertab_details">
        <div id="rowovertab_error">
        </div>
        <div id="rowovertab_stream">
            <div id="rowovertab_icons">
                <img id="rowovertab_serverstate" src='../theme/images/status/serverdown_small.png' /><br />
                <img id="rowovertab_sourcestate" src='../theme/images/status/sourcedown_small.png' /><br />
                <img id="rowovertab_autodjstate" src='../theme/images/status/autodjdown_small.png' />
            </div>
            <div id="rowovertab_streamtitle">{="Track details unavailable"}.</div>
            <div id="rowovertab_online">
                {="Now playing"}: <span id="rowovertab_songtitle">{="Unknown"}</span><br />
                {="Listeners"}: <span id="rowovertab_listeners">{="Unknown"}</span> {="at"} <span id="rowovertab_bitrate">{="Unknown"}</span>
            </div>
            <div id="rowovertab_offline">
                {="Currently offline"}.
            </div>
        </div>
        <div id="rowovertab_reseller">
            <div id="rowovertab_resellername"></div>
            
            <div id="rowovertab_isreseller">{="Reseller account"}.</div>
            
            <div id="rowovertab_resinfo">
                {="Accounts:"} <span id="rowovertab_resaccts">{="Unknown"}</span><br />
            </div>
        
        </div>
    </div>
</div>

<div id="tplaccountsdivider" style="display: none">
	<table>
	<tr>
		<td class="acct_divider" colspan="12"><div></div></td>
	</tr>
	</table>
</div>

<div id="tplaccount" style="display: none">
	<table>
	<tr>
		<td class="acct_cbox" align="center"><input type="checkbox" name="acctop[]" value="" /></td>
		<td class="acct_icon" align="center" sortby="0"><div class=""><!-- icon --></div></td>
		<td class="acct_user" sortby="x"><a href="#"><!-- username --></a></td>
		<td class="acct_titl"><!-- title --></td>

		<td class="acct_host"><!-- rpchost-title --></td>
		<td class="acct_port" align="center"><a target="_blank" href="#"><!-- port --></a></td>{/if}
		<td class="acct_serv" align="center"><!-- servertype --></td>

		<td class="acct_mcli" align="right"><!-- maxclients --></td>
		<td class="acct_bitr" align="right"><!-- maxbitrate --></td>
		<td class="acct_xfer" align="right" nowrap="nowrap">
			<div class="vmeter_bg" style="width: 3px; height: 12px">
				<div class="vmeter_fg" style="width: 3px; height: 0px; margin-top: 12px; background-color: green">&nbsp;</div>
			</div>
			<span><!-- cachedtransfer --></span>
		</td>
		<td class="acct_disk" align="right" nowrap="nowrap">
			<div class="vmeter_bg" style="width: 3px; height: 12px">
				<div class="vmeter_fg" style="width: 3px; height: 0px; margin-top: 12px; background-color: green">&nbsp;</div>
			</div>
			<span><!-- cacheddiskusage --></span>
		</td>
		<td class="acct_btns" align="center" nowrap="nowrap">
			{if ($staff==0) or ($staffpermissions|contains:"accounts_setuid")}<a class="acct_setuid" href="#"><img class="hastip" tip="#tip_login" src="../system/images/icons/setuid.png" border="0" align="absmiddle" alt="{="Login"}" /></a>{/if}
			{if ($staff==0) or ($staffpermissions|contains:"accounts_edit")}<a class="acct_edit" href="#"><img class="hastip" tip="#tip_edit" src="../system/images/icons/edit.png" border="0" align="absmiddle" alt="{="Edit"}" /></a>{/if}
		</td>
	</tr>
	</table>
</div>