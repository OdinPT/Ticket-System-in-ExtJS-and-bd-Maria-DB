<?php
error_reporting(0);
include("config.php");
$id = $_COOKIE['cookieID'];
$funcionario = $_POST['id_funcionario'];

$kappa = mysqli_query($mysqli, "call teste('$funcionario','$id','4')");

mysqli_close($mysqli);

?>