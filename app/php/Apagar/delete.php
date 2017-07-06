<?php
//including the database connection file
include("config.php");
$cookieEmail = $_COOKIE['cookieEmail'];

//selecting data associated with this particular id
<<<<<<< HEAD
=======

$result = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

$result = sqlsrv_query($mysqli, "SELECT * FROM funcionario WHERE username='$cookieEmail'") or die(sqlsrv_error($mysqli));

while($res = sqlsrv_fetch_array($result))
{
  $username = $res['username'];
	$password = $res['pass'];
}
//getting id of the data from url

$id = $_COOKIE['cookieID'];

<<<<<<< HEAD
$state = sqlsrv_query($mysqli, "call MudaGrupo ($id)");
=======
$state = mysqli_query($mysqli, "call MudaGrupo ($id)");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

$kappa = sqlsrv_query($mysqli, "Call ApagarEmails($ide)");

?>