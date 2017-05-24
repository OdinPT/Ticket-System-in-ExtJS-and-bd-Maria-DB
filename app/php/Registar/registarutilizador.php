<?php include("config.php");

$username = $_POST['user'];
$password = $_POST['pass'];
$id_departamento = $_POST['id_departamento'];
$tipo_funcionario = $_POST['tipo_funcionario'];

$insere = mysqli_query($mysqli, "Call InserirFuncionario('$username','$password',$id_departamento,$tipo_funcionario)");
mysqli_close($mysqli);

?>