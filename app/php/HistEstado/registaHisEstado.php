<?php
include("config.php");
//IdTicketEstado

/*
IN `IdTicket` INT, IN `IDEstado` INT, IN `IDFuncEst`

*/

$IdTicketEstado = $_COOKIE['cookieID'];
$IDEstadoEstado = $_POST['IDEstadoEstado'];
$IDFuncEstado =  $_COOKIE['cookieEmail'];


$insere = mysqli_query($mysqli, "call inserirhistoricoestados('$IdTicketEstado','$IDEstadoEstado','$IDFuncEstado');");
mysqli_close($mysqli);

?>

