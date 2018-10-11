
<ul data-role="listview">
{loop $heading=$menu}
	{check $heading.items}
	<li>
		<a href=""#"><h2>{$heading.name}</h2>
		{if $heading.title}<p>{$heading.title}</p>{/if}</a>
		<!--
		<ul data-role-"listview">
			{subloop $item=$heading.items}
			<li><a href="{$item.url}" title="{$item.title}"{if $item.confirm} onclick="return confirm('{$item.confirm|jsescape}')"{/if}>{$item.name}</a></li>
			{/subloop}
		</ul>
		-->
	</li>
	{otherwise}
	<li><a href="{$heading.url}">{$heading.name}</a></li>
	{/check}
{/loop}
</ul>

<a href="/m/login/index.php?logout=1" id="btn_prev">{="Log Out"}</a>
