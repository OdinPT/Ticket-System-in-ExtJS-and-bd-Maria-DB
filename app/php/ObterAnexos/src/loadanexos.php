<?php
include("config.php");
$id = $_COOKIE['cookieID'];

$return_arr = array();

$query = "SELECT * FROM upload WHERE id_ticket=$id";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

  $row_array['id'] = $row['id'];
  $row_array['nome'] = $row['nome'];
  $row_array['id_ticket'] = $row['id_ticket'];


    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>