{check $serveronline>0}

{onready}
$('#autodj_control_buttons').find('img').hover(
	function(){ this.src=this.src.replace(/\.png$/,'-on.png'); $(this).addClass('autodj-control-over'); },
	function(){ this.src=this.src.replace(/-on\.png$/,'.png'); $(this).removeClass('autodj-control-over'); }
);
{/onready}
<div id="autodj_control_buttons">
	{if $isdj==0}<a href="index.php?page=configure#tab:{="AutoDJ"}"><img class="autodj-control" src="/system/images/icons/source/control.png" alt="{="Configure"}"
	/>{/if}</a>{if ($sourceonline>0) and ($autodjcaps|contains:"independent")}<a href="index.php?page=control&action=source&switch=down"><img class="autodj-control" src="/system/images/icons/source/stop.png" alt="{="Stop"}" title="{="Stop the autoDJ"}"
	/></a>{/if}{if ($sourceonline>0) and ($autodjcaps|contains:"skip")}<a href="index.php?page=control&action=nextsong"><img class="autodj-control" src="/system/images/icons/source/skip.png" alt="{="Skip"}" title="{="Skip this song."}"
	/></a>{/if}{if ($sourceonline==0) and ($autodjcaps|contains:"independent")}<a href="index.php?page=control&action=source&switch=up"><img class="autodj-control" src="/system/images/icons/source/start.png" alt="{="Start"}" title="{="Start the autoDJ"}"
	/></a>{/if}
</div>

{/check}