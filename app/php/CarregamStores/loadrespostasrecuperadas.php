<?php
include("config.php");
$id = $_COOKIE['cookieIDrecovered'];
$return_arr = array();
  $query = "Call ShowRespostasTicket($id)";
$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
  $row_array['id_resp'] = $row['id_resp'];
  $row_array['body_resp'] = $row['body_resp'];
  $row_array['datea_resp'] = $row['datea_resp'];
  $row_array['IdEmail'] = $row['IdEmail'];
  /*
  $row_array['ID_resp'] = $row['ID_resp'];
  $row_array['body_resp'] = $row['body_resp'];
  $row_array['datea_resp'] = $row['datea_resp'];
  $row_array['IdEmail'] = $row['IdEmail'];

  */
    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
