<?php
include("config.php");
//IdTicketEstado

$horaatribuicao = $_POST['horaatribuicao'];

$IdTicketEstado = $_COOKIE['cookieID'];

$IDEstadoEstado = $_POST['IDEstadoEstado'];
$DataAlteracaoEstado = $_POST['DataAlteracaoEstado'];

$IDNovoEstado = $_POST['IDNovoEstado'];

$IDFuncEstado =  $_COOKIE['cookieEmail'];


$insere = mysqli_query($mysqli, "call inserirhistoricoestados('$horaatribuicao','$IdTicketEstado','$IDEstadoEstado','$DataAlteracaoEstado','$IDNovoEstado','$IDFuncEstado');");
mysqli_close($mysqli);

?>

