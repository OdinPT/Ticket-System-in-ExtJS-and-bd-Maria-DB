<?php
//including the database connection file
include("config.php");

//getting id of the data from url
$id = $_COOKIE['cookieIDhistorico'];

//deleting the row from table
<<<<<<< HEAD
$kappa = sqlsrv_query($mysqli, " Call ApagarEmails($id)");
=======
$kappa = mysqli_query($mysqli, " Call ApagarEmails($id)");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

//redirecting to the display page (index.php in our case)
?>
