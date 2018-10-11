{loop $track=$recenttracks}
<div class="track">
	<div class="cover"><img src="{$baseurl}theme/images/startpage/nocover.png" alt="{="Track cover"}" align="left" width="50" height="43" /></div>
	<span class="title nowplaying">{$track.title|htmlentities}</span><br />
	<span class="artist">{$track.artist|htmlentities}</span><br /><br />
	<a class="price" href="#">{$track.price|htmlentities} - Buy now</a>
</div>
{/loop}		
