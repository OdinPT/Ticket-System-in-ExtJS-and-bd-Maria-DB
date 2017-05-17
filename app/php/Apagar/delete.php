<?php
//including the database connection file
include("config.php");
$cookieEmail = $_COOKIE['cookieEmail'];
//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM admin WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
{
  $username = $res['username'];
	$password = $res['pass'];
}
//getting id of the data from url
$id = $_COOKIE['cookieID'];

//deleting the row from table
//$state = mysqli_query($mysqli, "UPDATE emails SET state='Fechado' WHERE id=$id");
//$result = mysqli_query($mysqli, "INSERT INTO historico SELECT * FROM emails WHERE id=$id");
//$kappa = mysqli_query($mysqli, "DELETE FROM emails WHERE id=$id");


$state = mysqli_query($mysqli, "Call MudaGrupo($id)");

$kappa = mysqli_query($mysqli, "Call ApagarEmails($ide)");

?>