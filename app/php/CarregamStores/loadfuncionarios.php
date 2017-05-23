<?php
error_reporting(0);
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];
$return_arr = array();

    $query = "SELECT * FROM funcionario ORDER BY id_funcionario";
  //$query = "SELECT * FROM respostas WHERE IDticket=$id";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['id_funcionario'] = $row['id_funcionario'];
$row_array['usernamefunc'] = $row['username'];
$row_array['id_departamento_funcionarios'] = $row['id_departamento_funcionarios'];
$row_array['Tipo_Funcionario'] = $row['Tipo_Funcionario'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>