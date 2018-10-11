{resource type="js" class="accountsnew"}

{object name="accounts"}
	admin: {if $admin}1{else}0{/if},
	softcompat: {$softcompat},
	rpchosts: {$rpchosts}
{/object}

 <div style="float: right">
	<a href="#" onclick="window.centovacast.newaccount.show('newtpl',true); return false">{="New template"}</a>
</div>

<img src="../system/images/icons/models/accounttemplate.png" align="absmiddle" /> {="Account Templates"}:<br />


<div id="newtpl" class="dialogcontent">
{include "new_account_form.tpl"}
</div>


<div class="tablewrapper">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
{if $accounttemplates|count==0}
<tr>
	<td class="tdlast">
		{="No items have been created"}.
	</td>
</tr>

{else}
<tr>
	<th width="21" align="center"></th>
	<th width="120">{="Name"}</th>
	<th>{="Description"}</th>
	<th width="50">&nbsp;</th>
</tr>

{/if}
{loop $accounttemplate=$accounttemplates onlast=" tdlast"}
<tr>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center"><img src="../system/images/icons/models/accounttemplate.png" align="absmiddle" /></td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$accounttemplate.name|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$accounttemplate.title|htmlentities}</td>
	<td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
		<a href="{$indexself}&action=delete&id={$accounttemplate.id}"><img title="{="Delete account template"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a>
		<a href="{$indexself}&action=edit&id={$accounttemplate.id}"><img title="{="Edit account template"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a>
	</td>
</tr>
{/loop}
</table>
</div>
