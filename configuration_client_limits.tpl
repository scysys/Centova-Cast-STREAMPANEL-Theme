{javascript}<script>
if (!window.centovacast) window.centovacast = {};
window.centovacast.limitstab = {

	unlimited: [
		[ '#diskquota', 	'#nodiskquota' ],
		[ '#transferlimit', '#noxferlimit' ],{if $usemountpoints>0}
		[ '#mountlimit', 	'#nomplimit' ]{/if}
	],

	update_limits: function() {
		for (var i=0; i<this.unlimited.length; i++) {
			var $input = $(this.unlimited[i][0]);
			var $unlimited = $(this.unlimited[i][1]);
			var checked = $unlimited.is(':checked');
			$input.prop('disabled',checked);
			if (checked) $input.val('0');
		}
	},

{check $resellerlimits.maxbandwidth>0}
	update_bandwidth: function(sender) {
		var maxbandwidth = parseInt('{$resellerlimits.maxbandwidth|jsescape}',10);
		var absmaxbitrate = parseInt('{$resellerlimits.maxbitrate|jsescape}',10);
		var absmaxslots = parseInt('{$resellerlimits.maxclients|jsescape}',10);

		var $mc = $('#maxclients');
		var mcval = parseInt($mc.val(),10);

		var $mb = $('#maxbitrate');
		var mbval = parseInt($mb.val(),10);

		var setbyslot = false;
		if (sender && sender.id == 'maxclients') setbyslot = true;
		if (setbyslot) {

			$('#bwbylisteners').show();
			$('#bwbybitrate').hide();

			$('#bwbylisteners_slots').text(mcval);

			if (absmaxslots>0) {
				$mc.css({ color: (parseInt(mcval,10)>absmaxslots) ? 'red' : '' });
			}

			var maxbitrate = Math.floor(maxbandwidth / mcval);
			if ( (absmaxbitrate>0) && (maxbitrate>absmaxbitrate) ) maxbitrate = absmaxbitrate;
			$('#bwbylisteners_bitrate').text(maxbitrate);

			if (mbval>maxbitrate) $mb.val(maxbitrate);
			$mb.css({ color: '' });
		} else {
			$('#bwbylisteners').hide();
			$('#bwbybitrate').show();

			$('#bwbybitrate_bitrate').text(mbval);
			if (absmaxbitrate>0) $mb.css({ color: (mbval>absmaxbitrate) ? 'red' : '' });

			var maxslots = Math.floor(maxbandwidth / mbval);
			if ( (absmaxslots>0) && (maxslots>absmaxslots) ) maxslots = absmaxslots;
			$('#bwbybitrate_slots').text(maxslots);

			if (mcval>maxslots) $mc.val(maxslots);
			$mc.css({ color: '' });
		}

	},
{/check}

	check_limits: function(sender) {
		var absmaxbitrate = parseInt('{$resellerlimits.maxbitrate|jsescape}',10); 	if (isNaN(absmaxbitrate)) absmaxbitrate = 0;
		var absmaxslots = parseInt('{$resellerlimits.maxclients|jsescape}',10);	 	if (isNaN(absmaxslots)) absmaxslots = 0;
		var absmaxxfer = parseInt('{$resellerlimits.transferlimit|jsescape}',10);	if (isNaN(absmaxxfer)) absmaxxfer = 0;
		var absmaxdisk = parseInt('{$resellerlimits.diskquota|jsescape}',10);		if (isNaN(absmaxdisk)) absmaxdisk = 0;
		{if $usemountpoints>0}var absmaxmounts = parseInt('{$resellerlimits.mountlimit|jsescape}',10);	if (isNaN(absmaxmounts)) absmaxmounts = 0;{/if}

		var $mc = $('#maxclients'); $mc.css({ color: ( (absmaxslots>0) && (parseInt($mc.val(),10)>absmaxslots) ) ? 'red' : '' });
		var $mb = $('#maxbitrate'); $mb.css({ color: ( (absmaxbitrate>0) && (parseInt($mb.val(),10)>absmaxbitrate) ) ? 'red' : '' });
		var $tl = $('#transferlimit'); $tl.css({ color: ( (absmaxxfer>0) && (parseInt($tl.val(),10)>absmaxxfer) ) ? 'red' : '' });
		var $dq = $('#diskquota'); $dq.css({ color: ( (absmaxdisk>0) && (parseInt($dq.val(),10)>absmaxdisk) ) ? 'red' : '' });
		{if $usemountpoints>0}
		var $ml = $('#mountlimit');
		var mlval = parseInt($ml.val(),10);
		$ml.css({ color: ( ((absmaxmounts>0) && (mlval>absmaxmounts)) || (absmaxmounts!=0 && mlval==0) ) ? 'red' : '' });
		{/if}
	},

	initialize: function() {
		for (var i=0; i<this.unlimited.length; i++) {
			var $input = $(this.unlimited[i][0]);
			var $unlimited = $(this.unlimited[i][1]);
			$input.change(this.check_limits);
			$unlimited.click(function(e){
				window.centovacast.limitstab.update_limits();
				window.centovacast.limitstab.check_limits(e.target);
			});
		}

		$('#mountlimit').closest('form').submit(function(){
			$('#mountlimit').prop('disabled',false);
		});

		this.update_limits();
{check $resellerlimits.maxbandwidth>0}		this.update_bandwidth();{/check}
		this.check_limits();

		$('#maxclients,#maxbitrate').change(function(){
			window.centovacast.limitstab.{check $resellerlimits.maxbandwidth>0}update_bandwidth{otherwise}check_limits{/check}(this);
		});

	}
};
</script>
{/javascript}

