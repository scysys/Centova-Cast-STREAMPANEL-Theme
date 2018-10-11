<div{if $graph_elementid} id="{$graph_elementid}"{/if} class="graph_bg{if $graph_classname} {$graph_classname}{/if}">
	{loop $graph_bar=$graph_fgwidths}<div class="graph_fg" style="width: {$graph_bar.width}px{if $graph_bar.color!=""}; background-image: url(../system/images/graphs/graph-fg{$graph_bar.color}.png){/if}">{/loop}&nbsp;{loop $graph_bar=$graph_fgwidths}</div>{/loop}
</div>