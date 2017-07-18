<?php
error_reporting(0);
include("config.php");
$id = $_COOKIE['cookieID'];
$return_arr = array();

$query = "Call ShowBody($id)";

$result = mysqli_query($mysqli, $query);

while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
  $row_array['id'] = $row['id'];
  $row_array['datea'] = $row['datea'];
  $row_array['state'] = $row['state'];
  $row_array['nome_departamento'] = $row['nome_departamento'];
  array_push($return_arr,$row_array);
}
echo json_encode($return_arr);
?>
