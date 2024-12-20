{css}
.m-portlet__head.sp-playlist-table {
    background-color: #1E1E2D;
    border-color: #1E1E2D;
}
.m-portlet__head-text.sp-playlist-table {
    color: white !important;
}
.sp-playlist-table-tr {
    background-color: #1E1E2D;
    border-color: #1E1E2D;
    color: white;
}
.dataTables_wrapper .text-right .dataTables_filter, .dataTables_wrapper .text-left .dataTables_filter {
    display: inline-block;
}
.m-subheader {
    display: none;
}
{/css}

<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
  <div class="m-portlet__head sp-playlist-table">
    <div class="m-portlet__head-caption">
      <div class="m-portlet__head-title">
        <h3 class="m-portlet__head-text sp-playlist-table"> {="Playlist Management"} <small>{="Schedule media for playback"}</small> </h3>
      </div>
    </div>
    <div class="m-portlet__head-tools">
      <ul class="m-portlet__nav">
        <li class="m-portlet__nav-item"> <a href="{$indexself}&action=add" class="m-portlet__nav-link btn btn-light m-btn m-btn--pill m-btn--air"> {="Create playlist"} </a> </li>
      </ul>
    </div>
  </div>
  <div class="m-portlet__body"> 
    <!--begin: Datatable -->
    <div id="m_table_1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
          <table id="SPPlaylistTable" class="table table-striped table-bordered table-hover table-checkable dataTable no-footer dtr-inline">
            <thead>
              <tr class="sp-playlist-table-tr">
                <th width="21" align="center"></th>
                <th>{="Title"}</th>
                <th>{="Type"}</th>
                <th>{="Scheduled time"}</th>
                <th>{="Repeat schedule"}</th>
                <th>{="Status"}</th>
                <th width="60">&nbsp;</th>
              </tr>
            </thead>
            <tbody>
            
            {if $playlists|count==0}
            
              <td colspan="7">{="No items have been created"}.</td>
              {else}
              {loop $playlist=$playlists}
            <tr>
              <td><img src="../system/images/icons/models/playlist.png" align="absmiddle" /></td>
              <td>{check $playlist.type!="request"}<a href="{$indexself}&action=edit&id={$playlist.id}" style="font-weight: normal">{/check}{$playlist.title|htmlentities}{check $playlist.type!="request"}</a>{/check}</td>
              <td> {if $playlist.type=="general"}{="General Rotation"}
                {elseif $playlist.type=="scheduled"}{="Scheduled"}
                {elseif $playlist.type=="interval"}{="Interval"}
                {elseif $playlist.type=="now"}{="Immediate"}
                {elseif $playlist.type=="request"}{="Song Requests"}
                {else}{="Unknown"}{/if} </td>
              <td> {if $playlist.type=="interval"}-{elseif $playlist.type=="general"}{$playlist.general_starttime} - {$playlist.general_endtime}{else}{$playlist.scheduled_datetime|substr:11}{/if} </td>
              <td>{if ($playlist.scheduled_repeat|contains:"daily") and ($playlist.type=="scheduled")}<strong>{="Daily Playlist"}</strong><br/>{="Mon"}, {="Tue"}, {="Wed"}, {="Thu"}, {="Fri"}, {="Sat"}, {="Sun"}{/if}
                {if ($playlist.scheduled_repeat|contains:"weekly") and ($playlist.type=="scheduled")}<strong>{="Weekly"}</strong>{/if}
                {if ($playlist.scheduled_repeat|contains:"monthly") and ($playlist.type=="scheduled")}<strong>{="Monthly"}</strong>{/if}
                {if ($playlist.scheduled_repeat|contains:"yearly") and ($playlist.type=="scheduled")}<strong>{="Yearly"}</strong>{/if}
                
                {if $playlist.type=="general"}<strong>{="General rotation"}</strong><br/>{="Mon"}, {="Tue"}, {="Wed"}, {="Thu"}, {="Fri"}, {="Sat"}, {="Sun"}
                {elseif ($playlist.type=="scheduled") and ($playlist.scheduled_repeat|contains:"never")}<strong>{="Never (one time only)"} {="on"} {$playlist.scheduled_datetime|substr:0:10}</strong>
                {elseif ($playlist.type=="interval") and ($playlist.interval_style=="onerandom")}<strong>{="All"} {$playlist.interval_length} {$playlist.interval_type}</strong><br/>{="Play only one randomly selected track from this playlist"}
                {elseif ($playlist.type=="interval") and ($playlist.interval_style=="playall")}<strong>{="All"} {$playlist.interval_length} {$playlist.interval_type}</strong><br/>{="Play all tracks from this playlist in order"}
                {elseif $playlist.scheduled_weekdays|contains:"mon"}<br/>{="Mon"}
                {elseif $playlist.scheduled_weekdays|contains:"tue"}<br/>{="Tue"}
                {elseif $playlist.scheduled_weekdays|contains:"wed"}<br/>{="Wed"}
                {elseif $playlist.scheduled_weekdays|contains:"thu"}<br/>{="Thu"}
                {elseif $playlist.scheduled_weekdays|contains:"fri"}<br/>{="Fri"}
                {elseif $playlist.scheduled_weekdays|contains:"sat"}<br/>{="Sat"}
                {elseif $playlist.scheduled_weekdays|contains:"sun"}<br/>{="Sun"}
                {/if} </td>
              <td>{if $playlist.status=="enabled"}{="Enabled"}(1){else}<font color="red">{="Disabled"}(2)</font>{/if}</td>
              <td>{check $playlist.type!="request"} <a href="{$indexself}&action=delete&id={$playlist.id}" onclick="return confirm('{="Are you sure you want to permanently delete this item?"}')"><img title="{="Delete playlist"}" src="../system/images/icons/delete.png" border="0" align="absmiddle" /></a> {/check} <a href="{$indexself}&action=status&id={$playlist.id}&status={if $playlist.status=="enabled"}0{else}1{/if}"><img title="{if $playlist.status=="enabled"}{="Disable playlist"}{else}{="Enable playlist"}{/if}" src="../system/images/icons/{if $playlist.status=="enabled"}disable{else}enable{/if}.png" border="0" align="absmiddle" /></a> {check $playlist.type!="request"} <a href="{$indexself}&action=edit&id={$playlist.id}"><img title="{="Edit playlist"}" src="../system/images/icons/edit.png" border="0" align="absmiddle" /></a> {/check}</td>
            </tr>
            {/loop}
            {/if}
              </tbody>
            
          </table>
    </div>
  </div>
</div>
<script src="https://login.streampanel.net/templates/universal/assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script> 
<script src="https://login.streampanel.net/templates/universal/assets/custom/crud/datatables/extensions/buttons.js" type="text/javascript"></script> 
<script type="text/javascript">
$('#SPPlaylistTable').dataTable({
	pagingType: "simple_numbers",
	order: [[ 1, 'asc' ]],
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