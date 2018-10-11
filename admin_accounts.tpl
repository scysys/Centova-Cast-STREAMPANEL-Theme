{language}
	multiple_accounts: {
		'suspend_selected_title': '{="Suspend Accounts"}',
		'suspend_selected_subtitle': '{="Suspending accounts ..."}',
		'suspend_selected_confirm': '{="Are you sure you want to suspend the %s selected account(s)?"}',

		'unsuspend_selected_title': '{="Unsuspend Accounts"}',
		'unsuspend_selected_subtitle': '{="Unsuspending accounts ..."}',
		'unsuspend_selected_confirm': '{="Are you sure you want to unsuspend the %s selected account(s)?"}',

		'delete_selected_title': '{="Delete Accounts"}',
		'delete_selected_subtitle': '{="Deleting accounts ..."}',
		'delete_selected_confirm': '{="Are you sure you want to permanently delete the %s selected account(s)?"}',

		'start_selected_title': '{="Start Streams"}',
		'start_selected_subtitle': '{="Starting streams ..."}',
		'start_selected_confirm': '{="Start the %s selected stream(s) now?"}',

		'stop_selected_title': '{="Stop Streams"}',
		'stop_selected_subtitle': '{="Stopping streams ..."}',
		'stop_selected_confirm': '{="Are you sure you want to stop the %s selected stream(s)?"}'

	},
	multiple_accounts_summary: '{="Processed %d accounts, %d successful, %d errors"}',
	select_an_account: '{="Please select at least one account first"}.',
	processing_account: '{="Processing account %s ..."}',
	processing_complete: '{="Complete"}',
	processing_close: '{="Close"}',
	processing_success: '{="OK"}',
	account_is_suspended: '{="Account is suspended"}.',
	stream_is_offline: '{="Stream is offline"}.'
{/language}
<div id="newacct" class="dialogcontent">
{include "new_account_form.tpl"}
</div>

<div id="multacctdialog" class="dialogcontent">
    <img class="dialogicon" src="../theme/images/subsections/accounts.png" />
    <h1></h1>
    <h2></h2>
    
    <div id="status"><br /></div>

    <div id="multacctlog"></div>
    
	{$_|ccmeter:100:multacctprogressbar}
	
	<input type="button" id="multacctokbtn" value=" ... " />
</div>

<div id="confirmdialog" style="display: none">
	<h1 id="confirm_header"></h1>
	<form>
		<span id="confirm_question"></span>
		<br /><br />

		<input type="button" id="confirmdialog_continue" value="{="Continue"}" /> <input type="button" id="confirmdialog_cancel" value="{="Cancel"}" />
	</form>
</div>

<div id="resellerdeletedialog" style="display: none">
	<h1>{="Reseller Deletion"}</h1>
	<form>
		{="You have selected %s reseller account(s) for deletion.  How would you like to handle the resellers' client accounts?","<span id='resellerdeletecount'></span>"}
		<br /><br />

		<input type="radio" name="resellerdialogaction" id="resellerdialogaction_reparent" value="reparent" checked="checked"> <label for="resellerdialogaction_reparent">{="Move the clients to another reseller"}:</label><br />
		<select id="resellerdeletedialog_resellers" size="1">
		</select>
		<br /><br />

		<input type="radio" name="resellerdialogaction" id="resellerdialogaction_delete" value="delete"> <label for="resellerdialogaction_delete">{="Delete the client accounts"}</label><br /><br />
		<input type="button" id="resellerdeletedialog_continue" value="{="Continue"}" /> <input type="button" id="resellerdeletedialog_cancel" value="{="Cancel"}" />
	</form>
</div>

<div id="loading" style="display: none">
	{$_|ccmeter:100:loadingprogressbar}
	<div class="loading_status">
	</div>
</div>

{box class="buttonbar"}
<ul class="rightbuttons">
	<li id="start_selected" class="btnstart multiple_account_button" data-perm="accounts_control"><div><a href="#">{="Start"}</a></div></li>
	<li id="stop_selected" class="btnstop multiple_account_button" data-perm="accounts_control"><div><a href="#">{="Stop"}</a></div></li>
	<li id="suspend_selected" class="btnsuspend multiple_account_button" data-perm="accounts_status"><div><a href="#">{="Suspend"}</a></div></li>
	<li id="unsuspend_selected" class="btnunsuspend multiple_account_button" data-perm="accounts_status"><div><a href="#">{="Unsuspend"}</a></div></li>
	<li id="delete_selected" class="btndelete multiple_account_button" data-perm="accounts_delete"><div><a href="#">{="Delete"}</a></div></li>

	<li id="changeview" class="btnview buttonbar_enabled"><div><a href="#">{="View"}</a></div></li>

	<li class="boxsearch buttonbar_box"><div><input id="accountsearch" type="text" value="{="Search"} ..." /></div></li>

	<li class="btnprev pagenav buttonbar_enabled buttonbar_nosep buttonbar_nopad buttonbar_padleft"><div><a href="#"></a></div></li>
	<li class="boxsort pagenav buttonbar_box buttonbar_nosep buttonbar_nopad">
		<div>
			<select class="accountpage" style="width: 40px">
			<optgroup label="{="Page"}:">
			<option value="0">1</option>
			</optgroup>
			</select>
		</div>
	</li>
	<li class="btnnext pagenav buttonbar_enabled buttonbar_nopad"><div><a href="#"></a></div></li>
