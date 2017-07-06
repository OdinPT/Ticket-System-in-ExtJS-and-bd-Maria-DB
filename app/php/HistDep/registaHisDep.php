<?php
error_reporting(0);
include("config.php");

<<<<<<< HEAD

=======
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
$IdTicketEstado = $_COOKIE['cookieID'];
$IDEDep = $_POST['id_departamento'];
$IDFuncEstado =  $_COOKIE['cookieEmail'];

<<<<<<< HEAD
$insere = sqlsrv_query($mysqli, "call InserirHistoricoDepartamentos('$IdTicketEstado','$IDEDep','$IDFuncEstado');");

sqlsrv_close($mysqli);
=======
$insere = mysqli_query($mysqli, "call InserirHistoricoDepartamentos('$IdTicketEstado','$IDEDep','$IDFuncEstado');");

mysqli_close($mysqli);
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

?>

