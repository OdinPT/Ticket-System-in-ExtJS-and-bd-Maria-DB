<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

$username = $_POST['user'];
$password = $_POST['pass'];
$id_departamento = $_POST['id_departamento'];
$tipo_funcionario = $_POST['tipo_funcionario'];

$kappa = mysqli_query($mysqli, " call AtualizaFuncionario('$username','$password','$id_departamento','$tipo_funcionario',$id)");
mysqli_close($mysqli);
?>