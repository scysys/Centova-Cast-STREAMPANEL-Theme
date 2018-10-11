{resource type="js" src="/system/zxcvbn.js" id="zxcvbn"}
{resource type="js" src="/system/jquery.centova.password.js" depends="common,zxcvbn"}
{resource type="css" src="/system/jquery.centova.password.css"}

{language}
	password_error: '{="Password error"}',
	password_error_length: '{="password too short; a minimum of %d characters is required, and 8 or more is strongly recommended"}',
	password_error_chars: '{="invalid characters in password; valid characters are A-Z, a-z, 0-9, and any symbol except backslash or space"}',
	password_error_insecure: '{="password is insecure; strong passwords are not based on dictionary words, and use a variety of digits, symbols, and upper and lower-case letters"}',

{/language}

{onready method="prepend"}
	$.centovaPassword.setOptions({
		minlength: {$_CONSTANTS.MIN_PASSWORD_LENGTH},
		error_caption: window.lang.password_error,
		error_length: window.lang.password_error_length,
		error_chars: window.lang.password_error_chars,
		error_insecure: window.lang.password_error_insecure
	});
{/onready}
