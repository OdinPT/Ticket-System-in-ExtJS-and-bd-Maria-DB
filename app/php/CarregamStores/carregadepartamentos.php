<?php

//error_reporting(0);

include "../config.php";

$mysqli->set_charset("utf8"); // Convert DATA to utf8

$return_arr = array();

    $query = "call CarregaDepartamentos()";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
$row_array['id_departamento'] = $row['id_departamento'];
$row_array['nome_departamento'] = $row['nome_departamento'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>