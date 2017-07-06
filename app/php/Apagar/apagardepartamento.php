<?php
include("config.php");
$id = $_COOKIE['cookieIDdepartamento'];
//$kappa = mysqli_query($mysqli, "DELETE FROM respostas where id=$id");


$kappa = sqlsrv_query($mysqli, "DELETE FROM departamento WHERE id_departamento=$id");


?>