</ul>
<ul>
	<li id="btnnew" class="btnnew buttonbar_enabled" data-perm="accounts_create"><div><a href="#">{="New account"}</a></div></li>
</ul>

<div id="viewoptions">
	<div class="buttonbar_vdivider"></div>
	<form>
		{="Show"}: <select class="acct_view_reseller acct_view_field"></select>
		<select class="acct_view_server acct_view_field"></select>
		<select class="acct_view_servertype acct_view_field"></select>
		<select class="acct_view_sort acct_view_field">
			<optgroup label="{="Sort by"}:">
			<option value="parentresellerid">{="Reseller"}/{="Username"}</option>
			<option value="rpchostid">{="Host"}/{="Username"}</option>
			<option value="servertype">{="Server type"}/{="Username"}</option>
			<option value="username">{="Username"}</option>
			<option value="title">{="Title"}</option>
			<option value="port">{="Port"}</option>
			<option value="maxclients">{="Clients"}</option>
			<option value="maxbitrate">{="Bitrate"}</option>
			<option value="cachedtransfer">{="Data Xfer"} ({="Used"})</option>
			<option value="transferlimit">{="Data Xfer"} ({="Limit"})</option>
			<option value="cacheddiskusage">{="Disk Space"} ({="Used"})</option>
			<option value="diskquota">{="Disk Space"} ({="Quota"})</option>
			</optgroup>
		</select>
	</form>
</div>

{/box}

<form>
<div>

	<div class="accountgroup">

		{box id="no_accounts" title="Accounts"}
			{="No accounts have been created"}.
		{/box}

		<div class="tablewrapper" id="accounts_list">
		<table class="accountslist listtable grouptable sortable" width="100%" cellspacing="1" cellpadding="2">
		<thead>
		<tr>
			<th width="18" align="center" class="hdg_cbox sort_nosort"><input type="checkbox" /></th>
			<th width="20" align="center" class="hdg_icon sort_reset"></th>
			<th width="100" class="hdg_user">{="Username"}</th>
			<th class="hdg_titl">{="Title"}</th>
			<th width="80" style="text-align: center" class="hdg_host">{="Server"}</th>
			<th width="40" style="text-align: center" class="hdg_port">{="Port"}</th>
			<th width="55" style="text-align: center" class="hdg_serv">{="Type"}</th>
			<th width="40" style="text-align: right" class="hdg_mcli">{="Clients"}</th>
			<th width="55" style="text-align: right" class="hdg_bitr">{="Bitrate"}</th>
			<th width="65" style="text-align: right" class="hdg_xfer">{="Data Xfer"}</th>
			<th width="65" style="text-align: right" class="hdg_disk">{="Disk Space"}</th>
			<th width="50" class="sort_nosort">&nbsp;</th>
		</tr>
		</thead>

		<tbody id="accounts"><!-- accounts here --></tbody>

		</table>
		</div>

	</div>

</div>

{box class="buttonbar" id="accounts_bottombar"}
<ul class="rightbuttons">
	<li class="btnprev pagenav buttonbar_enabled buttonbar_nosep buttonbar_nopad buttonbar_padleft"><div><a href="#"></a></div></li>
	<li class="boxsort pagenav buttonbar_box buttonbar_nosep buttonbar_nopad">
		<div>
			<select class="accountpage" style="width: 40px">
			<optgroup label="{="Page"}:">
				<option value="0">1</option>
			</optgroup>
			</select>
		</div>
	</li>
	<li class="btnnext pagenav buttonbar_enabled buttonbar_nopad"><div><a href="#"></a></div></li>
</ul>
<ul>
	<li class="boxsort pagenav buttonbar_box">
		<div>
			<select class="accountlimit" style="width: 100px">
			<optgroup label="{="Accounts per page"}:">
			<option value="25">{="%d accounts",25}</option>
			<option value="50">{="%d accounts",50}</option>
			<option value="100">{="%d accounts",100}</option>
			<option value="0">{="All accounts"}</option>
			</optgroup>
			</select>
		</div>
	</li>
</ul>
{/box}

</form>