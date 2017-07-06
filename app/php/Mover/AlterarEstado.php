<?php
error_reporting(0);
//Chama as definições patrão da BD utilizada.
include("config.php");
$id = $_COOKIE['cookieIDhistorico'];

<<<<<<< HEAD
$state = sqlsrv_query($mysqli, "UPDATE emails SET state='6' WHERE id=$id");
$mudagrupo = sqlsrv_query($mysqli, "UPDATE emails SET id_grupo_emails=1 WHERE id=$id");
=======
$state = mysqli_query($mysqli, "UPDATE emails SET state='6' WHERE id=$id");
$mudagrupo = mysqli_query($mysqli, "UPDATE emails SET id_grupo_emails=1 WHERE id=$id");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
?>
