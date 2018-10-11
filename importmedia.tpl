{resource type="js" class="rpc"}

{javascript}<script>
function show_return(visible) {
    var el = $('#returnlink');
    if (visible) {
        el.show();
    } else {
        el.hide();
    }
}

function import_complete(id) {
	show_return(true);
}

function import_begin() {
	show_return(false);
	
	var importid = 'import'+Math.random();
	importid = importid.substring(0,16);

	window.progress = new Progress('#importmedia');
	window.progress.rpc_setup(importid,import_complete);

    var el = $('#reindexframe');
    el.attr('src','index.php?page=importmedia&go=1&full={$full|htmlentities}&importid='+importid);
}
</script>
{/javascript}
{onready}
	import_begin();
{/onready}

<form>
{box title="Update progress"}
    <div id="status" style="float: right; text-align: right">
    </div>
	{$_|ccmeter:100:importmedia}
{/box}

{box title="Log"}
	<iframe width="100%" style="height: 100px" name='reindexframe' id='reindexframe' src='../empty.html' marginwidth='0' marginheight='0' framespacing="0" frameborder="no" scrolling="auto"></iframe>
{/box}
</form>

<br />

<div id="returnlink">
	<form action="index.php?page=library" method="get">
	<div style="float: right">
		<input type="button" onclick="window.location = 'index.php?page=importmedia&full=1'" value="{="Perform full library update"}" />
	</div>
	<input type="submit" value="{="Return"}" />
	</form>
</div>
