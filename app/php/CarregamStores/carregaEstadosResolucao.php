<?php
error_reporting(0);
include "../config.php";

$return_arr = array();

    $query = "call CarregaTiposResolucao()";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['IdTipoRes'] = $row['IdTipoRes'];
$row_array['DesTipoRes'] = $row['DesTipoRes'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>