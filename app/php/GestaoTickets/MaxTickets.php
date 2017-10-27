<?php
error_reporting(0);
include "../config.php";

$return_arr = array();

    $query = " call CarregaMaxTicketsDep" ;

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['MaxTicketsDep'] = $row['MaxTicketsDep'];
$row_array['E_Novo'] = $row['E_Novo'];
$row_array['E_Lido'] = $row['E_Lido'];
$row_array['E_SLido'] = $row['E_SLido'];
$row_array['E_Atribuido'] = $row['E_Atribuido'];
$row_array['E_Fechado'] = $row['E_Fechado'];
$row_array['E_Reaberto'] = $row['E_Reaberto'];
$row_array['id_departamento'] = $row['id_departamento'];
$row_array['nome_departamento'] = $row['nome_departamento'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
