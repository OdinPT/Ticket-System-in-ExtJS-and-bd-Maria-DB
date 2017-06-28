<?php
error_reporting(0);
include("config.php");
$return_arr = array();

$cookieEmail = $_COOKIE['cookieEmail'];

  //selecting data associated with this particular id
    $result = mysqli_query($mysqli, "SELECT id_departamento_funcionarios FROM funcionario WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));
    $res = mysqli_fetch_array($result);
    $iddepartamento = $res['id_departamento_funcionarios'];

    $query = "Call VerTicket($iddepartamento)";


$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

  $row_array['id'] = $row['id'];
  $row_array['fromaddress'] = $row['fromaddress'];
  $row_array['subject'] = $row['subject'];
  $row_array['datea'] = $row['datea'];
  $row_array['body'] = $row['body'];
  $row_array['Descricao_Estado'] = $row['Descricao_Estado'];
  $row_array['id_func_emails'] = $row['id_func_emails'];
  $row_array['nome_departamento'] = $row['nome_departamento'];
        //id_func_emails
    array_push($return_arr,$row_array);
}

echo json_encode($return_arr);

?>
