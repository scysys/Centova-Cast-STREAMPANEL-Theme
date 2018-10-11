{onready}
	if (!window.centovacast) window.centovacast = {};
	window.centovacast.tabset = new TabSet('pagetabs','window.centovacast.tabset'{if $tabset_name},'{$tabset_name}'{/if});
	window.centovacast.tabset.build( [{loop $tab=$tab_list}
		{ title: '{$tab.title|jsescape}', callback: {$tab.callback|default:"null"}, index: 'tab_{$tab.index}' }{if $_loop.last==0},{/if}{/loop}
	] );
	window.centovacast.tabset.select({$tab_selected});
{/onready}

