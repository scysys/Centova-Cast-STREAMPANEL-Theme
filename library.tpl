{resource type="css" src="/theme/library.css"}
{resource type="css" src="/theme/library_ie7.css" iecondition="lte IE 7"}
{resource type="css" src="/theme/popupmenu.css"}
{resource type="css" src="/system/jquery.layout.default.css"}

{css}
#pulldownmenu {
    color: white;
    background-color: red;
}
{/css}

{resource type="js" class="progress"}
{resource type="js" class="rpc"}
{resource type="js" class="uiwidgets"}
{resource type="js" class="library"}

{language}
	playlists_text: '{="Playlists"}',
	playlist_modified_text: '{="You have not saved your changes to this playlist.  Click OK to discard your changes, or Cancel to return to this playlist to save your changes."}',
	playlist_revert_text: '{="Are you sure you want to revert this playlist?  Click OK to discard your changes and revert to the original, or Cancel to resume editing this playlist."}',
	media_text: '{="Media"}',
	medialib_text: '{="Media Library"}',
	albums_text: '{="Albums"}',
	album_text: '{="Album"}',
	all_genres_text: '{="All genres"}',
	media_library_update: '{="Media Library Update"}',
	performing_manual_update: '{="Performing manual update"}',
	playlist_type_text: {
		general: '{="General"}',
		scheduled: '{="Scheduled"}',
		interval: '{="Interval"}',
		now: '{="Immediate"}',
		request: '{="Song Requests"}'
	},
	edit_artist: '{="Rename artist"}',
	artist_name: '{="Artist name"}',
	
	edit_album: '{="Edit album details"}',
	remove_cover_image: '{="Remove cover image"}',
	confirm_remove_cover_image: '{="Are you sure you want to permanently remove this album cover image?"}',
	album_name: '{="Album name"}',
	album_cover_url: '{="Cover image URL"}',
	album_purchase_url: '{="Purchase URL"}',
	reindex_album: '{="Re-index album"}',

	edit_track: '{="Track details"}',
	track_name: '{="Track name"}',
	comments: '{="Comments"}',
	save: '{="Save"}',
	cancel: '{="Cancel"}',
	
	show_album_covers: '{="Show album covers"}',
	import_m3u: '{="Import M3U playlist"}',
	folder_view: '{="Browse by folders"}',
	manual_library_update: '{="Manual library update"}',
	purge_library_update: '{="Purge library and update"}',

	full_reindex_confirm: '{="This will purge all media information from your library and re-import all of your tracks.  Any customizations you may have made, including custom covers, artist/album/track names, and related data will be lost.  If you have a large media library, this may take a very long time.  Proceed?"}',

	library_update: {
		title: '{="Media Library Update"}',
		subtitle: '{="Performing manual update"}',
		complete: '{="Complete"}',
		initializing: '{="Initializing"}',
		close: '{="Close"}'
	},

	listen_to_preview: '{="Listen to preview"}',
	enable_disable_playlist: '{="Enable/disable playlist"}',

	empty_playlist: '{="Empty playlist"}',
{/language}
{options type="library"}
	allow_import_m3u: {if $allow_import_m3u}1{else}0{/if},
	allow_folder_view: {if $allow_folder_view}1{else}0{/if},
	allow_file_manager: {if $allow_file_manager}1{else}0{/if},
	cover_width: {$_CONSTANTS.LIBRARY_COVER_WIDTH},
	cover_height: {$_CONSTANTS.LIBRARY_COVER_HEIGHT},
	candy_corn: {if $_CONSTANTS.DEV_MODE}1{else}0{/if}
{/options}

<span id="sp-artist-section" style="display:none">{="This section shows all Artists from your uploaded music files. You can drag and drop Artist with your mouse to your left playlists."}</span>
<span id="sp-album-section" style="display:none">{="This section shows the Album of the selected Artist. You can drag and drop an Album with your mouse to your left playlists."}</span>
<span id="sp-title-section" style="display:none">{="This section show the Title of the selected Artist and his Album. You can drag and drop Titles with your mouse to your left playlists."}</span>
<span id="sp-playlistlayout" style="display:none">{="This sections contains all the Tracks that you have assigned to this selected playlist."}</span>
<span id="sp-mediaplaylists" style="display:none">{="This section contains your media library and the playlists you have actually created."}</span>
<span id="sp-folderlayout" style="display:none">{="The folder layout is an simplier interface where you can drag and drop multiple folders instead of single files only to you created playlists. Thats only possible when you organize your files in folders on file upload."}</span>

