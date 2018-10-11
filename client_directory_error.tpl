{onready}<script>
	if (!$.cookie('dirwarnok')) {
		var $notifyanchor = $('#notifyanchor');
		$notifyanchor.centovaTip({
			content: $('#directory_warning'),
			tiptype: 'error',
			delay: 0,
			callout: false,
			immediate: true,
			buttons: [
				{
					caption: '{="OK"}',
					onclick: function() {
						$.cookie('dirwarnok', 1);
						$notifyanchor.centovaTip(false);
					}
				}
			]
		});
	}
</script>{/onready}

<div id="directory_warning" style="display: none">
    <h1>{="Directory warning"}</h1>
	<p>
		{="The streaming server reports that your station could not be listed in the stream directory due to the following problem"}:
		<br /><br />

		{="Code %d: %s%s%s",$directory.code,"<strong>",$directory.message,"</strong>"}<br /><br />

		{="Please consult the manual for your streaming server for additional information about this error."}
	</p>
</div>
