{resource type="js" src="/system/serverstatus.js" depends="common"}

{* <style> *}{css}
.servermachine {
	font-size: 10px;
	color: #909090;
}
{/css}{* </style> *}

<div id="serverwrapper" class="tablewrapper" style="margin-bottom: 4px">
<table class="listtable sortable" width="100%" cellspacing="1" cellpadding="2">
<thead>
<tr>
    <th width="24" align="center" class="sorttable_reset"></th>
    <th>{="Server"}</th>
    <th>{="OS"}</th>
    <th width="55" style="text-align: center">{="Uptime"}</th>
    <th width="55" style="text-align: center">{="Load"}</th>
    <th width="65" style="text-align: right">{="Mem Used"}</th>
    <th width="65" style="text-align: right">{="Swap"}</th>
</tr>
</thead>
<tbody id="rowcontainer">
<tr><td colspan="7" style="text-align: center">{="Loading"} ...</td></tr>
</tbody>
</table>
</div>
