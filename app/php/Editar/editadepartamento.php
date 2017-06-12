<?php
include("config.php");
$id = $_COOKIE['cookieIDdepartamento'];

$id_departamento2 = $_POST['id_departamento2'];
$nome_departamento2 = $_POST['nome_departamento2'];

if($id_departamento2 == "")
{
    $id_departamento2 = $id;
}
$atualiza = mysqli_query($mysqli, "UPDATE departamento SET id_departamento='$id_departamento2', nome_departamento='$nome_departamento2' WHERE id_departamento=$id");
mysqli_close($mysqli);
?>