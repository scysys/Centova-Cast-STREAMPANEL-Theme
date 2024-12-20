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
{/css}

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Create DJ account"} </h3>
            </div>
        </div>
        <div class="m-portlet__head-tools">
            <ul class="m-portlet__nav">
                <li class="m-portlet__nav-item"> <a href="{$indexself}&action=add"
                        class="m-portlet__nav-link btn btn-light m-btn m-btn--pill m-btn--air"> {="Create DJ account"}
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="m-portlet__body">
        <table id="SPDJTable" class="table table-striped table-bordered table-checkable dataTable no-footer dtr-inline">
            <thead>
                <tr>
                    <th>{="Real name"}</th>
                    <th>{="Username"}</th>
                    <th>{="Status"}</th>
                    <th>{="Broadcaster Connection"}</th>
                    <th width="80">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                {loop $djaccount=$djaccounts onlast=" tdlast"}
                <tr>

                    <td class="row{$_loop.oetxt}{$_loop.lasttxt}"><a href="{$indexself}&action=edit&id={$djaccount.id}"
                            style="font-weight: normal">{$djaccount.realname|htmlentities}</a></td>

                    <td class="row{$_loop.oetxt}{$_loop.lasttxt}">{$djaccount.username|htmlentities}</td>

                    <td class="row{$_loop.oetxt}{$_loop.lasttxt}">
                        {if $djaccount.status=="enabled"}{="Enabled"}{else}{="Disabled"}{/if}
                    </td>

                    {if $account.servertype=="ShoutCast2"}
                        <td class="row{$_loop.oetxt}{$_loop.lasttxt}"><strong>{="Protocol"}:</strong> SHOUTcast V1<br />
                            <div id="sp_ipaddress"></div><strong>{="Port"}:</strong>
                            {$account.port|add:2|htmlentities}<br /><strong>{="Bitrate"}:</strong>
                            {$account.maxbitrate|htmlentities} {="kbps"}<br /><strong>{="Username"}:</strong>
                            {="Leave empty"}<br /><strong>{="Password"}:</strong>
                            {$djaccount.username|htmlentities}:{="DJPassword"}
                        </td>
                    {/if}
                    {if $account.servertype=="IceCast"}
                        <td class="row{$_loop.oetxt}{$_loop.lasttxt}"><strong>{="Protocol"}:</strong> SHOUTcast V1<br />
                            <div id="sp_ipaddress"></div><strong>{="Port"}:</strong>
                            {$account.port|add:1|htmlentities}<br /><strong>{="Bitrate"}:</strong>
                            {$account.maxbitrate|htmlentities} {="kbps"}<br /><strong>{="Username"}:</strong>
                            {="Leave empty"}<br /><strong>{="Password"}:</strong>
                            {$djaccount.username|htmlentities}:{="DJPASSWORD"}
                        </td>
                    {/if}

                    <td class="row{$_loop.oetxt}{$_loop.lasttxt}" align="center">
                        <a href="{$indexself}&action=edit&id={$djaccount.id}"
                            class="btn btn-primary btn-block btn-sm">{="Edit Account"}"</a>
                        <a href="{$indexself}&action=status&id={$djaccount.id}&status={if $djaccount.status=="enabled"}0{else}1{/if}"
                            class="btn btn-{if $djaccount.status=="enabled"}warning{else}success{/if} btn-block btn-sm">{if $djaccount.status=="enabled"}{="Disable DJ account"}{else}{="Enable DJ account"}{/if}</a>
                        <a href="{$indexself}&action=delete&id={$djaccount.id}" class="btn btn-danger btn-block btn-sm"
                            onclick="return confirm('{="Are you sure you want to permanently delete this item?"}')">{="Delete Account"}</a>
                    </td>
                </tr>
                {/loop}
            </tbody>
        </table>
    </div>
</div>

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Good to know"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
        <ul>
            <li>{="Outside the STREAMPANEL Cloud you need to stop & restart your Stream Server to make changes to your DJ-Accounts active."}
            </li>
            <li>{="When entering the connection data in your broadcaster, pay attention to upper and lower case letters in the DJ username or DJ password."}
            </li>
            <li>{="If you need more details about your connection, look %shere%s.","<a href='index.php?page=quicklinks'>","</a>"}
            </li>
        </ul>
    </div>
</div>

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="Icecast V2 / icescc"} </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
        <p>{="Icecast V2 with icescc as AutoDJ Source, can not be used with the DJ-Accounts! Our Cloud Version Icecast V2 / Liquidsoap and any other our Stream Servers are supporting the DJ Protocol."}</p>
    </div>
</div>

<div style="text-align: center; margin-top: 5px">{="Page"}: {$_multipage.nav}</div>

<script src="https://login.streampanel.net/templates/universal/assets/vendors/custom/datatables/datatables.bundle.js"
    type="text/javascript"></script>
<script src="https://login.streampanel.net/templates/universal/assets/custom/crud/datatables/extensions/buttons.js"
    type="text/javascript"></script>
<script type="text/javascript">
    $('#SPDJTable').dataTable({
        pagingType: "simple_numbers",
        order: [
            [3, 'asc']
        ],
        dom: "<'row'<'col-sm-6 text-left'f><'col-sm-6 text-right'B>>\n\t\t\t<'row'<'col-sm-12'tr>>\n\t\t\t<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7 dataTables_pager'lp>>",
        iDisplayLength: 5,
        buttons: ["print", "copyHtml5", "excelHtml5", "csvHtml5", "pdfHtml5"],
        language: {
            search: '{=""}',
            searchPlaceholder: '{="Search for..."}',
            emptyTable: '{="No data available in table"}',
            info: '{="Showing"} _START_ {="to"} _END_ {="of"} _TOTAL_ {="Entries"}',
            infoEmpty: '{="Showing 0 to 0 of 0 entries"}',
            lengthMenu: '{=""} _MENU_ {=""}',
            loadingRecords: '{="Loading..."}',
            processing: '{="Processing..."}',
            zeroRecords: '{="No entries have been found"}',
            paginate: {
                "first": '{="First"}',
                "last": '{="Last"}',
                "next": '{="Next"}',
                "previous": '{="Previous"}'
            },
            buttons: {
                print: '{="Print"}',
                copy: '{="Copy"}',
            },
        },
    });
</script>

<script>
    document.getElementById("sp_ipaddress").innerHTML = "<strong>{="Hostname"}:</strong> " + document.location.hostname;
</script>