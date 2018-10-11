{box title="E-mail connectivity test"}

{="Test result"}:
{if $testresult}
<span style="font-weight: bold; color: #009900">{="PASSED"}</span> - {="Centova Cast appears to be able to send E-mails.  A test message has been sent."}
{else}
<span style="font-weight: bold; color: #FF0000">{="FAILED"}</span> - {="Centova Cast does NOT appear to be able to send E-mails; an error occurred while attempting to send a test message."}
{/if}

<br /><br />
{="Details"}:<br />

<pre style="width: 95%; overflow: auto; padding: 5px; border: 1px dashed #D0D0D0">
{$testdetails|htmlentities}
</pre>

<br />

{if $testresult==0}
{="Please refer to the %sNotification E-mails article section%s in the Centova Cast knowledge base for assistance with setting up an SMTP server to resolve this problem.","<a target='_blank' href='http://www.centova.com/pages/faqs/display/centova_cast_is_not_sending_112'>","</a>"}<br /><br />
{/if}

<a href="index.php?page=settings">{="Return"}</a>

{/box}