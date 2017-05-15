<?php
include("config.php");
$id = $_COOKIE['cookieIDrecovered'];
$return_arr = array();
  $query = "SELECT * FROM respostas WHERE IDticket=$id";
$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
  $row_array['ID'] = $row['ID'];
  $row_array['subject'] = $row['subject'];
  $row_array['answer'] = $row['answer'];
  $row_array['IDticket'] = $row['IDticket'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
