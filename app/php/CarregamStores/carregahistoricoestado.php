<?php
error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieID'];

$return_arr = array();

    $query = "call CarregaHistoricoEstado($id)" ;

<<<<<<< HEAD
$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {
=======
$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

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