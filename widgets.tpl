<script language="javascript" type="text/javascript" src="../system/preview_widget.js"></script>
<script language="javascript">
function change_widget(sel) {
	var selected = $(sel).getSelectedOption();
	$('#widgetcontainer > div.box').hide();
	$('#widgetcontainer > div.box:nth-child('+selected.val()+')').show();
}

</script>

<form method="get" action="index.php">
<input type="hidden" name="page" value="widgets" />

<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
{check $mountpoints|count>1}
<td width="50%" valign="top">
	{box title="Mount Points"}
	{="If you have created multiple mount points for your stream, you can select a mount point here and all of the widgets on this page will be updated to refer specifically to the selected mount point."}<br /><br />

	<table>
	<tr>
		<td>{="Mount point"}:&nbsp;</td>
		<td colspan="4">
			<select name="mountpoint" size="1" onchange="this.form.submit()">
			<option value="">{="Default"}</option>
			{loop $mountpoint=$mountpoints}
			<option value="{$_loop.key}"{if $_loop.key==$_REQUEST.mountpoint} selected="selected"{/if}>{$mountpoint.displayname|htmlentities}</option>
			{/loop}
			</select>
		</td>
	</tr>
	</table>
	{/box}
</td>
<td width="10">&nbsp;</td>
{/check}
<td width="50%" valign="top">
	{box title="Alternate Character Encodings"}
	{="If accented or localized characters in the widgets display incorrectly on your web site, select the character encoding that your web site uses and copy the updated widget code below."}<br /><br />

	<table>
	<tr>
		<td>{="Character encoding"}:&nbsp;</td>
		<td colspan="4">
			<select name="charset" size="1" onchange="this.form.submit()">
			<option value="">UTF-8 (default)</option>
			{loop $charset=$charsets}
			<option value="{$_loop.key}"{if $_loop.key==$_REQUEST.charset} selected="selected"{/if}>{$_loop.key}: {$charset|htmlentities}</option>
			{/loop}
			</select>
		</td>
	</tr>
	</table>
	{/box}
</td>
</tr>
</table>



<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td width="200" valign="top" id="widgetselector">

	{box title="Choose Widget"}
		<select style="width: 160px" size="{$widgets|count}" onchange="change_widget(this)">
			{loop $widget=$widgets}<option value="{$_loop.iteration}"{if $_loop.iteration==1} selected="selected"{/if}>{$widget.title|htmlentities|regtm}</option>
			{/loop}
		</select>
	{/box}

</td>
<td width="15">&nbsp;</td>
<td id="widgetcontainer">

{loop $widget=$widgets}

{box title=$widget.title id=$_loop.key}
	<div style="float: right">
		<input type="button" value="{="Preview"}" onclick="preview_widget(this,'{="Preview"}','{="Close"}')" />
	</div>
	{$widget.description|htmlentities|regtm}<br /><br />

	{$widget.anchor_instructions|htmlentities}<br />
	<textarea class="widget_anchor" readonly="readonly" onmouseup="this.focus(); this.select()" wrap="off" style="margin-top: 2px; border: 1px dashed #C0C0C0; background-color: #F9F9F9; padding: 5px; width: 80%; height: 100px; font-family: Courier New,Courier; font-size: 11px">{if $widget.stylesheet}<link rel="stylesheet" type="text/css" href="{$selfurl}theme/{$widget.stylesheet}" />
{/if}{$widget.anchor|htmlentities}</textarea>
	<br />
	{check $widget.script!=""}
	<br />

	{$widget.script_instructions|htmlentities}<br />
	<textarea class="widget_script" readonly="readonly" onmouseup="this.focus(); this.select()" wrap="off" style="margin-top: 2px; border: 1px dashed #C0C0C0; background-color: #F9F9F9; padding: 5px; width: 80%; height: 100px; font-family: Courier New,Courier; font-size: 11px">{$widget.script|htmlentities}</textarea>
	<br />
	{/check}
	{$widget.comments}
{/box}

{/loop}

</td>
</tr>
</table>


</form>

{onready}
$('#widgetcontainer > div.box').hide();
$('#widgetcontainer > div.box:first-child').show();

{/onready}