		<div style="text-align: center">
			<form method="get" action="{$_SERVER.REQUEST_URI|htmlentities}">
			<input type="hidden" name="step" value="settings" />
			<input type="submit" value="{="Continue"} &gt;" {if $errors>0}disabled="disabled" {/if}/>
			</form>
		</div>
		<br /><br />
		

		<div id="reportdata" style="display: none">
            Welcome to Centova Cast.  This installer will help you finalize your Centova Cast
            configuration and quickly begin using Centova Cast.<br /><br />
             
			{check ($warnings>0) or ($errors>0)}
				Unfortunately, Centova Cast's diagnostics detected the following problems with your system:<br /><br />
			
				<table cellspacing="1" cellpadding="2" border="0" width="100%" style='border: 1px solid #C0C0C0'>
				{$diagnostics}
				</table>
				
				<br />

				{if $errors>0}
				One or more errors were found in your system configuration.  You will need to correct these errors before Centova Cast will operate correctly.
				{elseif $warnings>0}
				One or more warnings were found in your system configuration.<br /><br />Ideally you should resolve these if at all possible, but in some cases, warnings may not affect the correct operation of Centova Cast and may be ignored.  If you experience any problems with Centova Cast after installation, however, it is likely that these problems are related to the warnings noted above.
				{/if}
				<br /><br />
				
				{if $errors>1}
				Note that a single problem may cause a number of warnings/errors in the list above, and you will likely find that fixing one problem also resolves a number of others.  As such, you should start at the top of this list and fix the errors one-by-one, <strong>in order</strong>, and re-load this page after you fix each problem.
				<br /><br />
				{/if}
				
			{otherwise}
				Please click the button below to proceed with the installation.
			{/check}
		</div>
		
		<script language="javascript" type="text/javascript">
			document.getElementById('report').innerHTML = document.getElementById('reportdata').innerHTML;
		</script>
