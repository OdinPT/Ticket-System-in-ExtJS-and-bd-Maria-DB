<?php
	    //include_once 'config.php';
	    include("config.php");
				     $id = $_COOKIE['cookieIDanexo'];
				     $query = "SELECT * " .
				             "FROM upload WHERE id = '$id'";
				     $result = mysqli_query($mysqli,$query) or die('Error, query failed');
				     list($id, $nome, $content, $id_ticket) = mysqli_fetch_array($result);
				 				   //echo $id . $file . $type . $size;
				 				   //echo 'sampath';
				     header("Content-Disposition: attachment; filename=$nome");
				     ob_clean();
				     flush();
				     echo $content;
				     mysqli_close($mysqli);
				     exit;

	       ?>
