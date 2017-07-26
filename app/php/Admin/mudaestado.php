<?php
error_reporting(0);
include("config.php");
//getting id from url

$id = $_COOKIE['cookieID'];
$IDFuncEstadox = $_COOKIE['cookieEmail'];

$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

while($res = mysqli_fetch_array($result))
{
	$state = $res['state'];
}
echo $state;

        if($state == '3')
        {
            $muda = mysqli_query($mysqli, "call inserirhistoricoestados('$id',2,'$IDFuncEstadox')");

        }
        else
        {

        }
?>