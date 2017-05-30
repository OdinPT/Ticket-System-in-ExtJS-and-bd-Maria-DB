<?php
include("config.php");
$id = $_COOKIE['cookieIDCliente'];

$nome = $_POST['Nome_Cliente'];
$email = $_POST['Email_Cliente'];
$datanasc = $_POST['Email_Cliente'];
$contribuinte = $_POST['DataNasc_Cliente'];

$kappa = mysqli_query($mysqli, "UPDATE cliente SET Nome_Cliente='$nome', Email_Cliente='$email', DataNasc_Cliente='$datanasc', Contribuinte_Cliente='$contribuinte' WHERE Id_Cliente=$id");

mysqli_close($mysqli);
?>


