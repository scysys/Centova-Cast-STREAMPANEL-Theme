
{="Ignore metadata containing any of these substrings (one per line)"}:

{tip type="icon"}{="Enter one substring to match per line (case-insensitive).  Metadata strings matching one of these substrings are completely excluded from Centova Cast's statistics.  Excluding frequently-used strings (such as jingle titles) can dramatically improve the performance of your statistics.%sOptionally begin and end a line with '/' to specify a Perl-compatible regular expression to match.","<br/><br/>"}{/tip}

<br /><br />
<textarea id="ignoremeta" name="config[ignoremeta]" rows="10" cols="50">{$config.ignoremeta|htmlentities}</textarea>
