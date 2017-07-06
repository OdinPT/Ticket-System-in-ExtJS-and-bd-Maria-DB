<?php include("config.php");

$username = $_POST['user'];
$password = $_POST['pass'];
$id_departamento = $_POST['id_departamento'];
$tipo_funcionario = $_POST['tipo_funcionario'];

$insere = sqlsrv_query($mysqli, "INSERT INTO funcionario(username,pass,id_departamento_funcionarios,Tipo_Funcionario) VALUES ('$username','$password',$id_departamento,$tipo_funcionario)");
sqlsrv_close($mysqli);

?>