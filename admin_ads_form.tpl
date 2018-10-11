<fieldset>
	<legend>{$ads.title}</legend>

	{if $ads.description!=""}<div class="info" style="margin-bottom: 5px">{$ads.description}</div>{/if}

	<table cellspacing="1" cellpadding="1" border="0">
	{$ads.html}
	</table>

	{if $ads.testable}<br /><input type="submit" name="adstest[{$ads.name}]" value="{="Test %s integration",$ads.title}" />{/if}
</fieldset>
