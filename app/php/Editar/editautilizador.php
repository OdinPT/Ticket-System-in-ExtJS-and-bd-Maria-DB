<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

$username = $_POST['user'];
$password = $_POST['pass'];
$id_departamento = $_POST['id_departamento'];
$tipo_funcionario = $_POST['tipo_funcionario'];

<<<<<<< HEAD
$kappa = sqlsrv_query($mysqli, "UPDATE funcionario SET username='$username', pass='$password', id_departamento_funcionarios='$id_departamento', Tipo_Funcionario='$tipo_funcionario' WHERE id_funcionario=$id");
sqlsrv_close($mysqli);
=======
$kappa = mysqli_query($mysqli, " call AtualizaFuncionario('$username','$password','$id_departamento','$tipo_funcionario',$id)");
mysqli_close($mysqli);
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
?>