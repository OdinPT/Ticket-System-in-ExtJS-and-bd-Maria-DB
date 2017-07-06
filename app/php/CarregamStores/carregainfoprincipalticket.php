<?php
//error_reporting(0);
include("config.php");
$id = $_COOKIE['cookieID'];
$return_arr = array();

$query = "call TicketSelec($id)";

$result = sqlsrv_query($mysqli, $query);
while($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC))
{
  $row_array['id'] = $row['id'];
  $row_array['email'] = $row['email'];
  $row_array['datea'] = $row['datea'];
  $row_array['Descricao_Estado'] = $row['Descricao_Estado'];
  $row_array['subject'] = $row['subject'];
  $row_array['body'] = $row['body'];
  $row_array['DesTipoRes'] = $row['DesTipoRes'];
  $row_array['nome_departamento'] = $row['nome_departamento'];
  $row_array['id_func_emails'] = $row['id_func_emails'];


  array_push($return_arr,$row_array);
}
echo json_encode($return_arr);
?>
