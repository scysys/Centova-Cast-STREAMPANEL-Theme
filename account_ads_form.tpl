	<fieldset>
		<legend>{$ads.title}</legend>

		<div class="ads_desc">{$ads.description}</div>

		{if $ads.html!=""}
		<table cellspacing="1" cellpadding="1" border="0">
		{$ads.html}
		</table>
		{else}
		{="No configuration is required."}
		{/if}
	</fieldset>
