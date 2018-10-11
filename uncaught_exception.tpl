<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>{$title}</title>
{if $_CONSTANTS.USE_CONSOLIDATED_JS}
	{* uncaught exception handler should not depend on automatic resource consolidation functionality or other advanced templating features *}
	<link rel="stylesheet" type="text/css" href="../theme/res.common.css" />
	<link rel="stylesheet" type="text/css" href="../theme/critical_error.css" />
	<script language="javascript" src="../system/res.common.js"></script>
{else}
	<link rel="stylesheet" type="text/css" href="../theme/jquery.centova.tooltip.css" />
	<link rel="stylesheet" type="text/css" href="../theme/jquery.centova.overlay.css" />
	<link rel="stylesheet" type="text/css" href="../theme/critical_error.css" />
	<script language="javascript" src="../system/utility.js"></script>
	<script language="javascript" src="../system/jquery.min.js"></script>
	<script language="javascript" src="../system/jquery.domec.js"></script>
	<script language="javascript" src="../system/jquery.centova.util.js"></script>
	<script language="javascript" src="../system/jquery.centova.tooltip.js"></script>
	<script language="javascript" src="../system/jquery.timers.js"></script>
{/if}
	<script language="javascript">
	$(function() {
		$('#errordetails').hide().removeClass('hide');
		$('#errormsg').centovaTip({
			content: $('#msg'),
			delay: 0,
			callout:false,
			tiptype: 'error',
			position: 'bottom',
			immediate: true,
			clone: false,
			width: 350
		});
	});
	function toggle_error_details() {
		var $errordetails = $('#errordetails');
		$errordetails.toggle(0,function() {
			$('#errormsg').centovaTip({ resize: true });
		});
		
	}
	</script>
	{$head}
</head>
<body>

<div class="ctip" id="msg">
	<h1>{="Internal Error"}</h1>

{check $exception.brief}
	{$exception.message|htmlentities}
{otherwise}
	{="We apologize for the inconvenience, but an internal error has occurred.  Please try again later."}

	<div class="hide" id="errordetails">
	<p>
	{$exception.message|htmlentities} {if ($exception.file!="") or ($exception.line!="")}in <strong>{$exception.file|htmlentities}</strong>:<strong>{$exception.line|htmlentities}</strong>{/if}<br /><br />

	{if $exception.trace!=""}<span id="errortrace">{$exception.trace|htmlentities|preg_replace:/^(\#[0-9]+)/m:"<strong>\1</strong>"|nl2br}</span>{/if}
	</p>
	</div>
{/check}

	<div style="text-align: center; margin-bottom: 5px">
	<form>
	<input type="button" value="{="OK"}" onclick="window.location='../index.php'" />
{check $exception.brief==0}
	<input type="button" value="{="Details"}" onclick="toggle_error_details()" />
{/check}
	</form>
	</div>

</div>

<div id="errormsg"></div>


<div id="footer">
	<div class="content">
		{="Copyright"} 2006-{$_CONSTANTS.PRODUCT_YEAR}, Centova Technologies Inc.
	</div>
</div>

</body>
</html>