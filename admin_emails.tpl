<div class="tabletitle">
	<img src="../system/images/icons/models/email.png" align="absmiddle" /> {="Select a message"}:<br />
</div>

<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
<tr>
	<th width="21" align="center"></td>
	<th>{="Message"}</th>
	<th>{="Subject"}</th>
	<th width="50">&nbsp;</th>
</tr>

{loop $email=$emails onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/email.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$email.title|htmlentities}{if $email.readonly} <span style="color: #909090">({="default"})</span>{/if}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$email.subject|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
		<a href="index.php?page={$targetmodule}&action=edit&id={$email.id}"><img title="{="Edit message"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>
