<?php

include("config.php");
//getting id from url

$id = $_COOKIE['cookieID'];

$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

while($res = mysqli_fetch_array($result))
{
	$state = $res['state'];
}
echo $state;
if($state == '3')
{
 $muda = mysqli_query($mysqli, "UPDATE emails SET state='2' WHERE id='$id'");
}
else
{

}


?>