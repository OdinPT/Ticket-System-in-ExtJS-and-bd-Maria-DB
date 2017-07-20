<?php
//error_reporting(0);

include("config.php");
$id = $_COOKIE['cookieID'];
$funcionario = $_POST['id_funcionario'];
$email = $_COOKIE['cookieEmail'];

//$kappa = mysqli_query($mysqli, "call teste('$funcionario','$id','4')");

$kappa = mysqli_query($mysqli, "call InserirHistoricoAtribuicao('$email','$funcionario','$id')");

//InserirHistoricoAtribuicao
mysqli_close($mysqli);

?>