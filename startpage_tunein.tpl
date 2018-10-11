<div id="cc_tunein">{loop $player=$players}
	<a href="{$player.tunein|htmlentities}"><img align="absmiddle" src="{$player.image|htmlentities}" border="0" alt="{$player.title|htmlentities}" title="{$player.title|htmlentities}" /></a>{/loop}
</div>
