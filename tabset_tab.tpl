<div id="tab_{$tabindex}">
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
