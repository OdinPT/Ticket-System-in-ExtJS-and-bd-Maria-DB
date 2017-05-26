<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

$username = $_POST['Nome_Cliente'];
$email = $_POST['Email_Cliente'];
$DataNasc = $_POST['DataNasc_Cliente'];
$contribuinte = $_POST['Contribuinte_Cliente'];

$kappa = mysqli_query($mysqli, "UPDATE cliente SET Nome_Cliente='$username', Email_Cliente='$email', DataNasc_Cliente='$DataNasc', Contribuinte_Cliente='$contribuinte' WHERE Id_Cliente=$id");


//$insere = mysqli_query($mysqli, "insert into cliente (Nome_Cliente) values ('$username')");

mysqli_close($mysqli);
?>

