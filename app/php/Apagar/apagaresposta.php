<?php
include("config.php");
$id = $_COOKIE['cookieIDanswer'];

//$kappa = mysqli_query($mysqli, "DELETE FROM respostas where id=$id");
kappa = mysqli_query($mysqli, "Call ApagaResposta($id)");
?>
