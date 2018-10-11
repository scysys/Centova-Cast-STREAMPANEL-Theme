{box title="Album data source test"}

Module: <strong>{$module}</strong><br />
{="Test result"}:

{if $success}
<span style="font-weight: bold; color: #009900">{="PASSED"}</span>
{else}
<span style="font-weight: bold; color: #FF0000">{="FAILED"}</span>
{/if} - {$result}

<br /><br />
Query:<br />
<pre style="height: 50px; overflow: auto; background-color: white; border: 1px solid #999999; padding: 5px">
{loop $line=$query}{$_loop.key}: {$line|htmlentities}{if $line==""}(empty){/if}
{/loop}
</pre>

{if $success}
<br />
Data:<br />

<pre style="height: 50px; overflow: auto; background-color: white; border: 1px solid #999999; padding: 5px">
{loop $line=$song}{$_loop.key}: {$line|htmlentities}{if $line==""}(empty){/if}
{/loop}
</pre>
{/if}

{if $errors}
<br />
Error(s):<br /><br />
<ul>
{loop $error=$errors}	<li>{$error|htmlentities}</li>
{/loop}
</ul>
{/if}

<br />
Details:<br />

<pre style="height: 300px; overflow: auto; background-color: white; border: 1px solid #999999; padding: 5px">
{loop $line=$debug}{$line|htmlentities}
{/loop}
{if $conversation!=""}

Protocol debug:
===============
{$conversation|htmlentities}
{/if}
</pre>
<br />

<a href="index.php?page=settings">{="Return"}</a>

{/box}