{* Common JavaScript include *}
{resource_list class="common" type="js" provides="jq,array,common"}
/system/class.js
/system/array.js
/system/utility.js
/system/stacktrace.js
/system/jquery.full.js
/system/dragdealer.js
/system/ajax.js
/system/jquery.cookie.js
/system/jquery.domec.js
/system/jquery.timers.js
/system/jquery.copyevents.js
/system/jquery.centova.util.js
/system/jquery.centova.select.js
/system/jquery.centova.dialog.js
/system/jquery.centova.expose.js
/system/jquery.centova.tooltip.js
/system/jquery.centova.tipdialog.js
/system/jquery.centova.validation.js
/system/jquery.centova.selectslider.js
/system/jquery.centova.pulse.js
/system/jquery.centova.buttonbar.js
/system/eventemitter.js
/system/common.js
/system/tabset/tabset.js
/system/progress.js
/system/dialogwindow.js
{/resource_list}

{* Common CSS include *}
{resource_list class="common" type="css"}
/theme/graphs.css
/theme/jquery.centova.tooltip.css
/theme/jquery.centova.overlay.css
/system/dragdealer.css
/theme/tabset.css
{/resource_list}

{resource_list class="rpc" type="js" provides="rpc" depends="common"}
/system/rpc.js
{/resource_list}

{resource_list class="upload" type="js" provides="upload" depends="common"}
/system/upload/juppity/swfupload/swfupload.js
/system/upload/juppity/swfupload/plugins/swfupload.queue.js
/system/upload/juppity/jquery.html5_upload.js
/system/upload/juppity/jquery.swfupload.js
/system/upload/juppity/jquery.juppity.js
/system/upload/upload.js
/system/upload/handlers/filemanager.js
/system/upload/handlers/introfallback.js
{/resource_list}

{resource_list class="uiwidgets" type="js" provides="uiwidgets" depends="rpc"}
/system/kbd.js
/system/listbox.js
/system/treeview.js
/system/dragdrop.js
/system/popupmenu.js
/system/jquery-ui.custom.min.js
/system/jquery.layout.js
{/resource_list}

{resource_list class="logviewer" type="js" provides="logviewer" depends="rpc,uiwidgets"}
/system/library_pane.js
/system/treeview_pane.js
/system/logbrowser.js
/system/logviewer.js
/system/logmanager.js
{/resource_list}

{resource_list class="filemanager" type="js" provides="filemanager" depends="rpc,uiwidgets,upload"}
/system/library_pane.js
/system/treeview_pane.js
/system/folderbrowser.js
/system/filebrowser.js
/system/filemanager.js
{/resource_list}

{resource_list class="library" type="js" provides="library" depends="rpc,uiwidgets"}
/system/library.js
/system/library_pane.js
/system/library_folders.js
/system/library_playlists.js
/system/library_artists.js
/system/library_albums.js
/system/library_tracks.js
/system/library_playlist.js
/system/library_tip.js
/system/library_editor.js
/system/library_track_editor.js
{/resource_list}

{resource_list class="calendar" type="js" provides="calendar"}
/system/jscalendar/calendar.js
/system/jscalendar/lang/calendar-en.js
/system/jscalendar/calendar-setup.js
{/resource_list}

{resource_list class="flot" type="js" provides="flot" depends="jq"}
/system/flot/jquery.flot.js
/system/flot/jquery.flot.time.js
/system/flot/jquery.flot.pie.js
/system/flot/jquery.flot.selection.js
{/resource_list}

{resource_list class="justgage" type="js" provides="gauge" depends="jq"}
/system/justgage/raphael.min.js
/system/justgage/justgage.min.js
{/resource_list}

{resource_list class="statistics" type="js" provides="stats" depends="flot"}
/system/statistics.js
/system/statistics_statspage.js
/system/statistics_tracks.js
/system/statistics_recent.js
/system/statistics_listeners.js
/system/statistics_historical.js
/system/statistics_countries.js
/system/statistics_agents.js
/system/statistics_downloads.js
/system/livestats.js
{/resource_list}

{resource_list class="accountsnew" type="js" depends="jq,rpc"}
/system/admin.accounts.js
/system/admin.accounts_new.js
{/resource_list}

{resource_list class="accounts" type="js" provides="accts" depends="accountsnew"}
/system/admin.accounts_view.js
/system/admin.accounts_maad.js
/system/admin.accounts_resize.js
/system/admin.accounts_hover.js
/system/admin.accounts_list.js
{/resource_list}

{resource_list class="adsorder" type="js" depends="common"}
/system/jquery.listreorder.js
/system/adsorder.js
{/resource_list}

{resource_list class="adsorder" type="css"}
/system/listreorder.css
{/resource_list}

{resource_list class="sortable" type="js" depends="common"}
/system/sortable/Sortable.js
/system/sortable/jquery.binding.js
{/resource_list}

{resource_list class="reportformat" type="js" depends="sortable"}
/system/reportformat.js
{/resource_list}

{resource_list class="reportformat" type="css"}
/system/reportformat.css
{/resource_list}

{resource_list class="client" type="js" depends="common"}
/system/jquery.flash.js
/system/jquery.media.js
/system/client.js
{/resource_list}

{resource_list class="confeditor" type="js" depends="common"}
/system/codemirror/lib/codemirror.js
/system/codemirror/addon/comment/comment.js
/system/codemirror/addon/comment/continuecomment.js
/system/codemirror/addon/search/search.js
/system/codemirror/addon/search/searchcursor.js
/system/codemirror/addon/search/match-highlighter.js
/system/codemirror/addon/dialog/dialog.js
/system/codemirror/addon/selection/active-line.js
/system/codemirror/mode/dnas2/dnas2.js
/system/codemirror/mode/liquidsoap/liquidsoap.js
/system/codemirror/mode/xml/xml.js
/system/codemirror/mode/properties/properties.js
/system/confeditor.js
{/resource_list}

{resource_list class="confeditor" type="css"}
/system/codemirror/lib/codemirror.css
/system/codemirror/addon/dialog/dialog.css
/theme/confeditor.css
{/resource_list}

{resource_list class="push" type="js" depends="common"}
/system/pushclient.js
/system/castpushclient.js
{/resource_list}

{resource_list class="progress" type="js" depends="push"}
/system/progresswindow.js
/system/pushprogresswindow.js
{/resource_list}
