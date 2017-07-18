<?php
error_reporting(0);

$conn = mysql_connect("localhost","root","root")
			or die("cannot connected");


@mysql_select_db("test",$conn);

$databaseHost = 'localhost';
$databaseName = 'emails';
$databaseUsername = 'root';
$databasePassword = '';

$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName);

?>
