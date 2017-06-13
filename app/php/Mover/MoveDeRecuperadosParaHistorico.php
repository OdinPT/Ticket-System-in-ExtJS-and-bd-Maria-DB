<?php
//Chama as definições patrão da BD utilizada.
include("config.php");
$id = $_COOKIE['cookieIDrecovered'];
$idticket = $_COOKIE['cookieID'];

//Através do ID coloca esse ticket novamente com o estado em aberto.
//$state = mysqli_query($mysqli, "UPDATE recovered SET state='Fechado' WHERE id=$id");
//$result = mysqli_query($mysqli, "INSERT INTO historico SELECT * FROM recovered WHERE id=$id");

$kappa = mysqli_query($mysqli, "Call MudaGrupo($idticket)");
?>
