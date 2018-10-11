{resource type="js" class="confeditor"}
{resource type="css" class="confeditor"}

{onready}
window.editor = new ConfEditor();
{/onready}


<form method="get" action="index.php">
<input type="hidden" name="page" value="confeditor" />

<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td width="200" valign="top" id="configfileselector">

	{box title="Configuration File"}
		<select style="width: 160px" size="{$configfiles|count|max:2}" id="filelist" onchange="editor.change_file(this)">
			{loop $configfile=$configfiles}<option value="{$configfile.appclass.identifier}:{$configfile.apptype}">{$configfile.apptype|htmlentities}</option>
			{/loop}
		</select>
	{/box}

</td>
<td width="15">&nbsp;</td>
<td id="configfilecontainer">

{box title="Warning" id="warning" class="boxalert"}
	<div style="width: 300px; padding: 10px">
		{="This editor allows advanced users to directly modified the raw configuration files for the underlying streaming software."}<br /><br />
		{="No validation of user modifications is performed by Centova Cast, and incorrect modifications will cause your stream to cease to operate.  Changes cannot be reverted or undone."}<br /><br />
		{="Proceed with caution."}
	</div>
{/box}

<div id="confeditorui" style="display: none">
	{box title="Configuration Editor" id="confeditorbox"}
		<div id="toolbar">
			<div class="toolbutton"><div id="tbsave" title="{="Save changes"}"></div></div>
			<div class="toolbutton"><div id="tbsearch" title="{="Search"}"></div></div>
			<div class="toolbutton"><div id="tbreplace" title="{="Search and replace"}"></div></div>
			<div class="toolbutton"><div id="tbindent" title="{="Increase indent"}"></div></div>
			<div class="toolbutton"><div id="tboutdent" title="{="Decrease indent"}"></div></div>
			<div class="toolbutton"><div id="tbundo" title="{="Undo"}"></div></div>
			<div class="toolbutton"><div id="tbredo" title="{="Redo"}"></div></div>
		</div>
		<textarea id="confeditor"></textarea>
	{/box}
</div>

</td>
</tr>
</table>

	

</form>
