<?php
include("config.php");
//getting id from url
$id = $_COOKIE['cookieID'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

	$state = $res['state'];


if($state == "Aberto" || $state == "Lido")
{
    $insere = mysqli_query($mysqli, "UPDATE emails SET state='Sendo Lido' WHERE id='$id'");
    echo "Sucesso";
}
else
{
    header("HTTP/1.0 404 Not Found");
    header('HTTP', true, 500);
}
?>