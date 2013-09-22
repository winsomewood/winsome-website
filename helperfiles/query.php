<?php
# Connect to MySQL database and perform two queries on the furniture database, $query and $query2.
# Returns $results and $results2, the corresponding results of the queries.
# Two queries are used because many of the pages require multiple queries.
# query - the first query to perform
# query2 - the second query to perform

$db = mysql_connect("localhost", "root", 'm4yfL#$R');
if (!$db) {
  die("Connect failed: " . mysql_error());
}
if (!mysql_select_db("winsome")) {
  die("Selecting DB failed: " . mysql_error());
}

if ($query) {
	$results = mysql_query($query);
	if (!$results) {
	  die("SQL query failed:\n$query\n" . mysql_error());
	}
}

if ($query2) {
	$results2 = mysql_query($query2);
	if (!$results2) {
	  die("SQL query failed:\n$query\n" . mysql_error());
	}
}
?>
