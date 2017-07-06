<?php
error_reporting(0);
include("config.php");

$return_arr = array();

    $query = "SELECT * FROM `tipo_resolucao`";


$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {
$row_array['IdTipoRes'] = $row['IdTipoRes'];
$row_array['DesTipoRes'] = $row['DesTipoRes'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>