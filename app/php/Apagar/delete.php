<?php
include "../config.php";

$cookieEmail = $_COOKIE['cookieEmail'];
$id = $_COOKIE['cookieID'];
//selecting data associated with this particular id
$email = $_COOKIE['cookieEmail'];


$result = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));
while($res = mysqli_fetch_array($result))
{
  $username = $res['username'];
	$password = $res['pass'];
}
//getting id of the data from url

$state = mysqli_query($mysqli, "call MudaGrupo ($id)");
$kappa = mysqli_query($mysqli, "Call ApagarEmails($ide)");
$state2 = mysqli_query($mysqli, "call inserirhistoricoestados('$id','5','$email')");
?>