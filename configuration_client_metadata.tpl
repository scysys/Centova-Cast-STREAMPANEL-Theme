<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {="Metadata"} </h3>
</div>
</div>
</div>
<div class="m-portlet__body">

<div class="input-group mb-6">
<textarea class="form-control" id="ignoremeta" name="config[ignoremeta]" rows="10" cols="50" aria-describedby="help-metadata-text">{$config.ignoremeta|htmlentities}</textarea>
</div>
<label for="help-metadata-text"><small>{="Ignore metadata containing any of these substrings (one per line)"}: {tip type="icon"}{="Enter one substring to match per line (case-insensitive).  Metadata strings matching one of these substrings are completely excluded from Centova Cast's statistics.  Excluding frequently-used strings (such as jingle titles) can dramatically improve the performance of your statistics.%sOptionally begin and end a line with '/' to specify a Perl-compatible regular expression to match.","<br/><br/>"}{/tip}</small></label>

</div>
</div>