<form method="post" onsubmit="window.cclibrary.search(); return false" role="form">

	<div id="librarylayout">
		
		<div id="playlists" class="lbt" aria-describedby="sp-mediaplaylists"></div>

		<div id="contentlayout">
			<div id="medialayout">

				<div id="artistalbumlayout">
					<div id="artists" class="lbt" aria-describedby="sp-artist-section"></div>
					<div id="albums" class="lbt" aria-describedby="sp-album-section"></div>
				</div>
				<div id="tracks" class="lbt" aria-describedby="sp-title-section"></div>

			</div>

			<div id="playlistlayout" class="pane togglepane">
				<div id="playlist" class="lbt" aria-describedby="sp-playlistlayout"></div>
			</div>

			<div id="folderlayout" class="pane togglepane">
				<div id="folders" class="tvt" aria-describedby="sp-folderlayout"></div>
			</div>
		</div>


		<div id="searchpane">

			<div id="search">
				<div style="float: right; text-align: right">
					<input aria-expanded="false" type="button" value="{="Options"}" id="pulldownmenu" onclick="window.cclibrary.show_menu(this)" />
				</div>

				<div id="searchform">
					{="Keyword"}: <input type="text" name="keyword" id="search_keyword" value="" style="width: 120px">

					<select name="searchtype" id="search_type" size="1">
					<option value="artists">{="Artists"}</option>
					<option value="albums">{="Albums"}</option>
					<option value="tracks">{="Tracks"}</option>
					<option value="all">{="All"}</option>
					</select>

					<select name="genre" id="genres" size="1" disabled="disabled">
					<option value="">{="Loading"} ...</option>
					</select>

					<input type="button" value="{="Search"}" onclick="window.cclibrary.search()" />
				</div>
			</div>

		</div>

		<div id="statuspane">

			<div id="mediastatus" class="statuscontents">
				<div style="float: right">
					<input class="btn btn-default btn-sm" disabled="disabled" type="button" id="btn_preview" name="preview" value="{="Preview track(s)"}" onmouseup="return window.cclibrary.tracks.preview()" />
				</div>
				<div>
					<input class="btn btn-default btn-sm" type="button" value="{="Return"}" onclick="window.location='index.php'" /> &nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default btn-sm" type="button" value="{="Manage playlists"}" onclick="window.location='index.php?page=playlists'" /> &nbsp;&nbsp;&nbsp;&nbsp;
					{if $allow_file_manager>0}<input class="btn btn-default btn-sm" type="button" id="btn_filemanager" value="{="File Manager"}" onclick="window.location.href='index.php?page=filemanager'" />{/if}
				</div>
			</div>

			<div id="folderstatus" class="statuscontents" style="display: none">
				<div style="float: right">
				</div>
				<div>
					<input class="btn btn-default btn-sm" type="button" value="{="Return"}" onclick="window.location='index.php'" /> &nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>

			<div id="playliststatus" class="statuscontents" style="display: none">
				<div style="float: right">
					{="%s in %s track(s)","<span id='tracktime'>00:00:00</span>","<span id='trackcount'>0</span>"}
					<input class="btn btn-default btn-sm" type="button" id="btn_save" name="save" value="{="Save"}" />
					<input class="btn btn-default btn-sm" type="button" id="btn_revert" name="revert" value="{="Revert"}" />
				</div>
				<input class="btn btn-default btn-sm" type="button" value="{="Return"}" onclick="window.location='index.php'" /> &nbsp;&nbsp;&nbsp;&nbsp;

				<input class="btn btn-default btn-sm" disabled="disabled" type="button" id="btn_top" name="movetop" value="{="Top"}" />
				<input class="btn btn-default btn-sm" disabled="disabled" type="button" id="btn_up" name="moveup" value="{="Up"}" />
				<input class="btn btn-default btn-sm" disabled="disabled" type="button" id="btn_down" name="movedown" value="{="Down"}" />
				<input class="btn btn-default btn-sm" disabled="disabled" type="button" id="btn_bottom" name="movebottom" value="{="Bottom"}" />
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-default btn-sm" disabled="disabled" type="button" id="btn_remove" name="remove" value="{="Remove"}" />
				&nbsp;&nbsp;
			</div>

		</div>

	</div>

	<div id="panelshaded" class="trackscover panelnotloading">
	</div>
	
	<div id="panelloading" class="trackscover panelnotloading">
		<div id="panelloadingmsg">
			<span id="panelloading_load">{="Loading"} ...</span>
			<span id="panelloading_save">{="Saving, please wait"} ...</span><br />
			<img src="../system/images/loading.gif" alt="{="Please wait"}" />
		</div>
	</div>

	<div id="tipbox" class="hide">
		<div id="tipbox_title"></div>
		<div id="tipbox_content"></div>
		<input type="button" class="tipbox_button" id="tipbox_ok" value="{="OK"}" /> <input type="button" class="tipbox_button" id="tipbox_cancel" value="{="Cancel"}" />
	</div>

</form>
