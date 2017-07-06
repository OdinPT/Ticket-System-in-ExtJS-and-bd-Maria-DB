<?php
error_reporting(0);
include("config.php");
$id = $_COOKIE['cookieID'];
$funcionario = $_POST['id_funcionario'];

$kappa = sqlsrv_query($mysqli, "UPDATE emails SET id_func_emails='$funcionario' WHERE id='$id'");
$teste = sqlsrv_query($mysqli, "UPDATE emails SET state='4' WHERE id='$id'");
sqlsrv_close($mysqli);

?>
