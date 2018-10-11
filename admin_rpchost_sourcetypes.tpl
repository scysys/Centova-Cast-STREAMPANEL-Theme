{="Please select the autoDJ streaming source software which you have installed on this cluster server:"}<br /><br />

{loop $sourcetype=$sourcetypes}
<table cellspacing="0" cellpadding="2 border="0" width="100%">
<tr{if $sourcetype.requirepath==0} class="nopath"{/if}>
	<td width="16"><input type="checkbox" name="appenabled[{$_loop.key}]" value="1"{if $sourcetype.enabled} checked="checked"{/if} /></td>
	<td class="noselect" unselectable="on">{$sourcetype.title|htmlentities}</td>
</tr>
</table>
{/loop}
