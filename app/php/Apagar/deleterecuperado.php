<?php
//including the database connection file

include("config.php");
$cookieEmail = $_COOKIE['cookieEmail'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM admin WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
{
  $username = $res['username'];
	$password = $res['password'];
}
//getting id of the data from url
$id = $_COOKIE['cookieIDrecovered'];

//deleting the row from table

$state = mysqli_query($mysqli, "UPDATE recovered SET state='Fechado' WHERE id=$id");

$result = mysqli_query($mysqli, "INSERT INTO historico SELECT * FROM recuperados WHERE id=$id");

$kappa = mysqli_query($mysqli, "DELETE FROM recovered WHERE id=$id");
//redirecting to the display page (index.php in our case)
?>
<!--
 <script>
    window.history.back();
</script> -->
