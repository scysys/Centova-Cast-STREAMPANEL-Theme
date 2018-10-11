{leftcolumn}
<div id="userclassident">
	<img src="/system/images/icons/admin.png" style="float: left" />
	<div>{if $privilegeclass=="reseller"}{="Reseller login"}{else}{="Administrator login"}{/if}</div>
	{="Managing %s",$account.username}<br />
	<span>{$account.title|htmlentities}</span>
</div>
{/leftcolumn}