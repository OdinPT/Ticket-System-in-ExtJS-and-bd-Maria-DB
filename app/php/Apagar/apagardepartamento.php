<?php
include("config.php");
$id = $_COOKIE['cookieIDdepartamento'];
//$kappa = mysqli_query($mysqli, "DELETE FROM respostas where id=$id");


<<<<<<< HEAD
$kappa = sqlsrv_query($mysqli, "DELETE FROM departamento WHERE id_departamento=$id");
=======
$kappa = mysqli_query($mysqli, "call ApagarDepartamento('$id')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613


?>