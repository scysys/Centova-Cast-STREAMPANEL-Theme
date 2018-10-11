{include "password_field.tpl"}

<script language="javascript">
var Login = Class.extend({

	caps_warned: false,
	
	init: function() {
		var self = this;

		$('input[type="password"]').centovaPassword({ validate: false });
	    $('#passwordfield').keypress(function(e){ return self.test_caps_lock(e); });
	    $('input[validate]').centovaValidation();
	    $('#usernamefield').focus();
	},

	test_caps_lock: function(e) {
		var uppercase = (e.which>=65) && (e.which<=90);
		var lowercase = (e.which>=97) && (e.which<=122);
		var shifted = e.shiftKey;

		var capslock = (uppercase || lowercase) && (shifted!=uppercase);

		if ( capslock && !this.caps_warned) {
			$(e.target).centovaTip({
				tiptype: 'info',
				title: window.lang.caps_lock_title,
				content: window.lang.caps_lock_warning,
				position: 'right',
				delay: 0,
				immediate: true,
				clicktoclose: true
			});
			this.caps_warned = true;
		} else if (!capslock && this.caps_warned) {
			$(e.target).centovaTip(false);
			this.caps_warned = false;
		}
	}

});

$(function(){
	register_lang({
	    caps_lock_warning: '{="Your caps lock key appears to be on.  Note that passwords in Centova Cast are case-sensitive so you may need to turn off caps lock in order to log in successfully."}',
	    caps_lock_title: '{="Caps lock warning"}'
	});

	if (!window.centovacast) window.centovacast = {};
	window.centovacast.login = new Login();
});
</script>