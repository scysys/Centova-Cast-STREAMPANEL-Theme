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

<div id="newsarticles">
<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
    <div class="m-portlet__head sp-box-table">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text sp-box-table"> {="News"} </h3>
            </div>
        </div>
        <div class="m-portlet__head-tools">
            <ul class="m-portlet__nav">
                <li class="m-portlet__nav-item"> <a href="#" id="closenews" class="m-portlet__nav-link btn btn-light m-btn m-btn--pill m-btn--air"> <i class="fas fa-times-circle"></i> </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="m-portlet__body">
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