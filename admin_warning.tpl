{onready}<script>
    $('#notifyanchor').centovaTip({
    	content: $('#{$warningid}'),
    	tiptype: 'error',
    	delay: 0,
    	callout: false,
    	immediate: true,
    	clicktoclose: true
    });
</script>{/onready}

<div id="{$warningid}" style="display: none">
    <h1>{$warningtitle}</h1>
    <p>{$warningmessage}</p>
</div>
