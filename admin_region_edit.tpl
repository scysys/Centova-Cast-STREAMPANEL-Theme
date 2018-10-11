<table cellspacing="1" cellpadding="1" border="0">
<tr>
	<td width="140">{="Region title"}: {$errors.title|checkerror}</td>
	<td><input type="text" name="region[title]" size="50" maxlength="255" value="{$region.title|htmlentities}" />{tip type="icon"}{="Specifies a descriptive title for this region.  Examples might include 'Europe West' or 'Vancouver'."}{/tip}</td>
</tr>
<tr>
	<td>{="Region name"}: {$errors.name|checkerror}</td>
	<td>
		<input type="text" name="region[name]" size="16" maxlength="32" value="{$region.name|htmlentities}" />
		{tip type="icon"}{="A short identifier for this region, from 3 to 32 characters in length, using the characters A-Z, 0-9, underscore (_) or dash (-) only.  Examples might include 'eu-west' or 'van'."}{/tip}
	</td>
<tr>
	<td>{="Provision to"}:</td>
	<td>
		<select id="region_target" name="region[target]" size="1">
		<option {if $region.target=="minaccounts"}selected="selected" {/if}value="minaccounts">{="Host with fewest accounts"}</option>
		<option {if $region.target=="minxferquota"}selected="selected" {/if}value="minxferquota">{="Host with lowest data transfer quota"}</option>
		<option {if $region.target=="minxferusage"}selected="selected" {/if}value="minxferusage">{="Host with lowest actual data transfer"}</option>
		<option {if $region.target=="mindiskquota"}selected="selected" {/if}value="mindiskquota">{="Host with lowest disk quota"}</option>
		<option {if $region.target=="mindiskusage"}selected="selected" {/if}value="mindiskusage">{="Host with lowest actual disk usage"}</option>
		<option {if $region.target=="serverid"}selected="selected" {/if}value="serverid">{="Specific server"}</option>
		</select>
	</td>
</tr>
<tr id="region_targethost">
	<td>{="Target host"}:</td>
	<td>
{if $hosts|count==0}
		{="No hosts assigned to this region."}
		<input type="hidden" name="region[targetid]" value="0" />
{else}
		<select name="region[targetid]" size="1">
		{loop $host=$hosts}
		<option {if $region.targetid==$host.id}selected="selected" {/if}value="{$host.id}">{$host.title|htmlentities} ({if $host.hostname!=""}{$host.hostname|htmlentities}{else}{$host.ipaddress|htmlentities}{/if})</option>
{/loop}
		</select>
{/if}
	</td>
</tr>

</table>

<script language="javascript" type="text/javascript">
$(function(){
	$('#region_targethost').hide();
	$('#region_target').change(function(){
		var $this = $(this);
		var $opt = $this.getSelectedOption();
		if ($opt.val()=='serverid') {
			$('#region_targethost').show();
		} else {
			$('#region_targethost').hide();
		}

	});
});
</script>