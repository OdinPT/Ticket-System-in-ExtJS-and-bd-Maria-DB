<?php
error_reporting(0);
include("config.php");
$return_arr = array();

<<<<<<< HEAD
    $query = "SELECT `ID_Estado`,`Descricao_Estado` FROM estado";


$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {
=======
    $query = "call CarregaEstados()";


$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

$row_array['ID_Estado'] = $row['ID_Estado'];
$row_array['Descricao_Estado'] = $row['Descricao_Estado'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
