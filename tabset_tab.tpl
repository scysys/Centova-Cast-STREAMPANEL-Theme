<div id="tab_{$tabindex}" class="tab_page{if $tab_style_list}_list{/if}" style="{if $tabpageheight}height: {$tabpageheight}px{else}overflow: auto;{/if}">
	{$tab_content}
</div>
{check ($tab_events.show!="") or ($tab_events.hide!="")}
{onready}
{if $tab_events.show!=""}$('#tab_{$tabindex}').bind('tabshow',function(){
	{$tab_events.show}
});{/if}
{if $tab_events.hide!=""}$('#tab_{$tabindex}').bind('tabhide',function(){
	{$tab_events.hide}
});{/if}
{/onready}
{/check}
