<?php
error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieIDrecovered'];
$idticket = $_COOKIE['cookieID'];

$kappa = sqlsrv_query($mysqli, "Call MudaGrupo($idticket)");
?>
