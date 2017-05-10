<?php
//including the database connection file
include("config.php");

//getting id of the data from url
$id = $_COOKIE['cookieIDrecovered'];

//deleting the row from table
$kappa = mysqli_query($mysqli, "Call ApagarEmails($id)");
//redirecting to the display page (index.php in our case)
?>
