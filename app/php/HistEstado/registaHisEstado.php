<?php
include("config.php");
//add hisEstado
$horaAtribuicao = $_POST['HoraAtribuicaoEstado'];
$IdTicketEstado = $_POST['IdTicketEstado'];
$DataAlteracaoEstado = $_POST['DataAlteracaoEstado'];
$IDNovoEstado = $_POST['IDNovoEstado'];
$IDFuncEstado = $_POST['IDFuncEstado'];

$insere = mysqli_query($mysqli, "call InserirHistoricoEstados ('$horaAtribuicao','$IdTicketEstado',$DataAlteracaoEstado,$IDNovoEstado,$IDFuncEstado)");
mysqli_close($mysqli);

?>

