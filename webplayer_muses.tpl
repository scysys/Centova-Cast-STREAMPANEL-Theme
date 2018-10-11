<object width="180" height="60" bgcolor="#FFFFFF">
	<param name="movie" value="{$urlself}/muses/muses.swf" />
	<param name="flashvars" value="url={$tuneinurl}{if $account.servertype=="ShoutCast"};{/if}&lang=en&codec={$tuneinformat}&volume=75&tracking=false&skin={$urlself}/muses/muses-mcclean.xml&title={$account.title|urlencode}&jsevents=false&welcome=" />
	<param name="wmode" value="window" />
	<param name="scale" value="noscale" />
	<embed src="{$urlself}/muses/muses.swf" flashvars="url={$tuneinurl}{if $account.servertype=="ShoutCast"};{/if}&lang=en&codec={$tuneinformat}&volume=75&tracking=false&skin={$urlself}/muses/muses-mcclean.xml&title={$account.title|urlencode}&jsevents=false&welcome=" width="180" scale="noscale" height="60" wmode="window" bgcolor="#FFFFFF" type="application/x-shockwave-flash" />
</object>
