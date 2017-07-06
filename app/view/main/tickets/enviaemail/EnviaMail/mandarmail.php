<?php
error_reporting(0);
require 'class.smtp.php';
require 'class.phpmailer.php';
require 'config.php';

$assunto = $_POST['assuntoresposta2'];
$conteudo = $_POST['conteudoresposta2'];

$email = $_POST['email'];
$cookieEmail = $_COOKIE['cookieEmail'];
$id = $_COOKIE['cookieID'];

$fileName = $_FILES['anexo2']['name'];
$tmpName  = $_FILES['anexo2']['tmp_name'];
$fileSize = $_FILES['anexo2']['size'];
$fileType = $_FILES['anexo2']['type'];
$fp = fopen($tmpName, 'r');
    $content = fread($fp, filesize($tmpName));
    $content = addslashes($content);
    fclose($fp);
    if(!get_magic_quotes_gpc()){
        $fileName = addslashes($fileName);
    }

$result = sqlsrv_query($mysqli, "SELECT * FROM funcionario WHERE username='$cookieEmail'") or die(sqlsrv_error($mysqli));

while($res = sqlsrv_fetch_array($result))
{
  $departamento = $res['id_departamento_funcionarios'];
}

//selecting data associated with this particular id
$result = sqlsrv_query($mysqli, "SELECT * FROM funcionario WHERE id_departamento_funcionarios='$departamento' AND Tipo_Funcionario=4") or die(sqlsrv_error($mysqli));

while($res = sqlsrv_fetch_array($result))
{
  $username = $res['username'];
  $password = $res['pass'];
}
$PHPMailer = new PHPMailer();

// define que será usado SMTP
$PHPMailer->IsSMTP();

// envia email HTML
$PHPMailer->isHTML( true );

// codificação UTF-8, a codificação mais usada recentemente
$PHPMailer->Charset = 'UTF-8';

// Configurações do SMTP
$PHPMailer->SMTPAuth = true;
$PHPMailer->SMTPSecure = 'TLS';
$PHPMailer->Host = 'smtp.gmail.com';
$PHPMailer->Port = 587;
$PHPMailer->Username = $username;
$PHPMailer->Password = $password;

// E-Mail do remetente (deve ser o mesmo de quem fez a autenticação
// nesse caso seu_login@gmail.com)
$PHPMailer->From = $username;

// Nome do rementente
$PHPMailer->FromName = 'TrackIT';
$conteudo2 = $conteudo;
// assunto da mensagem
$PHPMailer->Subject = $assunto;

$conteudo = str_replace('%conteudo2%', $conteudo2, file_get_contents('action.html'));

// corpo da mensagem
$PHPMailer->Body = $conteudo;

// corpo da mensagem em modo texto
$PHPMailer->AltBody = 'Mensagem em texto';

$cookieID = $_COOKIE['cookieID'];
//selecting data associated with this particular id
// adiciona destinatário (pode ser chamado inúmeras vezes)

$PHPMailer->AddReplyTo($email, 'Nome do visitante');
$PHPMailer->AddAddress($email);
$PHPMailer->addAttachment($tmpName, $fileName);

sqlsrv_query($mysqli, "call InserirRespostas('$assunto', '$conteudo','$id')");
sqlsrv_close($mysqli);

// verifica se enviou corretamente
if ( $PHPMailer->Send() )
{
echo "Enviado com sucesso";
}
else
{
echo 'Erro do PHPMailer: ' . $PHPMailer->ErrorInfo;
}

?>
