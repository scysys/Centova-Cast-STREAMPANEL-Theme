{resource type="js" class="progress"}
{resource type="js" src="/system/logs.js" depends="progress"}
{resource type="css" src="/theme/logs.css"}

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
	{check $type!="access"}<a href="{$pageself}&type=access">{="Access Log"}</a> {if $type!="error"}|{/if} {/check}
	{if $type!="error"}<a href="{$pageself}&type=error">{="Error Log"}</a>{/if}
	{if $type!="source"}| <a href="{$pageself}&type=source">{="AutoDJ (Source) Log"}</a>{/if}<br />

	{if $allowlogdownload>0}
	{="Download"}: <a href="#" id="log_download">{="All logs"}</a><br />
	{/if}
</div>
{/heading}

{box title=$logtitle}
<div id="logtext">
{$loglines}
</div>
{/box}
{box}
{="Page"}: {$_multipage.nav}<br />

<span style="font-size: 10px; color: #909090">{="Note: Pages are ordered from oldest to newest.  Be sure to navigate to the last page to see the most recent log data."}</span>

{/box}
