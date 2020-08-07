{css}
.m-portlet__head.sp-box-table {
background-color: #1E1E2D;
border-color: #1E1E2D;
}
.m-portlet__head-text.sp-box-table {
color: white !important;
}
.m-subheader {
display: none;
}
{/css}

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {check $successful}{if $message}{$message|htmlentities}{else}{="%s %s successfully.",$subject,$action}{/if}{otherwise}{="Status change"}{/check} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
{check $successful}
{otherwise}
<br /><br />
	{="%s could not be %s",$subject,$action}{if $reason}: {$reason|htmlentities}{/if}.
{/check}

	<a href="{$indexself}" class="btn btn-default btn-block">{="Return"}</a>
    </div>
</div>
	
{check ($successful) and ($details|trim=="")}
{otherwisecheck $diagnostic_level<0}
{otherwisecheck ($details|trim!="") or ($diagnostic_mode==0)}
<br/>

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Diagnostics"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
	{if $details|trim!=""}
	{="Details"}:<br />
	<pre class="execlog">{$details|trim}</pre>
	{/if}
	
	{if ($successful==0) and ($diagnostic_mode==0)}
	<br />
	{="Tip: Diagnostic mode may provide additional information about the cause of certain problems such as the above.  %s%s%s%s%sClick here%s if you would like to retry this operation in diagnostic mode.","<a href='",$_SERVER.REQUEST_URI,"&diag=",$diagnostic_level,"'>","</a>"}
	{/if}
    </div>
</div>

{/check}
