<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {="Host"} </h3>
</div>
</div>
</div>
<div class="m-portlet__body">

<table class="table">
{check ($creating) or ($template_editor)}
<tr>
	<td>{="Create account on"}:&nbsp;</td>
	<td>
		<select name="config[rpchostid]" size="1">
		{if $template_editor>0}
		<option value="0">{="Automatically choose best"}</option>
		{/if}
		{loop $rpchost=$compatiblerpchosts}
		<option value="{$rpchost.id}"{if $config.rpchostid==$rpchost.id} selected="selected"{/if}>{$rpchost.title}{if $admin} ({$rpchost.ipaddress|htmlentities}:{$rpchost.port|htmlentities}){/if}</option>
		{/loop}
		{loop $region=$compatibleregions}
		<option value="rgn:{$region.id}"{if ($regionid>0) and ($regionid==$region.id)} selected="selected"{/if}>{="Region"}: {$region.title|htmlentities}</option>
		{/loop}
		</select>
	</td>
</tr>
{otherwise}
<tr>
	<td>{="Hosted on"}:&nbsp;</td>
	<td>

		{if $config.rpchostid==0}{="Automatically choose best"}{/if}
		{loop $rpchost=$compatiblerpchosts}
		{if $config.rpchostid==$rpchost.id}{$rpchost.title|htmlentities}{/if}{if ($config.rpchostid==$rpchost.id) && ($admin>0)} ({$rpchost.ipaddress|htmlentities}:{$rpchost.port|htmlentities}){/if}
		{/loop}
		</select>
	</td>
</tr>

{/check}

<!--
<tr><td colspan="2">
<br />Not yet implemented<br /><br />
</td></tr>

<tr>
	<td valign="top">{="Create relays on"}:&nbsp;</td>
	<td>
		<select name="config[relays][]" size="5" disabled="disabled">
		<option value="">{="None"}</option>
		<option value="allrelays">{="All compatible relay-only hosts"}</option>
		<option value="all">{="All compatible hosts"}</option>
		{loop $rpchost=$compatiblerelayhosts}
		<option value="{$rpchost.id}">{$rpchost.title|htmlentities}{if $admin} ({$rpchost.ipaddress|htmlentities}:{$rpchost.port|htmlentities}){/if}</option>
		{/loop}
		</select>
	</td>
</tr>

<tr>
    <td valign="top">{="IP Geolocation"}:&nbsp;</td>
    <td>
        <select name="config[playlistgeoloc]" size="1" disabled="disabled">
        <option value="">{="Off"}</option>
        <option value="ordered">{="Include all servers; sort by geographically-nearest server"}</option>
        <option value="exclusive">{="Include only geographically-nearest server(s); suppress others"}</option>
        </select>
        
        {tip type="icon"}
        {="When a listener clicks a tune-in link, Centova Cast can either:"}<br />
        - {="Provide the listener's media player with a list of all servers sorted by their geographic proximity to the listener's location.  This provides the best possible redundancy, but there is no guarantee that the listener's media player will honor the sort order so it may tune in to a non-optimal server."}  {="OR"}<br />
        - {="Provide the listener's media player with only the closest server(s) to the listener's location.  This ensures that the listener reaches the most optimal server, but if that server goes down there will be no failover to another server."}
        {/tip}
    </td>
</tr>
-->
</table>

</div>
</div>
