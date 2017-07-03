<?php
error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieIDhistorico'];

$return_arr = array();

    $query = "call CarregaHistoricoEstado($id)" ;


$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['idHistoricoEstados'] = $row['idHistoricoEstados'];
$row_array['HoraAtribuicaoEstado'] = $row['HoraAtribuicaoEstado'];
$row_array['IdTicketEstado'] = $row['IdTicketEstado'];
$row_array['Descricao_Estado'] = $row['Descricao_Estado'];
$row_array['username'] = $row['username'];
$row_array['DesTipoRes'] = $row['DesTipoRes'];


    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>