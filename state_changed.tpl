{box title="Status change"}
{check $successful}
	{if $message}{$message|htmlentities}{else}{="%s %s successfully.",$subject,$action}{/if}
{otherwise}
	{="%s could not be %s",$subject,$action}{if $reason}: {$reason|htmlentities}{/if}.
{/check}
	
	<br /><br />

	<a href="{$indexself}">{="Return"}</a>
{/box}
	
{check ($successful) and ($details|trim=="")}
{otherwisecheck $diagnostic_level<0}
{otherwisecheck ($details|trim!="") or ($diagnostic_mode==0)}
<br />
{box title="Diagnostics"}
	{if $details|trim!=""}
	{="Details"}:<br />
	<pre class="execlog">{$details|trim}</pre>
	{/if}
	
	{if ($successful==0) and ($diagnostic_mode==0)}
	<br />
	{="Tip: Diagnostic mode may provide additional information about the cause of certain problems such as the above.  %s%s%s%s%sClick here%s if you would like to retry this operation in diagnostic mode.","<a href='",$_SERVER.REQUEST_URI,"&diag=",$diagnostic_level,"'>","</a>"}
	{/if}
{/box}

{/check}