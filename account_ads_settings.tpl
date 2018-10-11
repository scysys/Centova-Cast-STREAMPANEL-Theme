{resource class="adsorder" type="js"}
{resource class="adsorder" type="css"}

	<fieldset>
		<legend>{="Settings"}</legend>

		{="Album covers will be retrieved from the following sources in the order shown.  Drag to change the order."}
		<div style="width: 300px">
			<ol id="adsorder" class="sortablelist">{loop $driver=$ads_drivers}
				<li>{$driver.title} <input type="text" name="config[adspriority][{$driver.name}]" size="3" value="{if $driver.disabled}0{else}{$_loop.iteration}{/if}" /></li>
			{/loop}</ol>
		</div>


		<div id="dbglog"></div>

	</fieldset>
