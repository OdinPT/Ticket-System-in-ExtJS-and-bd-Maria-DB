<?php
include("config.php");

$horaAtribuicao = $_POST['HoraAtribuicaoEstado'];
$IdTicketEstado = $_POST['IdTicketEstado'];
$DataAlteracaoEstado = $_POST['DataAlteracaoEstado'];
$IDNovoEstado = $_POST['IDNovoEstado'];
$IDFuncEstado = $_POST['IDFuncEstado'];

$insere = mysqli_query($mysqli, "InserirHistoricoEstados(username,pass,id_departamento_funcionarios,Tipo_Funcionario) VALUES ('$horaAtribuicao','$IdTicketEstado',$DataAlteracaoEstado,$IDNovoEstado,$IDFuncEstado)");
mysqli_close($mysqli);

?>

/*
HoraAtribuicaoEstado,
       	IdTicketEstado,
       	IDEstadoEstado,
        DataAlteracaoEstado,
        IDNovoEstado,
        IDFuncEstado)


*/