<?php
error_reporting(0);
include("config.php");
$return_arr = array();

$cookieEmail = $_COOKIE['cookieEmail'];

  //selecting data associated with this particular id
<<<<<<< HEAD
    $result = sqlsrv_query($mysqli, "SELECT id_departamento_funcionarios FROM funcionario WHERE username='$cookieEmail'") or die(sqlsrv_error($mysqli));
    $res = sqlsrv_fetch_array($result);
=======
    $result = mysqli_query($mysqli, "SELECT id_departamento_funcionarios FROM funcionario WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));
    $res = mysqli_fetch_array($result);

>>>>>>> a24fcc125feea59199f412789f438675a17b8613
    $iddepartamento = $res['id_departamento_funcionarios'];

    $query = "Call VerTicket($iddepartamento)";


$result = sqlsrv_query($mysqli, $query);
while ($row = sqlsrv_fetch_array($result, SQLSRV_ASSOC)) {

  $row_array['id'] = $row['id'];
  $row_array['fromaddress'] = $row['fromaddress'];
  $row_array['subject'] = $row['subject'];
  $row_array['datea'] = $row['datea'];
  $row_array['body'] = $row['body'];
  $row_array['Descricao_Estado'] = $row['Descricao_Estado'];
  $row_array['DesTipoRes'] = $row['DesTipoRes'];
  $row_array['id_func_emails'] = $row['id_func_emails'];
  $row_array['nome_departamento'] = $row['nome_departamento'];

    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>
