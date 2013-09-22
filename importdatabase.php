<?php
# first get a mysql connection as per the FAQ

$db = mysql_connect('localhost', 'root', 'putter') or die('Error connecting to mysql');
mysql_select_db('winsome');

$completeitemlist = explode("\n", file_get_contents("itemlist.txt"));

for ($i = 0; $i < count($completeitemlist); $i++) {
	$sql = "insert into itemlist values ('". implode("','", explode("|", $completeitemlist[$i])) . "')";
	mysql_query($sql);
	echo $sql . "<br>\n";
	if(mysql_error()) {
		echo mysql_error() ."<br>\n";
	}
}
?>