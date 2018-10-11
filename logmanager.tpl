{resource type="css" src="/theme/popupmenu.css"}
{resource type="css" src="/system/jquery.layout.default.css"}
{resource type="css" src="/theme/logmanager.css"}

{resource type="js" class="rpc"}
{resource type="js" src="/system/debug.js"}
{resource type="js" class="uiwidgets"}
{resource type="js" class="logviewer"}

{language}
	ok: '{="OK"}',
	log_manager: '{="Log Manager"}',
	event_log: '{="Event Log"}',
	server_logs: '{="Server Logs"}',
	system: '{="System"}',
	account: '{="Account"}',
	date: '{="Date"}',
	details: '{="Details"}',
	keyword: '{="Keyword"}',
	trim_log: '{="Trim Log"}',
	trimming_log: '{="Trimming log file, please wait"} ...'
{/language}


<form method="post" action="index.php?page=logs">

<div id="logmanagerlayout">
	<div id="logbrowser" class="tvt">
	</div>

	<div id="logviewer" style="z-index: 2" class="lbt">
	</div>

	<div id="statuspane" class="pane">

		<div id="options" class="statuscontents">
			<div style="float: right">
				{if ($staff==0) or ($staffpermissions|contains:"logs_trim")}
				<span id="purgelog">
					<input class="pagenav" type="button" id="logtrim" value="{="Trim log"}" />
					<select id="logtrimretain">
						<option value="1yr">{="to 1 year"}</option>
						<option value="6mo">{="to 6 months"}</option>
						<option value="1mo">{="to 1 month"}</option>
						<option value="2wk" selected="selected">{="to 2 weeks"}</option>
						<option value="today">{="to today"}</option>
					</select>
					&nbsp;&nbsp;&nbsp;
				</span>
				{/if}
				<input class="pagenav" type="text" id="logkeyword" size="20" value="" /> &nbsp;
				<input class="pagenav" type="button" id="btn_prev" value="&lt; {="Prev"}" /> &nbsp;
				<select class="pagenav" id="pageselect" size="1"><option value="0">{="Page"} ...</option></select> &nbsp;
				<input class="pagenav" type="button" id="btn_next" value="{="Next"} &gt;" /> &nbsp;
			</div>

			<input type="button" onclick="window.location = 'index.php'" value="{="Return"}" /> &nbsp;&nbsp;&nbsp;&nbsp;

			<span id="clipboardstatus" class="statuscontents"></span>
		</div>
	</div>

</div>

<div id="tipdlg" class="ctip">
	<div class="tipdlg_text"></div>

	<div class="tipdlg_progress" style="margin-left: 100px">{$_|ccmeter:100:.tipdlg_meter}</div>
</div>
