<?php
include("config.php");

//Caso o estado esteja a ser visualizado mostra mensagem a dizer que o ticket está a ser usado

$id = $_COOKIE['cookieID'];
$IDFuncEstadox = $_COOKIE['cookieEmail'];

<<<<<<< HEAD
$result = sqlsrv_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

while($res = sqlsrv_fetch_array($result))
=======
$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

while($res = mysqli_fetch_array($result))
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
{
	$state = $res['state'];
	$func = $res['id_func_emails'];
}

<<<<<<< HEAD
$kappa = sqlsrv_query($mysqli, "SELECT * FROM funcionario WHERE username='$IDFuncEstadox'");

while($res = sqlsrv_fetch_array($kappa))
=======
$kappa = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$IDFuncEstadox'");

while($res = mysqli_fetch_array($kappa))
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
{
	$tipo = $res['Tipo_Funcionario'];
}

if($state == 1)
 {
 if($func == $IDFuncEstadox)
 {
<<<<<<< HEAD
 $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
 $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
     echo "Sucesso";
 }
 else if($tipo == 3)
 {
<<<<<<< HEAD
     $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
     $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
         echo "Sucesso";
 }
 else if($state != 3 && $state != 4)
 {
     //$insere = mysqli_query($mysqli, "UPDATE emails SET state=3 WHERE id='$id'");

<<<<<<< HEAD
     $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
     $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
     echo "Sucesso";

 }
 else
 {

     header("HTTP/1.0 404 Not Found");
     header('HTTP', true, 500);
 }
 }
 if($state == 2)
 {
 if($func == $IDFuncEstadox)
 {
<<<<<<< HEAD
 $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
 $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
     echo "Sucesso";
 }
 else if($tipo == 3)
 {
<<<<<<< HEAD
     $insere = msqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
     $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
         echo "Sucesso";
 }
 else if($state != 3 && $state != 4)
 {
     //$insere = mysqli_query($mysqli, "UPDATE emails SET state=3 WHERE id='$id'");

<<<<<<< HEAD
     $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
     $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
     echo "Sucesso";

 }
 else
 {

     header("HTTP/1.0 404 Not Found");
     header('HTTP', true, 500);
 }
 }
 if($state == 3)
 {
 if($func == $IDFuncEstadox)
 {
<<<<<<< HEAD
 $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
 $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
     echo "Sucesso";
 }
 else if($tipo == 3)
 {
<<<<<<< HEAD
     $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
     $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
         echo "Sucesso";
 }
 else if($state != 3 && $state != 4)
 {
     //$insere = mysqli_query($mysqli, "UPDATE emails SET state=3 WHERE id='$id'");

<<<<<<< HEAD
     $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
     $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
     echo "Sucesso";

 }
 else
 {

     header("HTTP/1.0 404 Not Found");
     header('HTTP', true, 500);
 }
 }
 if($state == 4)
   {
   if($func == $IDFuncEstadox)
   {
       echo "Sucesso";
   }
   else if($tipo == 3)
   {
           echo "Sucesso";
   }
   else if($state != 3 && $state != 4)
   {
       //$insere = mysqli_query($mysqli, "UPDATE emails SET state=3 WHERE id='$id'");
       echo "Sucesso";

   }
   else
   {

       header("HTTP/1.0 404 Not Found");
       header('HTTP', true, 500);
   }
   }
    if($state == 5)
     {
     if($func == $IDFuncEstadox)
     {
         echo "Sucesso";
     }
     else if($tipo == 3)
     {
             echo "Sucesso";
     }
     else if($state != 3 && $state != 4)
     {
         //$insere = mysqli_query($mysqli, "UPDATE emails SET state=3 WHERE id='$id'");
         echo "Sucesso";

     }
     else
     {

         header("HTTP/1.0 404 Not Found");
         header('HTTP', true, 500);
     }
     }
     if($state == 6)
      {
      if($func == $IDFuncEstadox)
      {
<<<<<<< HEAD
      $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
      $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
          echo "Sucesso";
      }
      else if($tipo == 3)
      {
<<<<<<< HEAD
          $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
          $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
              echo "Sucesso";
      }
      else if($state != 3 && $state != 4)
      {
          //$insere = mysqli_query($mysqli, "UPDATE emails SET state=3 WHERE id='$id'");

<<<<<<< HEAD
          $insere = sqlsrv_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
=======
          $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
          echo "Sucesso";

      }
      else
      {

          header("HTTP/1.0 404 Not Found");
          header('HTTP', true, 500);
      }
      }


?>