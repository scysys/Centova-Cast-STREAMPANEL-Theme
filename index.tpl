{$warnings}
{$news}

<img src="../system/images/icons/tracks.png" align="absmiddle" /> {="Recent tracks"}:<br />

<div class="tablewrapper" style="padding-bottom: 1px">
    <div id="cc_recenttracks_{$account.username|htmlentities}" class="cc_recenttracks_list"></div>
</div>
<script language="javascript" type="text/javascript">
if (!window.centovacast) window.centovacast = {};
if (!window.centovacast.options) window.centovacast.options = {};
window.centovacast.options.recenttracks = { track_limit: 8 }
</script>
<script language="javascript" type="text/javascript" src="../system/recenttracks.js"></script>
