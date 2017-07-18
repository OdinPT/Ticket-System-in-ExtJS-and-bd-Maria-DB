<?php
include("config.php");
$id = $_COOKIE['cookieIDanswer'];

kappa = mysqli_query($mysqli, "Call ApagaResposta($id)");
?>
