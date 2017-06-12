<?php
include("config.php");
//getting id from url
$id = $_COOKIE['cookieID'];


//Caso o estado esteja a er visualizado mostra mensagem a dizer que o ticket está a ser usado


$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

while($res = mysqli_fetch_array($result))
{
	$state = $res['state'];
}

if($state != 3 )
{
    $insere = mysqli_query($mysqli, "UPDATE emails SET state=3 WHERE id='$id'");
    echo "Sucesso";
}
else
{
    header("HTTP/1.0 404 Not Found");
    header('HTTP', true, 500);
}

?>