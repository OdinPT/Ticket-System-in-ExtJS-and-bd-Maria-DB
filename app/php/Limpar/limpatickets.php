<?php
//including the database connection file
include("config.php");

//getting id of the data from url
//deleting the row from table
$kappa = sqlsrv_query($mysqli, "TRUNCATE TABLE emails");
?>
