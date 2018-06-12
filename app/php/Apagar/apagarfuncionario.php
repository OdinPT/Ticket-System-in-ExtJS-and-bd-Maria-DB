<?php
include "../config.php";

$id = $_COOKIE['cookieIDfuncionario'];

$kappa = mysqli_query($mysqli, " call ApagarFuncionario($id)");

if($kappa == null)
{
header("HTTP/1.0 404 Not Found");
//header('HTTP', true, 500);
}



?>