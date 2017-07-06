<?php
error_reporting(0);
include("config.php");
$id = $_COOKIE['cookieIDdepartamento'];
$return_arr = array();

    $query = "SELECT * FROM departamento ORDER BY id_departamento";
  //$query = "SELECT * FROM respostas WHERE IDticket=$id";

$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {

$row_array['id_departamento'] = $row['id_departamento'];
$row_array['nome_departamento'] = $row['nome_departamento'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>