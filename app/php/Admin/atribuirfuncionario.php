<?php
error_reporting(0);
include "../config.php";

$id = $_COOKIE['cookieID'];
$funcionario = $_POST['id_funcionario'];
$email = $_COOKIE['cookieEmail'];


$kappa = mysqli_query($mysqli, "call InserirHistoricoAtribuicao('$email','$funcionario','$id')");
$state = mysqli_query($mysqli, "call inserirhistoricoestados('$id','4','$funcionario')");

mysqli_close($mysqli);

?>