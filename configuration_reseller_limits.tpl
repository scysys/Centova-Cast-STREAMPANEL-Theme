{javascript}<script>
	if (!window.centovacast) window.centovacast = {};
	window.centovacast.limitstab = {

		unlimited: [
			[ '#diskquota', 		'#nodiskquota' ],
			[ '#transferlimit', 	'#noxferlimit' ],
			[ '#maxclients', 		'#noclientlimit' ],
			[ '#resellerusers', 	'#nouserlimit' ],
			[ '#resellerbandwidth', '#nobwlimit' ],
		],

		update_limits: function(sender) {
			for (var i=0; i<this.unlimited.length; i++) {
				var $input = $(this.unlimited[i][0]);
				var $unlimited = $(this.unlimited[i][1]);
				var checked = $unlimited.is(':checked');
				$input.prop('disabled',checked);
				if (checked) $input.val('0');
			}
			
			var $nobwlimit = $('#nobwlimit');
			var $noxferlimit = $('#noxferlimit');
			var $transferlimit = $('#transferlimit');
			var $resellerbandwidth = $('#resellerbandwidth');
			var $nodiskquota = $('#nodiskquota');
			var $overselldata = $('#overselldata');
			var $overselldisk = $('#overselldisk');

			if (!$nobwlimit.is(':checked') && !$noxferlimit.is(':checked')) {
				if (sender) console.log(sender.id);
				if (sender && sender.id=='nobwlimit') {
					$transferlimit.val('0').prop('disabled',true);
					$noxferlimit.prop('checked',true);
				} else {
					$nobwlimit.prop('checked',true);
					$resellerbandwidth.val('0').prop('disabled',true);
				}
			}

			if ($noxferlimit.is(':checked')) {
				$overselldata.prop('checked',false).prop('disabled',true);
			} else {
				$overselldata.prop('disabled',false);
			}
			if ($nodiskquota.is(':checked')) {
				$overselldisk.prop('checked',false).prop('disabled',true);
			} else {
				$overselldisk.prop('disabled',false);
			}

		},

		initialize: function() {
			for (var i=0; i<this.unlimited.length; i++) {
				var $unlimited = $(this.unlimited[i][1]);
				$unlimited.click(function(e){
					window.centovacast.limitstab.update_limits(e.target);
				});
			}

			this.update_limits();
		}
	
}
</script>{/javascript}
{onready}
	window.centovacast.limitstab.initialize();
{/onready}

<table cellspacing="1" cellpadding="0" border="0">
<tr>
	<td width="170">{="Maximum bit rate"}:</td>
	<td colspan="3"><input type="text" name="config[maxbitrate]" size="5" maxlength="5" value="{$config.maxbitrate|htmlentities}" /> {$errors.maxbitrate|checkerror} {="Kbps"} {tip type="icon"}{="Specifies the maximum bit rate that this reseller can assign to each client account.  (Note that this is a per-client limit, not a combined total.)"}{/tip}</td>
</tr>
<tr>
	<td>{="Maximum accounts"}:</td>
	<td><input type="text" id="resellerusers" name="config[resellerusers]" size="5" maxlength="5" value="{$config.resellerusers|htmlentities}" /> {$errors.resellerusers|checkerror} {tip type="icon"}{="Specifies the maximum number of client accounts (i.e., streaming servers) the reseller can create."}{/tip}</td>
	<td colspan="2"><input type="checkbox" id="nouserlimit" name="config[nouserlimit]" value="1" {compare $config.resellerusers,0,"checked='checked' ",""}/> {="Unlimited"}</td>
</tr>
<tr>
	<td>{="Listener slots (total)"}:</td>
	<td><input type="text" id="maxclients" name="config[maxclients]" size="5" maxlength="5" value="{$config.maxclients|htmlentities}" /> {$errors.maxclients|checkerror} {tip type="icon"}{="Specifies the total number of potential listeners this reseller can host. This is a combined total limit for all client accounts created by this reseller."}{/tip}</td>
	<td colspan="2"><input type="checkbox" id="noclientlimit" name="config[noclientlimit]" value="1" {compare $config.maxclients,0,"checked='checked' ",""}/> {="Unlimited"}</td>
</tr>
<tr>
	<td>{="Disk quota"}:</td>
	<td><input type="text" id="diskquota" name="config[diskquota]" size="8" maxlength="8" value="{$config.diskquota|htmlentities}" /> {$errors.diskquota|checkerror} {="MB (soft quota)"} 		{tip type="icon"}{="Specifies the amount of disk space allocated to this reseller.  Note that this includes any media uploaded by the reseller's clients for the autoDJ as well as any client logs, configuration files, and so-on."}{/tip}&nbsp;&nbsp;</td>
	<td><input type="checkbox" id="nodiskquota" name="config[nodiskquota]" value="1" {compare $config.nodiskquota,0,"","checked='checked' "} /> {="Unlimited"}&nbsp;&nbsp;</td>
	<td><input type="checkbox" id="overselldisk" name="config[overselldisk]" value="1" {compare $config.overselldisk,0,"","checked='checked' "} /> {="Oversell"}</td>