{onready}
	window.centovacast.limitstab.initialize();
{/onready}

<table cellspacing="1" cellpadding="0" border="0">
	
{check $resellerlimits.maxbandwidth>0}
<tr>
	<td colspan="2">
	{="You may allocate up to %s%s Kbps%s from your %s%s Kbps%s reseller account limit.","<strong>",$resellerlimits.maxbandwidth,"</strong>","<strong>",$resellerlimits.resellerbandwidth,"</strong>"}
	
	{if $resellerlimits.maxbitrate>0}{="You may create streams with maximum bit rates of up to %s%s Kbps%s.","<strong>",$resellerlimits.maxbitrate,"</strong>"}{/if}
	{if $resellerlimits.maxclients>0}{="You have %s%s%s listener slots remaining from your reseller account limit.","<strong>",$resellerlimits.maxclients,"</strong>"}{/if}
	
	<br /><br />

	<div id="bwbylisteners" class="hide">
	{="With a listener limit of %s slots, this means that you can allocate a maximum bit rate of up to %s Kbps.","<span id='bwbylisteners_slots' style='font-weight: bold'></span>","<span id='bwbylisteners_bitrate' style='font-weight: bold'></span>"}
	</div>
	<div id="bwbybitrate" class="hide">
	{="With a bit rate limit of %s Kbps, this means that you can allocate up to %s listener slots.","<span id='bwbybitrate_bitrate' style='font-weight: bold'></span>","<span id='bwbybitrate_slots' style='font-weight: bold'></span>"}
	</div>

	</td>
</tr>
<tr><td colspan="2" style="font-size: 4px">&nbsp;</td></tr>
{/check}
<tr>
	<td>{="Maximum listeners"}:</td>
	<td><input type="text" id="maxclients" name="config[maxclients]" size="5" maxlength="5" value="{$config.maxclients|htmlentities}" /> {="slots"} {$errors.maxclients|checkerror}</td>
</tr>
{check ($resellerlimits.maxclients>0) and ($resellerlimits.maxbandwidth<=0)}
<tr>
	<td></td>
	<td>{="You may allocate up to %s%s%s listener slots from your reseller account limit.","<strong>",$resellerlimits.maxclients,"</strong>"}</td>
</tr>
<tr><td colspan="2" style="font-size: 4px">&nbsp;</td></tr>
{/check}
<tr>
	<td>{="Maximum bit rate"}:</td>
	<td><input type="text" id="maxbitrate" name="config[maxbitrate]" size="5" maxlength="5" value="{$config.maxbitrate|htmlentities}" /> {$errors.maxbitrate|checkerror} {="Kbps"}</td>
</tr>
{check ($resellerlimits.maxbitrate>0) and ($resellerlimits.maxbandwidth<=0)}
<tr>
	<td></td>
	<td>{="You may assign a bit rate of up to %s%s Kbps%s.","<strong>",$resellerlimits.maxbitrate,"</strong>"}</td>
</tr>
<tr><td colspan="2" style="font-size: 4px">&nbsp;</td></tr>
{/check}
<tr>
	<td>{="Transfer limit"}:&nbsp;</td>
	<td><input type="text" id="transferlimit" name="config[transferlimit]" size="8" maxlength="8" value="{$config.transferlimit|htmlentities}" /> {$errors.transferlimit|checkerror} {="MB/month"}&nbsp;</td>
</tr>
<tr>
	<td></td>
	<td>
		{check $resellerlimits.transferlimit>0}
			{="You may allocate up to %s%s MB%s from your reseller account limit.","<strong>",$resellerlimits.transferlimit,"</strong>"}
		{otherwise}
			<input type="checkbox" id="noxferlimit" name="config[noxferlimit]" value="1" {compare $config.noxferlimit,0,"","checked='checked' "} /> {="Unlimited"}
		{/check}
	</td>
