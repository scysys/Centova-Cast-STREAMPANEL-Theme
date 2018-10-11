{box title="Licensing server connectivity test"}


{="Test result"}:
{if $testresult}
<span style="font-weight: bold; color: #009900">{="PASSED"}</span> - {="Centova Cast can successfully communicate with the Centova Technologies license servers."}
{else}
<span style="font-weight: bold; color: #FF0000">{="FAILED"}</span> - {="Centova Cast CANNOT reach the Centova Technologies license servers."}<br /><br />

<span class="info">{="Note: if you host your Centova Cast web interface on a different server than your actual streams, this error may not actually represent a problem.  This licensing test is being performed from your web interface server, but only your stream hosting server(s) need to be able to contact the licensing servers for validation."}</span>
{/if}

<br /><br />
{="Details"}:<br /><br />

{$testdetails}<br />

<br />

{if $testresult==0}
{="Please refer to the %slicensing server connectivity article%s in the Centova Cast knowledge base for assistance in diagnosing this problem.","<a target='_blank' href='http://www.centova.com/pages/faqs/display/unable_to_contact_licensing_58'>","</a>"}<br /><br />
{/if}


<a href="index.php?page=settings">{="Return"}</a>

{/box}