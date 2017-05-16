<?php
//Chama as definições patrão da BD utilizada.
include("config.php");
$id = $_COOKIE['cookieIDhistorico'];


$kappa = mysqli_query($mysqli, "Call MudaGrupo($id)");
?>
