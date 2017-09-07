<?php
include "../config.php";
error_reporting(0);

$idComent = $_COOKIE['cookieIDComent'];
$Comentario = $_POST['Comentario'];

$idUtilizador = $_COOKIE['cookieEmail'];
$username = $_POST['username'];

if($username == $idUtilizador)
{
$insere = mysqli_query($mysqli, "call AtualizaComentario('$Comentario','$idUtilizador',$idComent)");
}
else
{
header("HTTP/1.0 404 Not Found");
//header('HTTP', true, 500);

}


mysqli_close($mysqli);

?>