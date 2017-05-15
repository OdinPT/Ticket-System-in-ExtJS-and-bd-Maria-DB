<?php
//including the database connection file
include("config.php");

//getting id of the data from url
//deleting the row from table
$kappa = mysqli_query($mysqli, "TRUNCATE TABLE emails");
?>
