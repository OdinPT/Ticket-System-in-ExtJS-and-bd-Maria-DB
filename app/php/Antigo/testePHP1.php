<?php
include_once("config.php");
//getting id from url
$id = $_COOKIE['cookieEmail'];
echo $id;
//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM admin WHERE username='$id'") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
{
	$fromaddress = $res['password'];
}
echo $fromaddress;
?>
