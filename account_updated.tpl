{css}
.m-portlet__head.sp-box-table {
background-color: #1E1E2D;
border-color: #1E1E2D;
}
.m-portlet__head-text.sp-box-table {
color: white !important;
}
.sp-dj-table-tr {
background-color: #1E1E2D;
border-color: #1E1E2D;
color: white;
}
.m-subheader {
display: none;
}
.m-portlet .m-portlet__body {
background-color: #fbfbfb;
}
.spred {
color: red;
}
{/css}

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {="Edit Account"} </h3>
</div>
</div>
</div>
<div class="m-portlet__body">

{="Configuration updated successfully."}

{check $type=="client"}
	<div class="spred">{="Note that you will need to restart your server for the changes to take effect."}</div>

	{if $result.charsetchanged}
	<br /><br />
	{="Your preferred character encoding has also been changed."}
	{="Note that if you have already imported any media, you should %sclick here%s now to update your media library with the new character encoding.","<a href='index.php?page=importmedia&full=1'>","</a>"}
	{/if}
{/check}

</div>

<div class="m-portlet__foot">
<div class="row align-items-center">
<div class="col-lg-12 m--valign-middle">
<a class="btn btn-block btn-primary" href="{if ($reseller>0) and ($account.reseller>0)}index.php?page=configure{elseif $privileged}index.php?page=accounts&action=edit&username={$account.username}{else}index.php?page=configure{/if}">{="Return"}</a>
</div>
</div>
</div>

</div>
