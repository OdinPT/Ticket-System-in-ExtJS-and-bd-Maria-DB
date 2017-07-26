<?php
include("config.php");
$id = $_COOKIE['cookieID'];
$kappa = mysqli_query($mysqli, "call LimpaRespostas($id)");
?>
