<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

<<<<<<< HEAD
$kappa = sqlsrv_query($mysqli, "DELETE FROM funcionario WHERE id_funcionario=$id");
=======
$kappa = mysqli_query($mysqli, "DELETE FROM funcionario WHERE id_funcionario=$id");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613


?>