<?php
//error_reporting(0);
include("config.php");

$id = $_COOKIE['cookieIDhistorico'];

$return_arr = array();

    $query = "call RetornaAtriSelec($id)" ;

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['ID_Atribuicao'] = $row['ID_Atribuicao'];
$row_array['ID_Func_Atribuidor'] = $row['ID_Func_Atribuidor'];
$row_array['DataAtribuicao'] = $row['DataAtribuicao'];
$row_array['ID_DepAtribuicao'] = $row['ID_DepAtribuicao'];
$row_array['ID_Func_Atribuido'] = $row['ID_Func_Atribuido'];


    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
