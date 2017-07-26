<?php
include("config.php");

//Caso o estado esteja a ser visualizado mostra mensagem a dizer que o ticket está a ser usado

$id = $_COOKIE['cookieID'];
$IDFuncEstadox = $_COOKIE['cookieEmail'];

$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id='$id'");

        while($res = mysqli_fetch_array($result))
        {
	        $state = $res['state'];
	        $func = $res['id_func_emails'];
        }

$kappa = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$IDFuncEstadox'");

        while($res = mysqli_fetch_array($kappa))
        {
	        $tipo = $res['Tipo_Funcionario'];
        }

    if($state == 1)
    {
            if($func == $IDFuncEstadox)
            {
            $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                echo "Sucesso";
            }
      else if($tipo == 3)
            {
                $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                    echo "Sucesso 1";
            }
      else if($state != 3 && $state != 4)
               {
                $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                    echo "Sucesso 2";
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
                    $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                    echo "Sucesso";
                }
                else if($tipo == 3)
            {
            $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
            echo "Sucesso";
            }
        else if($state != 3 && $state != 4)
            {
                $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
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
            $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                echo "Sucesso estado =3 ";
        }
        else if($tipo == 3 || $tipo == 2)
            {
                $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                echo "Sucesso tipo 3 .1";
            }
            else if($state != 3 && $state != 4)
            {
                $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                echo "Sucesso estado != 3 e 4";
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
            else if($tipo == 3 || $tipo == 2)
            {
                echo "Sucesso";
            }
            else if($state != 3 && $state != 4)
            {
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
                    $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                         echo "Sucesso";
                }
                else if($tipo == 3)
                {
                    $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                        echo "Sucesso";
                }
                else if($state != 3 && $state != 4)
                {
                    $insere = mysqli_query($mysqli, "call inserirhistoricoestados('$id',3,'$IDFuncEstadox')");
                        echo "Sucesso";
                }
                else
                    {
                        header("HTTP/1.0 404 Not Found");
                        header('HTTP', true, 500);
                    }
            }

?>