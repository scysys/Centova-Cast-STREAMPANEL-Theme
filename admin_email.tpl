<style type="text/css">
.preview_heading {
	font-weight: bold;
	color: #909090
}
.preview_info {
	float: right;
text-align: right;
}
.edit_button {
}
.preview_text {
	font-family: Courier New,Courier,serif;
	font-size: 12px;
}
.preview_pane {
	border: 1px solid #E0E0E0;
	padding: 5px 10px 5px 10px;
	margin-top: 10px;
	background-color: white;
}
.divider {
	margin-top: 10px;
	border-top: 1px solid #D0D0D0;
}
</style>

<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">
{language}
edit: '{="Edit"}',
copy_to: {
	html: '{="To text"}',
	text: '{="To HTML"}'
},
copy_to_help: {
	html: '{="This will copy your message text into the message HTML field, converting newlines to HTML line breaks.  Continue?"}',
	text: '{="This will copy your message HTML into the message text field, converting HTML line breaks to newlines and stripping all other HTML code.  Continue?"}'
}
{/language}
{onready}
$('#html_preview, #text_preview').each(function(){
	var $this = $(this);
	var editorid = '#'+$this.attr('id').replace(/_preview/,'_message');
	$this
		.append('<br />')
		.append( $('<button/>')
		.addClass('edit_button')
		.text(window.lang.edit)
		.click(function(){
			$(editorid).scrollTo(null,'fast').focus();
			return false;
		}));
});

$('#html_message, #text_message').each(function(){
	var $this = $(this);
	var typeid = $this.attr('id').replace(/_message/,'');
	$this
		.before(
			$('<button/>')
			.css('float','right')
			.text(window.lang.copy_to[typeid])
			.click(function(){
				if (!confirm(window.lang.copy_to_help[typeid])) return false;
				var content = $this.val();
				var $dest;
				if (typeid=='html') {
					$dest = $('#text_message');
					content = content
						.replace(/\n/g,"")
						.replace(/<(br|p)[^>]*>/ig,"\n")
						.replace(/<[^>]*>/g,' ')
						.replace(/[ ]{2,}/g,' ')
						.replace(/^[ ]+/gm,'');
				} else {
					$dest = $('#html_message');
					content = content.replace(/\n/g,"<br />\n");
				}
				$dest.val(content);
				return false;
			})
		);

});

{/onready}

{if $failure}
{box title="Update Failed"}{="An error occurred while attempting to save this update"}.{/box}
{/if}

{if $preview}
{box title="Preview"}

<div style="padding: 5px">

	<table cellspacing="0" cellpadding="0" border="0">
	<tr><td>{="From"}:</td><td><strong>{$settings.sitename|htmlentities} &lt;{$settings.senderemail|htmlentities}&gt;</strong></td></tr>
	<tr><td>{="Subject"}:&nbsp;&nbsp;</td><td><strong>{$email.subject|htmlentities}</strong></td></tr>
	</table>

	<div class="divider"></div>
	<div class="preview_pane">
		<div class="preview_info">
			<div id="html_preview" class="preview_heading">{="HTML Preview"}</div>
		</div>
		{$preview.html}
	</div>
	<div class="preview_pane">
		<div class="preview_info">
			<div id="text_preview" class="preview_heading">{="Text Preview"}</div>
		</div>
		<span class="preview_text">{$preview.text|htmlentities|nl2br}</span>
	</div>

</div>
{/box}
{/if}

{box title=$email.title}

<table cellspacing="1" cellpadding="1" border="0">
<tr>
	<td>{="Subject"}: {$errors.subject|checkerror}</td>
	<td><input type="text" name="email[subject]" size="50" maxlength="255" value="{$email.subject|htmlentities}" /></td>
</tr>
<tr valign="top">
	<td>{="Message text"}: {$errors.textmessage|checkerror}</td>
	<td><textarea name="email[textmessage]" id="text_message" rows="10" cols="50">{$email.textmessage|htmlentities}</textarea></td>
</tr>
<tr valign="top">
	<td>{="Message HTML (optional)"}: {$errors.htmlmessage|checkerror}&nbsp;</td>
	<td><textarea name="email[htmlmessage]" id="html_message" rows="10" cols="50">{$email.htmlmessage|htmlentities}</textarea></td>
</tr>
</table>

<br />

<div style="float: right">
	<input type="submit" name="update" value="{="Update"}" />
	<input type="button" value="{="Cancel"}" onclick="window.location='index.php?page={$targetmodule}'; return false" />
</div>
<input type="submit" name="preview" value="{="Preview"}" />
</form>
{/box}
