<?php
error_reporting(0);
include("config.php");
$id = $_COOKIE['cookieID'];
$funcionario = $_POST['id_funcionario'];

$kappa = mysqli_query($mysqli, "UPDATE emails SET id_func_emails='$funcionario' WHERE id='$id'");
$teste = mysqli_query($mysqli, "UPDATE emails SET state='4' WHERE id='$id'");
mysqli_close($mysqli);

?>