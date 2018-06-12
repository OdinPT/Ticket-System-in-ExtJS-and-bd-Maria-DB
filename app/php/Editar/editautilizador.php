<?php
include "../config.php";
$id = $_COOKIE['cookieIDfuncionario'];

$username = $_POST['user'];
$password = $_POST['pass'];
$id_departamento = $_POST['id_departamento'];
$tipo_funcionario = $_POST['tipo_funcionario'];
$login = $_POST['login'];


$kappa = mysqli_query($mysqli, " call AtualizaFuncionario('$username','$password','$id_departamento','$tipo_funcionario',$id,$login)");

mysqli_close($mysqli);
?>