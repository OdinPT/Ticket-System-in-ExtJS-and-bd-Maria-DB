<?php
include("config.php");
$id = $_COOKIE['cookieIDhistorico'];

$kappa = mysqli_query($mysqli, "call LimpaComentarios($id)");

?>
