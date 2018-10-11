{* Includes *}
{resource class="common" type="js"}
{resource class="common" type="css"}

{if $custom_css}<style type="text/css">
{$custom_css}
</style>
{/if}
{if $uidebug}
<script language="javascript" type="text/javascript" src="../debug/console/debugconsole.js"></script>
<script language="javascript" type="text/javascript" src="../debug/firebug/firebug-lite.js"></script>
<script language="javascript" type="text/javascript">
firebug.env.debug = false;
</script>
{/if}

{get_resources}

{check ($custom_onready!="") or ($custom_onready_last!="") or ($custom_javascript!="") or ($js_language!="") or ($js_options!="") or ($js_centovacast!="")}
<script language="javascript" type="text/javascript">
{if $js_language!=""}window.lang = {
{$js_language}
};
{/if}
{if ($js_options!="") or ($js_centovacast!="")}$.extend(true,window.centovacast || (window.centovacast = {}),{{/if}
{if ($js_centovacast!="")}{loop $js_centovacast_block=$js_centovacast}{$_loop.key}: {
{$js_centovacast_block}
}{compare $_loop.last,0,",",""}{/loop}{/if}{if ($js_options!="") and ($js_centovacast!="")},{/if}
{if ($js_options!="")}
options: {
{loop $js_option_block=$js_options}{$_loop.key}: {
{$js_option_block}
}{compare $_loop.last,0,",",""}
{/loop}}
{/if}
{if ($js_options!="") or ($js_centovacast!="")}});{/if}

{if $custom_javascript!=""}{$custom_javascript}
{/if}
{if ($custom_onready!="") or ($custom_onready_last!="")}
$(function(){
{$custom_onready}{$custom_onready_last}
});
{/if}</script>
{/check}
