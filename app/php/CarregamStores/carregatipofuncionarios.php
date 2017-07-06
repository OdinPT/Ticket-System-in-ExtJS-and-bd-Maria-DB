<?php
error_reporting(0);
include("config.php");
$return_arr = array();

<<<<<<< HEAD
    $query = "SELECT * FROM tipoutilizador ORDER BY ID_TipoUtilizador";

$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {
=======
    $query = "call CarregaTiposUtilizador()";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
$row_array['ID_TipoUtilizador'] = $row['ID_TipoUtilizador'];
$row_array['Descricao_TipoUtilizador'] = $row['Descricao_TipoUtilizador'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>