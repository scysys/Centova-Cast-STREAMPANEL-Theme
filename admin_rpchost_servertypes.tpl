{="Please select the streaming server software which you have installed on this cluster server:"}<br /><br />

{loop $servertype=$servertypes}
<table cellspacing="0" cellpadding="2 border="0" width="100%">
<tr class="nopath">
	<td width="16"><input onclick="focus_softtype($(this).parent().next())" type="checkbox" name="serverenabled[{$_loop.key}]" value="1"{if $servertype.enabled} checked="checked"{/if} /></td>
	<td class="noselect" unselectable="on">{$servertype.title|htmlentities}</td>
</tr>
</table>
{/loop}
