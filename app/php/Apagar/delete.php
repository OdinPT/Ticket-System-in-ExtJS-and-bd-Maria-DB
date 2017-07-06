<?php
//including the database connection file
include("config.php");
$cookieEmail = $_COOKIE['cookieEmail'];

//selecting data associated with this particular id

$result = sqlsrv_query($mysqli, "SELECT * FROM funcionario WHERE username='$cookieEmail'") or die(sqlsrv_error($mysqli));

while($res = sqlsrv_fetch_array($result))
{
  $username = $res['username'];
	$password = $res['pass'];
}
//getting id of the data from url

$id = $_COOKIE['cookieID'];

$state = sqlsrv_query($mysqli, "call MudaGrupo ($id)");

$kappa = sqlsrv_query($mysqli, "Call ApagarEmails($ide)");

?>