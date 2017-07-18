<?php
//including the database connection file
include("config.php");

//getting id of the data from url
$id = $_COOKIE['cookieIDhistorico'];

//deleting the row from table
$kappa = mysqli_query($mysqli, "Call ApagarEmails($id)");

?>
