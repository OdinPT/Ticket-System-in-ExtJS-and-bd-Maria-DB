<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

$username = $_POST['username'];
$password = $_POST['pass'];
$id_departamento = $_POST['id_departamento'];
$tipo_funcionario = $_POST['tipo_funcionario'];

$kappa = mysqli_query($mysqli, "UPDATE funcionario SET username='$username', pass='$password', id_departamento_funcionarios='$id_departamento', Tipo_Funcionario='$tipo_funcionario' WHERE id_funcionario=$id");
mysqli_close($mysqli);
?>