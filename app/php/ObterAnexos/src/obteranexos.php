<?php
error_reporting(0);
include "../../config.php";
				     $id = $_COOKIE['cookieIDanexo'];
				     $query = "SELECT * " .
				             "FROM upload WHERE id = '$id'";
				     $result = mysqli_query($mysqli,$query) or die('Error, query failed');

$folder = "Downloads Email";

while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    $filename = "./" . $folder . "/" . $row['nome'];

    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="' . basename($filename) . '"');
    header('Content-Length: ' . filesize($filename));
    readfile($filename);
}
				     ob_clean();
				     flush();
				     echo $content;
				     mysqli_close($mysqli);
				     exit;

	       ?>
