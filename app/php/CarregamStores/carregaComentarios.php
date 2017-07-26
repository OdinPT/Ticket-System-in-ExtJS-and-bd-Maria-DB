<?php
error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieID'];

$return_arr = array();

    $query = "call VerComentarioTicket($id)" ;

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['ID_Comentario'] = $row['ID_Comentario'];
$row_array['ID_Ticket'] = $row['ID_Ticket'];
$row_array['Data_comentario'] = $row['Data_comentario'];
$row_array['Comentario'] = $row['Comentario'];
$row_array['ID_Utilizador'] = $row['ID_Utilizador'];


    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
