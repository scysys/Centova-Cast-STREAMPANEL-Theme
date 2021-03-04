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

{$warnings}
{$news}

<div class="col-sm-12">
<div class="row">
<div class="col-sm-6"><a class="btn btn-primary btn-block" href="/client/index.php?page=quicklinks">Informationen / Zugangsdaten</a></div>
<div class="col-sm-6"><a class="btn btn-primary btn-block" href="https://login.streampanel.net/submitticket.php?step=2&deptid=2" target="_blank" rel="noopener">Supportanfrage</a></div>
</div>
</div>

<br/>

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Recent tracks"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
<div class="tablewrapper" style="padding-bottom: 1px">
    <div id="cc_recenttracks_{$account.username|htmlentities}" class="cc_recenttracks_list"></div>
</div>
    </div>
</div>

<script language="javascript" type="text/javascript">
if (!window.centovacast) window.centovacast = {};
if (!window.centovacast.options) window.centovacast.options = {};
window.centovacast.options.recenttracks = { track_limit: 8 }
</script>
<script language="javascript" type="text/javascript" src="../system/recenttracks.js"></script>