</tr>
<tr><td colspan="2" style="font-size: 4px">&nbsp;</td></tr>
<tr>
	<td>{="Disk quota"}:</td>
	<td>
		<input type="text" id="diskquota" name="config[diskquota]" size="8" maxlength="8" value="{$config.diskquota|htmlentities}" /> {$errors.diskquota|checkerror} {="%s MB",""}&nbsp;
		{tip type="icon"}{="Specifies the amount of disk space allocated to this client.  Note that this includes any media uploaded for the autoDJ as well as any logs, configuration files, and so-on for this account."}{/tip}
	</td>
</tr>
<tr>
	<td></td>
	<td>
		{check $resellerlimits.diskquota>0}
			{="You may allocate up to %s%s MB%s from your reseller account limit.","<strong>",$resellerlimits.diskquota,"</strong>"}
		{otherwise}
			<input type="checkbox" id="nodiskquota" name="config[nodiskquota]" value="1" {compare $config.nodiskquota,0,"","checked='checked' "} /> {="Unlimited"}
		{/check}
	</td>
</tr>
{check $usemountpoints>0}
<tr>
	<td>{="Mount point limit"}:&nbsp;</td>
	<td><input type="text" id="mountlimit" name="config[mountlimit]" size="8" maxlength="8" value="{$config.mountlimit|htmlentities}" {if $config.mountlimit==0}disabled="disabled" {/if}/> {$errors.mountlimit|checkerror} {="mount points"}&nbsp;</td>
</tr>
<tr>
	<td></td>
	<td>
		{/check}{check ($usemountpoints>0) && ($resellerlimits.mountlimit>0)}
		{="You may allocate up to %s%s%s mount points from your reseller account limit.","<strong>",$resellerlimits.mountlimit,"</strong>"}
		{otherwisecheck $usemountpoints>0}
		<input type="checkbox" id="nomplimit" {compare $config.mountlimit,0,"checked='checked' ",""} /> {="Unlimited"}
		{/check}{check $usemountpoints>0}
	</td>
</tr>
{/check}
<tr><td colspan="2" style="font-size: 4px">&nbsp;</td></tr>

{check $actual_admin>0}
<tr>
	<td>{="When transfer limit is exceeded"}:&nbsp;</td>
	<td>
		<select name="config[xferexceed]" size="1">
		<option value="auto"{if $config.xferexceed=="auto"} selected="selected"{/if}>{="Perform the default action"}</option>
		<option value="suspend"{if $config.xferexceed=="suspend"} selected="selected"{/if}>{="Shutdown streaming server and suspend account"}</option>
		<option value="none"{if $config.xferexceed=="none"} selected="selected"{/if}>{="Notify client and administrator but take no action"}</option>
		</select>
	</td>
</tr>
<tr>
	<td>{="When disk quota is exceeded"}:&nbsp;</td>
	<td>
		<select name="config[quotaexceed]" size="1">
		<option value="auto"{if $config.quotaexceed=="auto"} selected="selected"{/if}>{="Perform the default action"}</option>
		<option value="suspend"{if $config.quotaexceed=="suspend"} selected="selected"{/if}>{="Shutdown streaming server and suspend account"}</option>
		<option value="none"{if $config.quotaexceed=="none"} selected="selected"{/if}>{="Notify client and administrator but take no action"}</option>
		</select>
	</td>
</tr>
{/check}


{if ($actual_admin>0) or ($changerawconfigpermitted>0)}
<tr><td colspan="2" style="font-size: 4px">&nbsp;</td></tr>
<tr>
	<td>{="Raw configuration"}:</td>
	<td>
		<select name="config[rawconfig]" size="1">
		<option value="0"{check $config.rawconfig==0} selected="selected"{/check}>{="Prohibited"}</option>
		<option value="1"{check $config.rawconfig>0} selected="selected"{/check}>{="Permitted"}</option>
		</select>
		{$errors.rawconfig|checkerror} {tip type="icon"}{="Allows the user to edit the raw stream configuration files.  As this poses a potential security risk and allows the user to bypass many account limits, only trusted users should receive this privilege."}{/tip}
	</td>
</tr>
{/if}

{if $caps.suppress_port80proxy==0}
<tr><td colspan="2" style="font-size: 4px">&nbsp;</td></tr>
<tr>
	<td>{="Port 80 proxy"}:</td>
	<td>
		<select name="config[allowproxy]" size="1"{check $proxypermitted==0} disabled="disabled"{/check}>
		<option value="0"{check $config.allowproxy==0} selected="selected"{/check}>{="Prohibited"}</option>
		<option value="1"{check $config.allowproxy>0} selected="selected"{/check}>{="Permitted"}</option>
		</select>
		{$errors.allowproxy|checkerror}
	</td>
</tr>
{/if}
</table>
