<?php
error_reporting(0);
include("config.php");
$funcionario = $_COOKIE['cookieEmail'];
$return_arr = array();

$vedepfunc = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$funcionario'");
while($resi = mysqli_fetch_array($vedepfunc))
{
	$tipo = $resi['id_departamento_funcionarios'];
}
$query = "call VerDepFunc('$tipo')";

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['id_funcionario'] = $row['id_funcionario'];
$row_array['usernamefunc'] = $row['username'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>