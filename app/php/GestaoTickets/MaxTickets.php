<?php
//error_reporting(0);
include "../config.php";

$return_arr = array();

    $query = " call CarregaMaxTicketsDep" ;

$result = mysqli_query($mysqli, $query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

$row_array['MaxDev'] = $row['MaxDev'];
$row_array['MaxND'] = $row['MaxND'];
$row_array['MaxOp'] = $row['MaxOp'];
$row_array['MaxCcenter'] = $row['MaxCcenter'];

    array_push($return_arr,$row_array);
}
echo json_encode($return_arr);

?>
