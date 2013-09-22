<?php
header("Content-type: text/plain");
# $_REQUEST['item'] - item number of the clicked item

# Change item description as user clicks item
$query = "SELECT description FROM itemlist WHERE itemno = " . $_REQUEST['item'];
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");
$description = mysql_fetch_array($results);
echo $description['description'];
?>