<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

$kappa = sqlsrv_query($mysqli, "DELETE FROM funcionario WHERE id_funcionario=$id");


?>