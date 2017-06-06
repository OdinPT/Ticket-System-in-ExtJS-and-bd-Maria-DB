<?php
include_once("config.php");
//getting id from url
$email = $_COOKIE['cookieEmail'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$email'");

while($res = mysqli_fetch_array($result))
{
	$tipo = $res['Tipo_Funcionario'];
}

if($tipo == 3)
{
    echo "Sucesso";
}
else
{
    header("HTTP/1.0 404 Not Found");
    header('HTTP', true, 500);
}
?>