<?php
include("config.php");
$id = $_COOKIE['cookieIDdepartamento'];
//$kappa = mysqli_query($mysqli, "DELETE FROM respostas where id=$id");


$kappa = mysqli_query($mysqli, "call ApagarDepartamento('$id')");


?>