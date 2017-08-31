<?php
include "../config.php";
//error_reporting(0);

// verifica se o tipo quem iniciou sessao e admin

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