<?php
include("config.php");
error_reporting(0);
$id = $_COOKIE['cookieID'];

$return_arr = array();

$query = "SELECT * FROM upload WHERE id_ticket=$id";

$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {

  $row_array['id'] = $row['id'];
  $row_array['nome'] = $row['nome'];
  $row_array['id_ticket'] = $row['id_ticket'];


    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>