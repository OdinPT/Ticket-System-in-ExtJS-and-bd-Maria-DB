<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

$kappa = mysqli_query($mysqli, "call ApagarFuncionario($id)");


?>