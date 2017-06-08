<?php
include("config.php");
//getting id from url
$id = $_COOKIE['cookieID'];
$muda = mysqli_query($mysqli, "UPDATE emails SET state='Lido' WHERE id='$id'");

?>