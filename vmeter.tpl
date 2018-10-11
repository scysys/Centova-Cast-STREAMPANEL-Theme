<div class="vmeter_bg" style="width: {$graph_width}px; height: {$graph_height}px"{if $graph_id} id="graph_{$graph_id}"{/if}>
	{check $graph_filled>0}<div class="vmeter_fg" style="width: {$graph_width}px; height: {$graph_filled}px; margin-top: {$graph_remainder}px; background-color: {$graph_color}">&nbsp;</div>{/check}
</div>
