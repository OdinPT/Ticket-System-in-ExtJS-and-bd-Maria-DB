<?php
//Chama as definições patrão da BD utilizada.
include("config.php");
$id = $_COOKIE['cookieIDrecuperado'];
//Através do ID coloca esse ticket novamente com o estado em aberto.
/*$fechado = mysqli_query($mysqli, "UPDATE recuperados SET state='Fechado' WHERE id=$id");
//
$insert = mysqli_query($mysqli, "INSERT INTO historico SELECT * FROM recuperados WHERE id=$id");*/
$kappa = mysqli_query($mysqli, "Call MudaGrupo($id)");
?>
