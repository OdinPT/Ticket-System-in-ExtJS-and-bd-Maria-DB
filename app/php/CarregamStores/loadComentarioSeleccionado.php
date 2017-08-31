<?php
include "../config.php";
error_reporting(0);
$id = $_COOKIE['cookieIDComent'];
//$id=7;

$return_arr = array();

$query = "call RetornaComentarioSelec($id)";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['ID_Comentario'] = $row['ID_Comentario'];
$row_array['ID_Ticket'] = $row['ID_Ticket'];
$row_array['Data_comentario'] = $row['Data_comentario'];
$row_array['Comentario'] = $row['Comentario'];
$row_array['username'] = $row['username'];

//`ID_Comentario``ID_Ticket``Data_comentario``Comentario``ID_Utilizador`

    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>
