{javascript}<script>
window.date_format = '{$date_format}';
window.time_format = '{$time_format}';
window.month_names = ['{$month_names|implode:"','"}'];
window.weekday_names = ['{$weekday_names|implode:"','"}'];
</script>{/javascript}

{resource type="js" src="/system/chart.js" depends="jq"}
