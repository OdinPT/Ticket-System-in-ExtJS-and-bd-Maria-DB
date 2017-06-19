<?php
//error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieID'];

$return_arr = array();

    $query = "select `idHistoricoDep`,`IdTicketDep`,`HoraAtribuicaoDep`,`HoraAtribuicaoDep`,`IDDepartamentoDep`,`IDFuncEstado` from historicodepartamentos where IdTicketDep= $id ";
//`idHistoricoDep`,`IdTicketDep`,`HoraAtribuicaoDep`,`HoraAtribuicaoDep`,`IDDepartamentoDep`,`IDFuncEstado` from historicodepartamentos where IdTicketDep=1

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['idHistoricoDep'] = $row['idHistoricoDep'];
$row_array['IdTicketDep'] = $row['IdTicketDep'];
$row_array['HoraAtribuicaoDep'] = $row['HoraAtribuicaoDep'];
$row_array['IDDepartamentoDep'] = $row['IDDepartamentoDep'];
$row_array['IDFuncEstado'] = $row['IDFuncEstado'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
