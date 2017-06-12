<?php
include("config.php");

$id_departamento4 = $_POST['id_departamento4'];
$nome_departamento4 = $_POST['nome_departamento4'];

$insere = mysqli_query($mysqli, "INSERT INTO departamento(id_departamento, nome_departamento) VALUES ('$id_departamento4','$nome_departamento4')");
mysqli_close($mysqli);

?>