</tr>
<tr>
	<td>{="Data transfer limit"}:&nbsp;</td>
	<td><input type="text" id="transferlimit" name="config[transferlimit]" size="8" maxlength="8" value="{$config.transferlimit|htmlentities}" /> {$errors.transferlimit|checkerror} {="MB/month"} {tip type="icon"}{="Specifies a monthly data transfer limit (in megabytes) for this reseller account.<br /><br />If you want to limit traffic based on bandwidth (in Kbps) instead, use the 'Bandwidth limit' option below."}{/tip}</td>
	<td><input type="checkbox" id="noxferlimit" name="config[noxferlimit]" value="1" {compare $config.noxferlimit,0,"","checked='checked' "}/> {="Unlimited"}</td>
	<td><input type="checkbox" id="overselldata" name="config[overselldata]" value="1" {compare $config.overselldata,0,"","checked='checked' "} /> {="Oversell"}</td>
</tr>
<tr>
	<td>{="Bandwidth limit"}:</td>
	<td><input type="text" id="resellerbandwidth" name="config[resellerbandwidth]" size="7" maxlength="7" value="{$config.resellerbandwidth|htmlentities}" /> {="Kbps"} {$errors.resellerbandwidth|checkerror} {tip type="icon"}{="Specifies the total amount of bandwidth (in Kbps -- NOT data transfer) which this reseller can allocate.  This is an alternative to specifying a data transfer limit.<br /><br />For example, 10 listener slots at 128Kbps would use 1280Kbps of bandwidth (10 x 128 = 1280).  5 slots at 128Kbps and 8 slots at 64Kbps would use<br />1152Kbps of bandwidth (5 x 128 + 8 x 64 = 1152).<br /><br />If you do not fully understand this feature, leave it set to 'Unlimited' and assign limits for the values above instead."}{/tip}</td>
	<td colspan="2"><input type="checkbox" id="nobwlimit" name="config[nobwlimit]" value="1" {compare $config.resellerbandwidth,0,"checked='checked' ",""}/> {="Unlimited"}</td>
</tr>

<tr><td colspan="4"><br /></td></tr>
<tr>
	<td>{="AutoDJ capabilities"}:</td>
	<td colspan="3">
		<select name="config[usesource]" size="1">
		<option value="1"{if $config.usesource==1} selected="selected"{/if}>{="Permitted"}</option>
		<option value="0"{if $config.usesource==0} selected="selected"{/if}>{="Prohibited (streams MUST use an offsite source)"}</option>
		</select>
		
		{tip type="icon"}{="If enabled, your resellers' clients will be allowed to upload their media to your server and use Centova Cast's autoDJ system to source their streams.  If disabled, an off-site source (i.e., on the client's home PC) must be used instead."}{/tip}
	</td>
</tr>

<tr><td colspan="4" style="font-size: 4px">&nbsp;</td></tr>
<tr>
	<td>{="When transfer limit is exceeded"}:&nbsp;</td>
	<td colspan="3">
		<select name="config[xferexceed]" size="1">
		<option value="auto"{if $config.xferexceed=="auto"} selected="selected"{/if}>{="Perform the default action"}</option>
		<option value="suspend"{if $config.xferexceed=="suspend"} selected="selected"{/if}>{="Suspend reseller and shutdown/suspend reseller's clients"}</option>
		<option value="none"{if $config.xferexceed=="none"} selected="selected"{/if}>{="Notify reseller and administrator but take no action"}</option>
		</select>
	</td>
</tr>
<tr>
	<td>{="When disk quota is exceeded"}:&nbsp;</td>
	<td colspan="3">
		<select name="config[quotaexceed]" size="1">
		<option value="auto"{if $config.quotaexceed=="auto"} selected="selected"{/if}>{="Perform the default action"}</option>
		<option value="suspend"{if $config.quotaexceed=="suspend"} selected="selected"{/if}>{="Suspend reseller and shutdown/suspend reseller's clients"}</option>
		<option value="none"{if $config.quotaexceed=="none"} selected="selected"{/if}>{="Notify reseller and administrator but take no action"}</option>
		</select>
	</td>
</tr>
<tr><td colspan="4" style="font-size: 4px">&nbsp;</td></tr>
<tr>
	<td width="100">{="Raw configuration"}:</td>
	<td colspan="3">
		<select name="config[rawconfig]" size="1">
		<option value="0"{check $config.rawconfig==0} selected="selected"{/check}>{="Prohibited"}</option>
		<option value="1"{check $config.rawconfig>0} selected="selected"{/check}>{="Permitted"}</option>
		</select>
		{$errors.rawconfig|checkerror} {tip type="icon"}{="Allows the user to edit the raw stream configuration files.  As this poses a potential security risk and allows the user to bypass many account limits, only trusted users should receive this privilege."}{/tip}
	</td>
</tr>
<tr>
	<td>{="Port 80 proxy"}:</td>
	<td colspan="3">
		<select name="config[allowproxy]" size="1">
		<option value="1"{if $config.allowproxy==1} selected="selected"{/if}>{="Permitted"}</option>
		<option value="0"{if $config.allowproxy==0} selected="selected"{/if}>{="Prohibited"}</option>
		</select>
		{tip type="icon"}{="If enabled, your resellers' clients will be permitted to use Centova Cast's port-80 proxy to access streams from behind restrictive firewalls.<br /><br />Note that enabling this feature may dramatically affect your server's performance if used on busy streams; consult the documentation for more information."}{/tip}
	</td>
</tr>
</table>

