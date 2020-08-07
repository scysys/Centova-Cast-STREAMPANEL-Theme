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
                <h3 class="m-portlet__head-text sp-box-table"> {="DJ Account Update"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
	{check $saved}
	{="DJ Account saved successfully."}
	{otherwise}
	{="Sorry, an error occurred while attempting to update this DJ account"}: {$error|htmlentities}
	{/check}
	<br /><br />
	
	<a href="index.php?page=djaccounts">{="Return"}</a>
    </div>
</div>
