<?php
error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieIDrecovered'];
$idticket = $_COOKIE['cookieID'];

<<<<<<< HEAD
$kappa = sqlsrv_query($mysqli, "Call MudaGrupo($idticket)");
=======
$kappa = mysqli_query($mysqli, "Call MudaGrupo($idticket)");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
?>
