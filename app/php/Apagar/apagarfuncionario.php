<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

$kappa = mysqli_query($mysqli, "DELETE FROM funcionario WHERE id_funcionario=$id");


?>