<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

//$kappa = mysqli_query($mysqli, "DELETE FROM respostas where id=$id");
kappa = mysqli_query($mysqli, "DELETE FROM funcionarios WHERE id=$id");
?>