<?php
error_reporting(0);
include("config.php");
$return_arr = array();

    $query = "SELECT `id_departamento`,`nome_departamento` FROM departamento";


<<<<<<< HEAD
$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {
=======
$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

$row_array['id_departamento'] = $row['id_departamento'];
$row_array['nome_departamento'] = $row['nome_departamento'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
