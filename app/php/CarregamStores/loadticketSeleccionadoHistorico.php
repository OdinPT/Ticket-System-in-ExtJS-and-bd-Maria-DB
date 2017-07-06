<?php
error_reporting(0);
include("config.php");
$id = $_COOKIE['cookieIDhistorico'];
$return_arr = array();

$query = "Call TicketSelecHistorico($id)";

<<<<<<< HEAD
$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {
=======
$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

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
