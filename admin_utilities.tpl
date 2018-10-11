{resource type="js" class="progress"}
{language}
	optimize_database: {
		title: '{="Optimizing Database"}',
		subtitle: '{="Please wait"}',
		complete: '{="Complete"}',
		initializing: '{="Initializing"}',
		close: '{="Close"}'
	}
{/language}
{resource type="js" src="/system/progressiveoperation.js" id="progop" depends="common,rpc"}
{resource type="js" src="/system/progresswindow.js" depends="common,progop"}

<script language="javascript">
function optimize_database() {

	var self = this;
	RPCPushProgressWindow.create(
		'/admin/rpc.php',
		'utilities.optimizedb',
		[ ],
		{ },
		window.lang.optimize_database
	);

	return false;
}
</script>

{box title="System Management Utilities"}
	{="Warning: These utilities are intended for advanced administrators only and/or for the use of Centova Technologies staff when troubleshooting your server."}<br /><br />
	{="Incorrect use of these utilities is likely to permanently damage your Centova Cast installation."}<br /><br />

	<table cellsacing="0" cellpadding="0" border="0">
	<tr><td width="125">{="Sessions"}:</td>	<td><a href="?page=sessions">{="Current login sessions"}</a></td></tr>
	<tr><td colspan="2"><br /></td></tr>
	<tr><td width="125">{="Database"}:</td>	<td><a href="/admin/db/" target="_blank">{="Manage database"}</a></td></tr>
	<tr><td></td>							<td><a href="#" onclick="return optimize_database()">{="Optimize database"}</a></td></tr>
	</table>

{/box}

{box title="Legacy Features"}
	<a href="?page=remoteservers">{="Configure single sign-on"}</a>

{/box}

{box title="Experimental Features"}
	<a href="?page=regions">{="Region management"}</a><br />
{/box}
