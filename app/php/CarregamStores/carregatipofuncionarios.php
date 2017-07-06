<?php
error_reporting(0);
include("config.php");
$return_arr = array();

    $query = "SELECT * FROM tipoutilizador ORDER BY ID_TipoUtilizador";

$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {
$row_array['ID_TipoUtilizador'] = $row['ID_TipoUtilizador'];
$row_array['Descricao_TipoUtilizador'] = $row['Descricao_TipoUtilizador'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>