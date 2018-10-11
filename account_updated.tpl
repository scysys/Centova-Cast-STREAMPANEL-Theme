{box title="Edit Account"}

{="Configuration updated successfully."}

{check $type=="client"}
	{="Note that you will need to restart your server for the changes to take effect."}

	{if $result.charsetchanged}
	<br /><br />
	{="Your preferred character encoding has also been changed."}
	{="Note that if you have already imported any media, you should %sclick here%s now to update your media library with the new character encoding.","<a href='index.php?page=importmedia&full=1'>","</a>"}
	{/if}
{/check}

<br /><br />

<a href="{if ($reseller>0) and ($account.reseller>0)}index.php?page=configure{elseif $privileged}index.php?page=accounts&action=edit&username={$account.username}{else}index.php?page=configure{/if}">{="Return"}</a>
{/box}