<?php
//error_reporting(0);

include "../config.php";

$id = $_COOKIE['cookieID'];

$mysqli->set_charset("utf8"); // Convert DATA to utf8

$return_arr = array();

$query = "Call TicketSelec('$id')";

$result = mysqli_query($mysqli, $query);

while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

  $row_array['id'] = $row['id'];
  $row_array['fromaddress'] = $row['fromaddress'];
  $row_array['subject'] = $row['subject'];
  $row_array['datea'] = $row['datea'];
  $row_array['body'] = $row['body'];
  $row_array['state'] = $row['Descricao_Estado'];
  $row_array['nome_departamento'] = $row['nome_departamento'];

    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>