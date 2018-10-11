{adminwarning title="Statistics graphs error"}

	{="Your statistics graphs are not working at this time.  Please ensure that PHP's GD extension is installed (including PNG and FreeType support)."}<br /><br />

{="The specific problems detected included:"}<br />
<ul>
	{loop $problem=$imageproblems}
	<li>{$problem|htmlentities}</li>
	{/loop}
</ul>

{="This message will stop appearing (and the graphs will appear) when your server configuration is corrected."}

{/adminwarning}