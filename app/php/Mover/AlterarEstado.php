<?php
error_reporting(0);
//Chama as definições patrão da BD utilizada.
include("config.php");
$id = $_COOKIE['cookieIDhistorico'];

$state = mysqli_query($mysqli, "call MudaEstado($id)");

?>
