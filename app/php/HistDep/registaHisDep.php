<?php
error_reporting(0);
include("config.php");


$IdTicketEstado = $_COOKIE['cookieID'];
$IDEDep = $_POST['id_departamento'];
$IDFuncEstado =  $_COOKIE['cookieEmail'];

$insere = sqlsrv_query($mysqli, "call InserirHistoricoDepartamentos('$IdTicketEstado','$IDEDep','$IDFuncEstado');");

sqlsrv_close($mysqli);

?>

