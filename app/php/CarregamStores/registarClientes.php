<?php
include("config.php");

$username = $_POST['Nome_Cliente'];
$email = $_POST['Email_Cliente'];
$DataNasc = $_POST['DataNasc_Cliente'];
$contribuinte = $_POST['Contribuinte_Cliente'];

//$insere = mysqli_query($mysqli, "insert into cliente (Nome_Cliente) values ('$username')");

$insere = mysqli_query($mysqli, " call InserirCliente('$username','$email','$DataNasc','$contribuinte')");

mysqli_close($mysqli);


?>