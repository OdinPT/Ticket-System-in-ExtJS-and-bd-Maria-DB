<?php
include("config.php");
$id = $_COOKIE['cookieIDdepartamento'];
$nome_departamento2 = $_POST['nome_departamento2'];

$atualiza = mysqli_query($mysqli, "call AtualizaDepartamento('$nome_departamento2',$id)");
mysqli_close($mysqli);
?>