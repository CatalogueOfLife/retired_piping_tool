<?php
function pc_print_link($inactive, $text, $offset='', $per_page='', $url_query_str='')
{
	if ($inactive)
		print "<span class='inactive'>$text</span>";
	else
	{
		// This is to stop offset goes negative and crash mySQL!
		if ($offset < 1)
			$offset = 1;

		print "<span class='active'>".
			  "<a href='" . htmlentities($_SERVER['PHP_SELF']) .
			  "?offset=$offset&per_page=$per_page".
			  $url_query_str .  "'>$text</a></span>";
	}
}

function pc_indexed_links($total, $offset, $per_page, $url_query_str)
{
	$separator = ' | ';

	// print "<<Prev" link
	pc_print_link($offset == 1, '<< Prev', $offset - $per_page, $per_page, $url_query_str);

	// print all groupings except last one
	for (	$start = 1, $end = $per_page;
			$end < $total;
			$start += $per_page, $end += $per_page)
	{
		print $separator;
		pc_print_link($offset == $start, "$start-$end", $start, $per_page, $url_query_str);
	}

	// print the last grouping -
	// at this point, $start points to the element at the beginning
	// of the last grouping

	// the text should only contain a range if there's more than
	// one element on the last page. For example, the last grouping
	// of 11 elements with 5 per page should just say "11", not "11-11"

	$end = ($total > $start) ? "-$total" : '';

	print $separator;
	pc_print_link($offset == $start, "$start$end", $start, $per_page, $url_query_str);

	// print "Next>>" link
	print $separator;
	pc_print_link($offset == $start, 'Next >>', $offset + $per_page, $per_page, $url_query_str);
}


// Display sort selection button
function select_int_sort($sort_by, $per_page)
{
	echo "<font size=-1>Sort by:</font>";
	echo "\n\t<select name='sort_by'>";

	echo "<option ";
	($sort_by == 'int_id') ?  print "selected " : print " ";
	echo "value ='int_id'>Int ID</option>";

	echo "<option ";
	($sort_by == 'description') ? print "selected " : print " ";
	echo "value ='description'>Description</option>";

	echo "<option ";
	($sort_by == 'clone_name') ? print "selected " : print " ";
	echo "value ='clone_name'>Clone Name</option>";

	echo "<option ";
	($sort_by == 'gene') ? print "selected " : print " ";
	echo "value ='gene'>Gene</option>";

	echo "\n\t</select>";
	echo " <font size=-1>Rows per page:</font>";
	echo "\n\t<input style='text-align:center' name='per_page' value=$per_page size = '3' />";

	// Display an Refresh button
	echo "\n<input name='refresh' type='submit' value='Refresh' />";
}

// Global variables for generate Ensembl URL
$scheme		= 'https';
$domain		= 'cytocell.eaglegenomics.com';
$species	= 'Homo_sapiens';

// gen_URL() generates URL for a given coordinate
function gen_URL($coord)
{
	global $scheme;
	global $domain;
	global $species;

	$URL  = $scheme . "://" . $domain . "/" . $species;
	$URL .= "/Location/View?r=" . $coord;

	return $URL;
}
?>
