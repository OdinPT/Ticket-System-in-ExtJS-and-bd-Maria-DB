<?php
include("config.php");
//IdTicketEstado

$IdTicketEstado = $_COOKIE['cookieID'];
$IDEstadoEstado = $_POST['ID_Estado'];
$IDFuncEstado =  $_COOKIE['cookieEmail'];


$insere = mysqli_query($mysqli, "call inserirhistoricoestados('$IdTicketEstado','$IDEstadoEstado','$IDFuncEstado');");

mysqli_close($mysqli);

?>

