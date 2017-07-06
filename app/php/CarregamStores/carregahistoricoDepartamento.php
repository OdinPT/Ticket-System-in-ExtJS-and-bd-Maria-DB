<?php
error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieIDhistorico'];


$return_arr = array();

    $query = "call VerHistoricoDepartamento($id)" ;

<<<<<<< HEAD
$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {
=======
$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

$row_array['idHistoricoDep'] = $row['idHistoricoDep'];
$row_array['IdTicketDep'] = $row['IdTicketDep'];
$row_array['HoraAtribuicaoDep'] = $row['HoraAtribuicaoDep'];
$row_array['IDDepartamentoDep'] = $row['IDDepartamentoDep'];
$row_array['IDFuncEstado'] = $row['IDFuncEstado'];


    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>