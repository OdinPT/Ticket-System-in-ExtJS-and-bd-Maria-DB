<?php
include("config.php");
//IdTicketEstado

$IdTicketEstado = $_COOKIE['cookieID'];
$IDEDep = $_POST['id_departamentos'];
$IDFuncEstado =  $_COOKIE['cookieEmail'];

//$IdTicketEstado = $_COOKIE['cookieID'];
//$IDEDep = $_POST['ID_Dep'];
//$IDFuncEstado =  $_COOKIE['cookieEmail'];


$insere = mysqli_query($mysqli, "call InserirHistoricoDepartamentos('$IdTicketEstado','$IDEDep','$IDFuncEstado');");

mysqli_close($mysqli);

?>

