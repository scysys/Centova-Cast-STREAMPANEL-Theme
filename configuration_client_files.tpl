<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {="Files"} </h3>
</div>
</div>
</div>
<div class="m-portlet__body">

<div class="input-group mb-6">
<div class="input-group-prepend">
<span class="input-group-text" id="help-spintro">{="Introduction file"}</span>
</div>
<input class="form-control" type="file" name="introfile" id="help-spintro-text" aria-describedby="help-spintro" />
</div>
<label for="help-spintro-text"><small>{="The introduction file is an audio file that is played immediately after each listener connects, before tuning in to the live stream."}  {="Note that this file must match the bit rate, sample rate, and number of channels configured for your stream."}</small></label>

{if $config.introfile}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Currently"}: <strong>{$config.introfile|htmlentities}</strong></span>
</div>
<input class="form-control" type="checkbox" name="removefile[introfile]" value="1" /> {="Remove introduction file"}
</div>
{/if}

<div class="input-group mb-6">
<div class="input-group-prepend">
<span class="input-group-text" id="help-spfallback">{="Introduction file"}</span>
</div>
<input class="form-control" type="file" name="fallbackfile" id="help-spfallback-text" aria-describedby="help-spfallback" />
</div>
<label for="help-spfallback-text"><small>{="The fallback file is an audio file that is played in a loop if the source stream disconnects."}  {="Note that this file must match the bit rate, sample rate, and number of channels configured for your stream."}</small></label>

{if $config.fallbackfile}
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Currently"}: <strong>{$config.fallbackfile|htmlentities}</strong></span>
</div>
<input class="form-control" type="checkbox" name="removefile[fallbackfile]" value="1" /> {="Remove fallback file"}
</div>
{/if}

</div>
</div>
