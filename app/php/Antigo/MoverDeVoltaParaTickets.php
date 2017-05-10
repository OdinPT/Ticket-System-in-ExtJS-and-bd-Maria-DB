<?php
//including the database connection file
include("config.php");

//getting id of the data from url
$id = $_COOKIE['cookieIDhistorico'];

//deleting the row from table
$result = mysqli_query($mysqli, "INSERT INTO emails SELECT * FROM historico WHERE id=$id");

$kappa = mysqli_query($mysqli, "DELETE FROM historico WHERE id=$id");
?>
<script>
   window.history.back();
</script>
