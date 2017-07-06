<?php
error_reporting(0);
include("config.php");

$IdTicketEstado = $_COOKIE['cookieID'];
$IdTipoRes = $_POST['IdTipoRes'];
$IDFuncEstadox =  $_COOKIE['cookieEmail'];

$insere = sqlsrv_query($mysqli, "call inserirhistoricoestados2('$IdTicketEstado','$IDFuncEstadox','$IdTipoRes');");

sqlsrv_close($mysqli);

?>

