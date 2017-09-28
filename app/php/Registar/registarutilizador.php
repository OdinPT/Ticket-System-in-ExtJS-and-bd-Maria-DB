<?php
include "../config.php";

$username = $_POST['user'];
$password = $_POST['pass'];
$id_departamento = $_POST['id_departamento'];
$tipo_funcionario = $_POST['tipo_funcionario'];
$login = $_POST['login'];

$insere = mysqli_query($mysqli, " call InserirFuncionario('$username','$password',$id_departamento,$tipo_funcionario,$login)");
mysqli_close($mysqli);

?>