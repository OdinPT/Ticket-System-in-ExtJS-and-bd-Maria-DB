<?php
error_reporting(0);
include("config.php");
$return_arr = array();

    $query = "call CarregaEstados()";


$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['ID_Estado'] = $row['ID_Estado'];
$row_array['Descricao_Estado'] = $row['Descricao_Estado'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
