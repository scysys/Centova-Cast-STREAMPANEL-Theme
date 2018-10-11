<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>{$title}</title>
	<link rel="stylesheet" type="text/css" href="theme/login.css" />
	<link rel="stylesheet" type="text/css" href="theme/install.css" />
	{$head}
</head>
<body onload="{if $pageid=="login"}document.getElementById('loginfield').focus(){elseif $pageid=="forgot"}document.getElementById('emailfield').focus(){else}void(0){/if}">


<div id="installform">

<div id="innerform" align="center">
	<div id="logo">
        <img src="theme/images/login-logo.png" alt="Centova Cast" />
    </div>
    <div id="subtitle">Control Panel Installation</div>


	{$form}
