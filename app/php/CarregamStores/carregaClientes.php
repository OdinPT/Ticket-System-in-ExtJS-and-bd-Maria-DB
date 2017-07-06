<?php
error_reporting(0);
include("config.php");
//$id = $_COOKIE['cookieIDCliente'];
$return_arr = array();

$query = "call VerClientes()";

$result = sqlsrv_query($mysqli, $query);
while($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC))
{
  $row_array['Id_Cliente'] = $row['Id_Cliente'];
  $row_array['Nome_Cliente'] = $row['Nome_Cliente'];
  $row_array['Email_Cliente'] = $row['Email_Cliente'];
  $row_array['DataNasc_Cliente'] = $row['DataNasc_Cliente'];
  $row_array['Contribuinte_Cliente'] = $row['Contribuinte_Cliente'];

  array_push($return_arr,$row_array);
}
echo json_encode($return_arr);
?>
