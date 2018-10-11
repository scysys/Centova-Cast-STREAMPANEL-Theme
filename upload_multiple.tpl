{language}
	xfer_pending: '{="Pending..."}',
	xfer_uploading: '{="Uploading..."}',
	xfer_process: '{="Processing upload..."}',
	xfer_complete: '{="Complete."}',
	xfer_cancelled: '{="Cancelled"}',
	xfer_stopped: '{="Stopped"}',
	xfer_failed: '{="Upload Failed"}',
	xfer_totals: '{="%s file(s) uploaded"}.',
	upload_file: '{="Upload file"}', 
	upload_files: '{="Upload files"}',
    select_file: "{="Click 'Select file' to select a file to upload."}",
    select_files: "{="Click 'Select files' to select one or more files to upload."}",
{/language}

{resource type="js" class="upload"}
{resource type="css" src="/theme/upload.css"}

{options type="upload"}
    available_space: {$avail_disk_space},
    total_space: {$total_disk_space}
{/options}

{* this sets the template for individual files shown in the queue *}
<div id="upload_file" class="upload_file" style="display: none">
    <a href="#" class="upload_file_remove">Remove</a>
    <a href="#" class="upload_file_cancel">Cancel</a>
    <div class="upload_file_status"></div>
    <div class="upload_file_info">
    	<div class="upload_file_name"></div>
    	<div class="upload_file_details"></div>
    </div>
</div>

<div id="upload" class="dialogcontent">
	<img class="dialogicon" src="../theme/images/subsections/upload.png" />
	<h1>{="File Manager"}</h1>
	<h2 id="upload_subtitle"></h2>

	<div style="display: none" id="uploadform_ui">

		<div id="buttonpanel">

			<div>
				<button type="button" class="btnselectfile">{if $single_file}{="Select file"}{else}{="Select files"}{/if}</button><br />
				{if $single_file==0}<button type="button" class="btncancelall">{="Cancel all"}</button><br />{/if}<br />
				<button type="button" id="upload_close">{="Close"}</button>
			</div>

			<div id="avail_space">
				{="Available space"}:<br />
				<span id="upload_disk_avail_text">0</span><br /><br />

				{="Queued"}:<br />
				<span id="upload_queued_text">0</span><br /><br />

				<span id="upload_driver" style="color: white"></span>
			</div>

		</div>

		<div id="queuepanel">

			<div class="tablewrapper" id="queuewrapper">
				<div class="fieldset flash upload_queue" id="fsUploadProgress">
					<div class="progressplaceholder">
						<strong>{="No uploads in progress"}</strong><br />
						<span class="upload_instructions"></span>
					</div>
				</div>
			</div>

			<div id="progressmeters">
				<div class="progressmeterwrapper">
					{="File progress"}:
					{$_|ccmeter:100:thisfile}
				</div>
				<div class="progressmeterwrapper">
					{="Overall progress"}:
					{$_|ccmeter:100:allfiles}
				</div>
			</div>

			<div id="divStatus">{="%s file(s) uploaded","<span id='upload_files_uploaded'>0</span>"}</div>

		</div>

	</div>

	<form id="uploadform" method="post" action="index.php?page=upload&PHPSESSID={$phpsessionid|htmlentities}" enctype="multipart/form-data">
		<div style="margin-top: 16px">
			Select a file: <input type="file" name="Filedata" {if $single_file==0}multiple="multiple" {/if}/>
			<br />
			<input type="submit" value="Upload" class="non-dialog" />
		</div>
	</form>

</div>
