{resource class="reportformat" type="js"}
{resource class="reportformat" type="css"}

{css}
.box { margin-bottom: 4px; }
{/css}

{object name="reportlayout"}
{loop $val=$reportlayout}	{$_loop.key}: {$val|json_encode}{if $loop.last==0},{/if}
{/loop}
{/object}

<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}" id="reportformat_form">

{if $errors|count}
{box title="Error"}{="One or more issues were found with your submission.  Please correct the fields marked with asterisks"} (<span class="error">*</span>).{/box}<br />
{elseif $error}
{box title="Error"}{="An error occurred while attempting to save this update."}{/box}<br />
{/if}

{box title="Report Settings"}
	<table cellspacing="1" cellpadding="1" border="0">
    <tr>
		<td>{="Title"}: {$errors.title|checkerror}</td>
		<td><input type="text" name="reportformat[title]" size="50" maxlength="255" value="{$reportformat.title|htmlentities}" /></td>
	</tr>
    <tr>
		<td>{="Type"}: {$errors.reporttype|checkerror}</td>
		<td>
			<select name="reportformat[reporttype]" id="reporttype" size="1">
			<option value="playlist"{if $reportformat.reporttype=="playlist"} selected="selected"{/if}>{="Playlist report"}</option>
			<option value="performance"{if $reportformat.reporttype=="performance"} selected="selected"{/if}>{="Performance report"}</option>
			</select>
		</td>
	</tr>
    </table>
{/box}

{box title="Report Columns" class="reportcolumns"}

	<div style="float: left; width: 30%">
		<h1>{="Included Columns"}</h1>
	</div>
	<div style="float: left; width: 60%">
		<h1>{="Available Columns"}</h1>
	</div>

	<div style="float: left; width: 30%; height: 350px; overflow: auto">
		<ol id="usedcolumns" class="columnlist"></ol>
	</div>
	<div style="float: left; width: 60%; height: 350px; overflow: auto">
		<ol id="availablecolumns" class="columnlist"></ol>
	</div>
	<div style="clear: both"></div>

	<div class="info">{="Choose the columns to include in the report.  Drag column titles to add, remove, or reorder them."}</div>
{/box}

{box title="Save"}
	<input type="hidden" name="reportformat[columns]" id="reportcolumns" value="{$reportformat.columns|htmlentities}" />
	<input type="submit" name="update" value="{="Save"}" />
	<input type="button" value="{="Cancel"}" onclick="window.location='{$indexself}'; return false" />
{/box}

</form>

