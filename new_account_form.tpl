    <form method="get" action="index.php" style="margin: 0px" id="newacct_form">

    <img class="dialogicon" src="../theme/images/subsections/{if $template_editor==0}newaccount{else}templates{/if}.png" />
    
    {if $template_editor==0}
    <h1>{="Account Management"}</h1>
    <h2>{="New account"}</h2>
    {else}
    <h1>{="Feature Management"}</h1>
    <h2>{="New account template"}</h2>
    {/if}

	<input type="hidden" name="page" value="{$accountsmodule}" />
	<input type="hidden" name="action" value="create" />

    <table cellspacing="2" cellpadding="0" border="0" width="100%">
    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
	
    {check $cancreate>0}
    <tr>
        <td>{="Type"}:</td>
        <td>
            <select id="newacct_accounttype" name="accounttype">
			{if $admin>0}
			<option value="user">{="User"}</option>
			<option value="reseller">{="Reseller"}</option>
			{else}
			<option value="user">{="Manual entry"}</option>
			{/if}
            {if $template_editor==0}
			<option value="template">{="From template"}</option>
            {/if}
			</select>
        </td>
    </tr>
	{otherwise}
	<tr><td colspan="2">{="You have reached your account creation limits - %s.",$cannot_create_reason}</td></tr>
	{/check}
	
	{check $cancreate==0}
	{otherwisecheck $template_editor>0}
	{otherwise}
    <tr id="newacct_templaterow">
        <td>{="Template"}:</td>
        <td>
            <select id="newacct_template" name="accounttemplate" style="width: 150px">
			<option value="">{="Select template..."}</option>
			{loop $accounttemplate=$accounttemplates}
			<option value="{$accounttemplate.name|htmlentities}">{$accounttemplate.name|htmlentities} ({$accounttemplate.title|htmlentities})</option>
			{/loop}
			</select>
        </td>
    </tr>
	{/check}
	
	{check $cancreate==0}
	{otherwisecheck $rpchosts|count<2}
	<input type="hidden" id="newacct_rpchostid" name="rpchostid" value="{$rpchostid}" />
	{otherwise}
    <tr id="newacct_clusterrow">
        <td>{="Host"}:</td>
        <td>
			<select id="newacct_clusterhost" name="rpchostid">
			<option value="">{="Select cluster host..."}</option>
			<option value="0" selected="selected">{="Automatically choose best"}</option>
			{loop $rpchost=$rpchosts}
			<option value="{$rpchost.id}">{$rpchost.title|htmlentities}{if $admin>0} ({$rpchost.ipaddress|htmlentities}){/if}</option>
			{/loop}
			{loop $region=$regions}
			<option value="rgn:{$region.id}">{="Region"}: {$region.title|htmlentities}</option>
			{/loop}
			</select>
        </td>
    </tr>
	{/check}	
	
	{check $cancreate==0}
	{otherwise}
    <tr id="newacct_serverrow">
        <td>{="Server type"}:</td>
        <td>
			<select id="newacct_server" name="servertype">
			<option value="">{="Select server type..."}</option>
			{loop $servertype=$servertypes}
			<option value="{$_loop.key}">{$servertype|htmlentities}</option>
			{/loop}
			</select>
        </td>
    </tr>
	{/check}
	
	{check $cancreate==0}
	{otherwisecheck ($account.reseller>0) and ($account.usesource==0)}
		<input type="hidden" name="sourcetype" value="none" />
	{otherwise}
    <tr id="newacct_sourcerow">
        <td>{="AutoDJ type"}:</td>
        <td>
			<select id="newacct_source" name="sourcetype">
			<option value="">{="Select autoDJ type..."}</option>
			<option value="none">{="None"}</option>
			{loop $sourcetype=$sourcetypes}
			<option value="{$_loop.key}">{$sourcetype|htmlentities}</option>
			{/loop}
			</select>
        </td>
    </tr>
	{/check}
    </table>
    
    <input id="newacct_submit" name="submitdetails" type="{check $cancreate==0}button{otherwise}submit{/check}" value="{="Create"}" />
    <input id="newacct_cancel" type="button" value="{="Cancel"}" />

    </form>