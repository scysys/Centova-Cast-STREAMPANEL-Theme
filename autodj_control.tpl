{check $serveronline>0}

{onready}
$('#autodj_control_buttons').find('img').hover(
	function(){ this.src=this.src.replace(/\.png$/,'-on.png'); $(this).addClass('autodj-control-over'); },
	function(){ this.src=this.src.replace(/-on\.png$/,'.png'); $(this).removeClass('autodj-control-over'); }
);
{/onready}
<!--<div id="autodj_control_buttons">
	{if $isdj==0}<a href="index.php?page=configure#tab:{="AutoDJ"}"><img class="autodj-control" src="/system/images/icons/source/control.png" alt="{="Configure"}"
	/>{/if}</a>{if ($sourceonline>0) and ($autodjcaps|contains:"independent")}<a href="index.php?page=control&action=source&switch=down"><img class="autodj-control" src="/system/images/icons/source/stop.png" alt="{="Stop"}" title="{="Stop the autoDJ"}"
	/></a>{/if}{if ($sourceonline>0) and ($autodjcaps|contains:"skip")}<a href="index.php?page=control&action=nextsong"><img class="autodj-control" src="/system/images/icons/source/skip.png" alt="{="Skip"}" title="{="Skip this song."}"
	/></a>{/if}{if ($sourceonline==0) and ($autodjcaps|contains:"independent")}<a href="index.php?page=control&action=source&switch=up"><img class="autodj-control" src="/system/images/icons/source/start.png" alt="{="Start"}" title="{="Start the autoDJ"}"
	/></a>{/if}
</div>-->

{if ($sourceonline>0) and ($autodjcaps|contains:"independent")}
<li class="m-menu__item" aria-haspopup="true"><a href="index.php?page=control&action=source&switch=down" class="m-menu__link "><i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i><span class="m-menu__link-text">{="Stop the autoDJ"}</span></a></li>
{/if}
{if ($sourceonline>0) and ($autodjcaps|contains:"skip")}
<li class="m-menu__item" aria-haspopup="true"><a href="index.php?page=control&action=nextsong" class="m-menu__link "><i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i><span class="m-menu__link-text">{="Skip this song."}</span></a></li>
{/if}
{if ($sourceonline==0) and ($autodjcaps|contains:"independent")}
<li class="m-menu__item" aria-haspopup="true"><a href="index.php?page=control&action=source&switch=up" class="m-menu__link "><i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i><span class="m-menu__link-text">{="Start the autoDJ"}</span></a></li>
{/if}
<hr style="border-top: 1px solid white;">

{/check}