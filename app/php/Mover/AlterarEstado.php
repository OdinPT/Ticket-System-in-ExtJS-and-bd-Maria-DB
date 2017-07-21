<?php
error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieIDhistorico'];
$email = $_COOKIE['cookieEmail'];

$state2 = mysqli_query($mysqli, "call inserirhistoricoestados('$id','6','$email')");
$state = mysqli_query($mysqli, "call MudaEstado($id)");
?>
