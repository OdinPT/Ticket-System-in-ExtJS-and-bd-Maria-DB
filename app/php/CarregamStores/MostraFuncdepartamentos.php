<?php
//error_reporting(0);

include "../config.php";

$id = $_COOKIE['cookieIDdepartamento'];

$return_arr = array();

    $query = "call MostraClientesDep($id)" ;

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['username'] = $row['username'];
$row_array['pass'] = $row['pass'];
$row_array['Descricao_TipoUtilizador'] = $row['Descricao_TipoUtilizador'];
$row_array['nome_departamento'] = $row['nome_departamento'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
