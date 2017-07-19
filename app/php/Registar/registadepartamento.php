<?php
include("config.php");

$nome_departamento4 = $_POST['nome_departamento4'];

$insere = mysqli_query($mysqli, "call InserirDepartamento('$nome_departamento4')");
mysqli_close($mysqli);

?>

