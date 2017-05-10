<?php
//including the database connection file
include("config.php");

//getting id of the data from url
$id = $_COOKIE['cookieIDrecovered'];

//deleting the row from table

$query = mysqli_query($mysqli, "SELECT * FROM recovered WHERE id=$id");
while($res = mysqli_fetch_array($query))
{
	$body = $res['body'];
}
echo $body;
//redirecting to the display page (index.php in our case)
?>

<!-- <script>
    window.history.back();
</script> -->
