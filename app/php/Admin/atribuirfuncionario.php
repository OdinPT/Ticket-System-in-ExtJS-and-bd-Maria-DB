<?php
<<<<<<< HEAD
error_reporting(0);
=======
//error_reporting(0);
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
include("config.php");
$id = $_COOKIE['cookieID'];
$funcionario = $_POST['id_funcionario'];

<<<<<<< HEAD
$kappa = sqlsrv_query($mysqli, "UPDATE emails SET id_func_emails='$funcionario' WHERE id='$id'");
$teste = sqlsrv_query($mysqli, "UPDATE emails SET state='4' WHERE id='$id'");
sqlsrv_close($mysqli);

?>
=======
$kappa = mysqli_query($mysqli, "call teste('$funcionario','$id')");

mysqli_close($mysqli);

?>
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
