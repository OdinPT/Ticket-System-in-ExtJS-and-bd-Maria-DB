<?php
include "../config.php";
$id = $_COOKIE['cookieIDComent'];

$kappa = mysqli_query($mysqli, "call ApagarComentario($id)");
?>
