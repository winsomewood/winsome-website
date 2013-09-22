<?php
/*
* This script counts the number of files in the current directory.
* There cannot be any other files besides the slideshow images and this script in the directory.
*/
header("Content-type: text/plain");

$directory = opendir('images/collectionimages');
while ($file = readdir($directory)) {
	if ($file != "." && $file != "..") {
		$files[] = $file;
	}
}
sort($files);
closedir($directory);

echo implode("|", $files);
?>