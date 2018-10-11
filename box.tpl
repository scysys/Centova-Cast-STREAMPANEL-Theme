<div class="box{if $boxclass} {$boxclass}{/if}"{if $boxid} id="{$boxid}"{/if}>
	<div class="boxinner{if $boxtitle==""} boxnotitle{/if}">
{if $boxtitle!=""}		<div class="boxtitle">{$boxtitle}</div>{/if}
		<div class="boxcontent">
{$boxcontent}
		</div>
	</div>
</div>