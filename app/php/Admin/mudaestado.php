<?php
error_reporting(0);
include("config.php");
//getting id from url

$id = $_COOKIE['cookieID'];
$IDFuncEstadox = $_COOKIE['cookieEmail'];

$result = sqlsrv_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

while($res = sqlsrv_fetch_array($result))
{
	$state = $res['state'];
}
echo $state;

//$sleep ($100)


        if($state == '3')
        {
            $muda = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',2,'$IDFuncEstadox')");

        }
        else
        {

        }


?>