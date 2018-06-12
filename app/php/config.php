<?php

$databaseHost = 'localhost';
$databaseName = 'emails';
$databaseUsername = 'cod';
$databasePassword = 'cod';

date_default_timezone_set('Europe/Lisbon');

$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName);

/*
if ($mysqli->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
*/

?>