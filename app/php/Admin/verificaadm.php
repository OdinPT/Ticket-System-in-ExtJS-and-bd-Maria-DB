<?php
include_once("config.php");
//error_reporting(0);
//getting id from url


// verifica se o tipo que iniciou sess?o e admin

$email = $_COOKIE['cookieEmail'];

//selecting data associated with this particular id

$result = mysqli_query($mysqli, "call VerificaAdmin('$email')");

while($res = mysqli_fetch_array($result))
{
	$tipo = $res['Tipo_Funcionario'];
}

if($tipo == 2)
{
    echo "Sucesso";
}
else
{
    header("HTTP/1.0 404 Not Found");
    header('HTTP', true, 500);
}
?>