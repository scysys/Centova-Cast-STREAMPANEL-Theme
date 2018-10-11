{language}
	'xfer_pending': '{="Pending..."}',
	'xfer_uploading': '{="Uploading..."}',
	'xfer_process': '{="Processing upload..."}',
	'xfer_complete': '{="Complete"}.',
	'xfer_cancelled': '{="Cancelled"}',
	'xfer_stopped': '{="Stopped"}',
	'xfer_failed': '{="Upload Failed"}',
	'xfer_totals': '{="%s file(s) uploaded"}.',
	'upload_file': '{="Upload file"}',
	'upload_files': '{="Upload files"}',
    'select_file': "{="Click 'Select file' to select a file to upload."}",
    'select_files': "{="Click 'Select files' to select one or more files to upload."}",

{/language}

{resource type="js" class="upload"}
{resource type="css" src="/theme/upload.css"}

{options type="upload"}
    available_space: {$avail_disk_space},
    total_space: {$total_disk_space},
    upload_url: "index.php?page=upload&PHPSESSID={$phpsessionid|htmlentities}",
    upload_var: 'Filedata'
{/options}

<div id="singleupload" class="dialogcontent">

	<div id="upload_file">
		<div style="float: right">
			<a href="#" class="upload_file_remove">{="Close"}</a><br />
			<a href="#" class="upload_file_cancel">{="Cancel"}</a><br />
			<div class="progressmeterwrapper">
				{$_|ccmeter:100:thisfile}
			</div>
		</div>

<!--	<img class="dialogicon" src="../theme/images/subsections/upload.png" /> -->
<!--	<h2 id="upload_subtitle"></h2> -->

		<div class="upload_file_status upload_queued"></div>
		<div class="upload_file_info">
			<h1>{="File Upload"}</h1>
			<div class="upload_file_name">{="Loading"} ...</div>
			<div class="upload_file_details">{="Please wait"} ...</div>
		</div>
	</div>
</div>

