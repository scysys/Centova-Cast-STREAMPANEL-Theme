{check $privileged>0}
<div id="topbar_admin">
	<div style="float: right">Centova Cast v{$_CONSTANTS.PRODUCT_VERSION} | {="Copyright"} 2006-{$_CONSTANTS.PRODUCT_YEAR}, <a href="http://www.centova.com">Centova Technologies Inc.</a></div>
	<a href="{if $admin>0}/admin/{else}/reseller/{/if}">{="Home"}</a>{if $admin>0} | <a target="_blank" href="http://www.centova.com/pages/cast">{="Support"}</a> | <a href="{$selfuri}?page=about">{="About"}</a>{/if}
</div>
{otherwise}
<div id="topbar_client">
	<div id="topbar_client_tunein">
		<strong{if $serviceonline==0} class="transparent"{/if}>{="Tune In"}:</strong>&nbsp; {$tunein}
	</div>
	<img src="../theme/images/topbarheadphones.png" alt="*" align="absmiddle" /> {$currentsong}
</div>
{/check}
