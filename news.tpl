<div id="newsarticles">
	<div class="box">
		<div class="boxinner boxfirst">
			<div class="boxtitle">
				<div style="float: right; margin-right: 8px"><a href="#" id="closenews"><img src="/system/images/icons/close.png" /></a></div>
				{="News"}
			</div>
		</div>
	{loop $newsarticle=$newsarticles}
		<div class="boxinner boxmulti {if $_loop.last}boxlast{/if}">
			<div class="boxcontent">
				<h1 class="news">{$newsarticle.title|htmlentities}</h1>
				<div class="subtitle">{$newsarticle.publishdate|mysqldatetime:locale:full:$timezoneoffset}</div>
				<p class="subbox">{$newsarticle.content}</p>
			</div>
		</div>
	{/loop}
	</div>
</div>
{onready}
$('#closenews').click(function(){
	$('#newsarticles').remove();
	$.ajax({
		type: "GET",
		url: '/client/rpc.php?m=client.close_news',
		success: function(data,textStatus,xhr) {
			// nada
		},
		error: function() {
			// nope
		},
		dataType: "json"
	});

	return false;
});
{/onready}