<?php
include("config.php");

$username = $_POST['user'];
$email = $_POST['email'];
$DataNasc = $_POST['DataNasc'];
$contribuinte = $_POST['contribuinte'];

$insere = mysqli_query($mysqli, " call InserirCliente('$username','$email','$DataNasc','$contribuinte')");
mysqli_close($mysqli);


?>