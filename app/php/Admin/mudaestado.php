<?php
error_reporting(0);
include("config.php");
//getting id from url

$id = $_COOKIE['cookieID'];
$IDFuncEstadox = $_COOKIE['cookieEmail'];

<<<<<<< HEAD
$result = sqlsrv_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

while($res = sqlsrv_fetch_array($result))
=======
$result = mysqli_query($mysqli, "SELECT state FROM emails WHERE id='$id'");

while($res = mysqli_fetch_array($result))
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
{
	$state = $res['state'];
}
echo $state;

<<<<<<< HEAD
//$sleep ($100)


        if($state == '3')
        {
            $muda = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',2,'$IDFuncEstadox')");
=======
        if($state == '3')
        {
            $muda = mysqli_query($mysqli, "call inserirhistoricoestados('$id',2,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

        }
        else
        {

        }


?>