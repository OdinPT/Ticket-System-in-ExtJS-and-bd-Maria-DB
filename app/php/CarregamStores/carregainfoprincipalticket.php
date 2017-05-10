<?php
include("config.php");
$id = $_COOKIE['cookieID'];
$return_arr = array();
$query = "Call ShowBody($id);";

$result = mysqli_query($mysqli, $query);
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
  $row_array['subject'] = $row['subject'];
  $row_array['body'] = $row['body'];
  array_push($return_arr,$row_array);
}
echo json_encode($return_arr);
?>
