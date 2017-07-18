<?php
include("config.php");
$id = $_COOKIE['cookieIDdepartamento'];

$kappa = mysqli_query($mysqli, "DELETE FROM departamento WHERE id_departamento=$id");


?>