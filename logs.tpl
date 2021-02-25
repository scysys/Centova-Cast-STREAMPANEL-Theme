{resource type="js" class="progress"}
{resource type="js" src="/system/logs.js" depends="progress"}
{resource type="css" src="/theme/logs.css"}

{css}
.m-portlet__head.sp-box-table {
background-color: #1E1E2D;
border-color: #1E1E2D;
}
.m-portlet__head-text.sp-box-table {
color: white !important;
}
.sp-dj-table-tr {
background-color: #1E1E2D;
border-color: #1E1E2D;
color: white;
}
.m-subheader {
display: none;
}
code {
background: transparent !important;
}
.m-portlet__body {
background-color: #F0F0F0;
}
.m-portlet__foot {
background-color: #1E1F2D;
}
a:link, a:visited, a:active, a:hover {
color: white !important;
}
.col-lg-6.m--valign-middle {
color: white;
}
{/css}

{language}
	log_archive: {
		title: '{="Log Download"}',
		subtitle: '{="Archiving logs"}',
		complete: null,
		initializing: '{="Initializing"}',
		download: '{="Download"}',
		cancel: '{="Cancel"}'
	}
{/language}

{options type="log"}
	type: '{$type|jsescape}',
	servertype: '{$account.servertype|jsescape}',
	sourcetype: '{$sourcetype|jsescape}',
{/options}

{onready}
	LogInterface.log_highlight($('#logtext'));

	$('#log_download').click(function(){
		LogInterface.log_archive('{$account.username|htmlentities}');
		return false;
	});
{/onready}

{heading}
<div style="margin-top: 15px; float: right; text-align: right; font-size: 11px">
	{="View"}:
	{check $type!="access"}{="Access Log"}{/check}
    {if $type!="error"}{="Error Log"}{/if}
	{if $type!="source"}{="AutoDJ (Source) Log"}</a>{/if}<br />

	{if $allowlogdownload>0}
	{="Download"}: <a href="#" id="log_download">{="All logs"}</a><br />
	{/if}
</div>
{/heading}

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {$logtitle} </h3>
</div>
</div>
</div>
<div class="m-portlet__body">

<div id="logtext">
<code>{$loglines}</code>
</div>

</div>

<div class="m-portlet__foot">
<div class="row align-items-center">
<div class="col-lg-6 m--valign-middle">
<strong>{="Page"}:</strong> {$_multipage.nav}<br />
<span style="font-size: 10px; color: #909090">{="Note: Pages are ordered from oldest to newest.  Be sure to navigate to the last page to see the most recent log data."}</span>
</div>
</div>
</div>

</div>
