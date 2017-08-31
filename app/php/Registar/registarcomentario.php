<?php
//error_reporting(0);
include "../config.php";

$idTicket = $_COOKIE['cookieID'];
$comentario = $_POST['comentario'];
$IDFuncEstadox = $_COOKIE['cookieEmail'];

$insere = mysqli_query($mysqli, " call InserirComentario('$idTicket','$comentario','$IDFuncEstadox')");
mysqli_close($mysqli);

?>