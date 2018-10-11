{resource type="css" src="/theme/popupmenu.css"}
{resource type="css" src="/system/jquery.layout.default.css"}
{resource type="css" src="/theme/filemanager.css"}
{resource type="css" src="/theme/library_ie7.css" iecondition="lte IE 7"}

{resource type="js" class="rpc"}
{resource type="js" src="/system/debug.js"}
{resource type="js" class="uiwidgets"}
{resource type="js" class="filemanager"}

{language}
	ok: '{="OK"}',
	upload_here: '{="Upload here"}',
	select_first: '{="Please select one or more files or folders first."}',
	select_one_first: '{="Please select a file or folder first."}',
	items_on_clipboard: '{="item(s) on clipboard"}',
	clipboard_empty: '{="The clipboard is currently empty."}',
	source_dest_same: '{="Source and destination folders are the same."}',
	copying_files: '{="Copying files"}',
	moving_files: '{="Moving files"}',
	copying_items: '{="Copying %s item(s) to %s"}',
	moving_items: '{="Moving %s item(s) to %s"}',
	delete_confirm: '{="Are you sure you want to delete %s item(s) from %s?"}',
	deleting_files: '{="Deleting files"}',
	deleting_items: '{="Deleting %s item(s) from %s"}',
	rename_same: '{="New filename is identical to old filename, no changes made."}',
	renaming_file: '{="Renaming file"}',
	renaming_file_to: '{="Renaming file %s to %s"}',
	creating_folder: '{="Creating folder"}',
	creating_folder_name: '{="Createing new folder %s"}',

	tupload: '{="Upload"}',
	tcopy: '{="Copy"}',
	tcut: '{="Cut"}',
	tpaste: '{="Paste"}',
	tdelete: '{="Delete"}',
	trename: '{="Rename"}',
	tnewfolder: '{="New Folder"}',

	unlimited: '{="Unlimited"}',

	disk_usage: '{="Disk usage"}',
	disk_usage_tip: '{="This is your total disk space usage, including any media, logs, and configuration files used by your stream."}',
	recalculate_quota_title: '{="Updating usage"}',
	recalculate_quota_content: '{="Recalculating your disk usage, please wait ..."}',
	recalculated_quota_title: '{="Usage updated"}',
	recalculated_quota_content: '{="Your updated disk space usage is %s MB in %s file(s)."}',
	n_mb: '{="%s MB"}',
{/language}
{options type="filemanager"}
{if $juppity_options}juppity_options: {$juppity_options|json_encode},{/if}
	account_organization: '{$account.organization|default:$account.username|jsescape}',
	dj_private_ftp: {if $djprivateftp}1{else}0{/if}
{/options}

<form method="post" action="index.php?page=filemanager" enctype="multipart/form-data">

<div id="filemanagerlayout">
	<div id="folderbrowser" class="tvt">
	</div>

	<div id="filebrowser" style="z-index: 2" class="lbt">
	</div>

	<div id="statuspane" class="pane">

		<div id="meter" class="statuscontents">
			<div style="width: 150px; padding: 0 0 0 6px; float: right; cursor: pointer">
				{$_|ccmeter:$diskquota:diskusage}
			</div>

			<div style="padding-top: 4px; text-align: right">{="Disk usage"}:</div>
		</div>

		<div id="options" class="statuscontents">
			<input type="button" onclick="window.location = 'index.php'" value="{="Return"}" /> &nbsp;&nbsp;&nbsp; &nbsp;

			<input type="button" id="btn_copy" onclick="window.fm.populate_clipboard(true)" value="{="Copy"}" />
			<input type="button" id="btn_cut" onclick="window.fm.populate_clipboard(false)" value="{="Cut"}" />
			<input type="button" id="btn_paste" onclick="window.fm.paste_clipboard()" value="{="Paste"}" /> &nbsp;
			<input type="button" id="btn_delete" onclick="window.fm.delete_selected()" value="{="Delete"}" />
			<input type="button" id="btn_rename" onclick="window.fm.rename_selected()" value="{="Rename"}" /> &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="btn_newfolder" onclick="window.fm.create_directory()" value="{="New Folder"}" /> &nbsp;&nbsp;&nbsp;&nbsp;
			{check $canupload}
			<input type="button" id="btn_upload" onclick="window.fm.show_upload()" value="{="Upload"}" /> &nbsp;
			{/check}

			<span id="clipboardstatus" class="statuscontents"></span>
		</div>
	</div>

</div>


<div id="rename" class="dialogcontent">
    <img class="dialogicon" src="../theme/images/subsections/files.png" />
    <h1>{="File Manager"}</h1>
    <h2>{="Rename file"}</h2>
    
    <p>
    {="New name"}: <input type="text" id="rename_newname" name="rename_newname" value="" size="30" />
    </p>
    
    <input type="button" value="{="OK"}" id="rename_submit" onclick="window.fm.do_rename()" />
    <input type="button" value="{="Cancel"}" onclick="window.fm.close_dialog()" />
</div>

<div id="mkdir" class="dialogcontent">
	<img class="dialogicon" src="../theme/images/subsections/files.png" />
	<h1>{="File Manager"}</h1>
	<h2>{="New folder"}</h2>

	<p>
	{="Folder name"}: <input type="text" id="mkdir_name" name="mkdir_name" value="" size="30" />
	</p>

	<input type="button" value="{="Create"}" id="mkdir_submit" onclick="window.fm.do_mkdir()" />
	<input type="button" value="{="Cancel"}" onclick="window.fm.close_dialog()" />
</div>

</form>

<div id="tipdlg" class="ctip">
	<div class="tipdlg_text"></div>

	<div class="tipdlg_progress" style="margin-left: 100px">{$_|ccmeter:100:.tipdlg_meter}</div>
</div>
