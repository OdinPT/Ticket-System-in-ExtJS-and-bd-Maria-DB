<?php
error_reporting(0);
include "../config.php";

$id = $_COOKIE['cookieIDfuncionario'];

$return_arr = array();

$query = "call CarregaFuncSelec($id)";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['id_funcionario'] = $row['id_funcionario'];
$row_array['usernamefunc'] = $row['username'];
$row_array['nome_departamento'] = $row['nome_departamento'];
$row_array['Descricao_TipoUtilizador'] = $row['Descricao_TipoUtilizador'];


    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>
