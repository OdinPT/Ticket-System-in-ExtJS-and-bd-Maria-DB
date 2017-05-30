<?php
include("config.php");
$id = $_COOKIE['cookieIDfuncionario'];

$username = $_POST['Nome_Clientee2'];
$password = $_POST['Email_Clientee2'];
$id_departamento = $_POST['id_departamento'];
$tipo_funcionario = $_POST['tipo_funcionario'];

$kappa = mysqli_query($mysqli, "UPDATE funcionario SET username='$username', pass='$password', id_departamento_funcionarios='$id_departamento', Tipo_Funcionario='$tipo_funcionario' WHERE id_funcionario=$id");
mysqli_close($mysqli);
?>

/*
 {
            xtype: 'textfield',
            fieldLabel: 'Username:',
            id: 'Nome_Clientee',
            name: 'Nome_Clientee2'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Email:',
            inputType: 'password',
            id: 'Email_Clientee',
            name: 'Email_Clientee2'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'ID do Departamento:',
            id: 'DataNasc_Clientee2'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Contribuinte',
            id: 'Contribuinte_Clientee2'
        }




*/

