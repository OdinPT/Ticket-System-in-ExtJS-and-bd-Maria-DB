<?php
//Chama as definições patrão da BD utilizada.
include("config.php");
$id = $_COOKIE['cookieIDhistorico'];
//Através do ID coloca esse ticket novamente com o estado em aberto.
$aberto = mysqli_query($mysqli, "UPDATE historico SET state='Aberto' WHERE id=$id");
//
$insert = mysqli_query($mysqli, "INSERT INTO recovered SELECT * FROM historico WHERE id=$id");
$kappa = mysqli_query($mysqli, "DELETE FROM historico WHERE id=$id");
?>
