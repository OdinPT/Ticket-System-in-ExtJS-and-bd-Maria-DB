<?php
include("config.php");
$id = $_COOKIE['cookieIDhistorico'],
$return_arr = array();


$query = "Call TicketSelecHistorico($id)";


$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

  $row_array['id'] = $row['id'];
  $row_array['fromaddress'] = $row['fromaddress'];
  $row_array['subject'] = $row['subject'];
  $row_array['datea'] = $row['datea'];
  $row_array['body'] = $row['body'];
  $row_array['state'] = $row['state'];
  $row_array['department'] = $row['department'];

    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>
