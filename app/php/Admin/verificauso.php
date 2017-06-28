<?php
include("config.php");

//Caso o estado esteja a ser visualizado mostra mensagem a dizer que o ticket está a ser usado

$id = $_COOKIE['cookieID'];
$IDFuncEstadox = $_COOKIE['cookieEmail'];

$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

while($res = mysqli_fetch_array($result))
{
	$state = $res['state'];
}

$veadmin = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$IDFuncEstadox'");
while($resi = mysqli_fetch_array($veadmin))
{
	$tipo = $resi['Tipo_Funcionario'];
}

if($tipo == 3)
{
    $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
    echo "Sucesso";
    exit(0);
}
if($state != 3 )
{
    //$insere = mysqli_query($mysqli, "UPDATE emails SET state=3 WHERE id='$id'");

    $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
    echo "Sucesso";
}
else
{

    header("HTTP/1.0 404 Not Found");
    header('HTTP', true, 500);
}

?>