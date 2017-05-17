<?php
include("config.php");
$id = $_COOKIE['cookieIDanswer'];
$return_arr = array();

$query = "Call ShowRespostasTicket($id)";
//$query = "SELECT * FROM respostas WHERE id=$id";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['id_resp'] = $row['id_resp'];
$row_array['body_resp'] = $row['body_resp'];
$row_array['datea_resp'] = $row['datea_resp'];
$row_array['id_email'] = $row['id_email'];


    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>
