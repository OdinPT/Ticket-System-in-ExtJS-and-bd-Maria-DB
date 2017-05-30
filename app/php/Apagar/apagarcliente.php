<?php
include("config.php");
$id = $_COOKIE['cookieIDCliente'];

//$kappa = mysqli_query($mysqli, "DELETE FROM respostas where id=$id");


$kappa = mysqli_query($mysqli, "DELETE FROM cliente WHERE `Id_Cliente`=$id");


?>