<?php
require 'class.smtp.php';
require 'class.phpmailer.php';
require 'config.php';
$assunto = $_POST['assuntoresposta'];
$conteudo = $_POST['conteudoresposta'];
$cookieEmail = $_COOKIE['cookieEmail'];
$id = $_COOKIE['cookieID'];
$fileName = $_FILES['anexo']['name'];
$tmpName  = $_FILES['anexo']['tmp_name'];
$fileSize = $_FILES['anexo']['size'];
$fileType = $_FILES['anexo']['type'];
$fp = fopen($tmpName, 'r');
    $content = fread($fp, filesize($tmpName));
    $content = addslashes($content);
    fclose($fp);
    if(!get_magic_quotes_gpc()){
        $fileName = addslashes($fileName);
    }

$result = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
{
  $departamento = $res['id_departamento_funcionarios'];
}
//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE id_departamento_funcionarios='$departamento' AND Tipo_Funcionario=4") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
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

// assunto da mensagem
$PHPMailer->Subject = $assunto;

// corpo da mensagem
$PHPMailer->Body = $conteudo;

// corpo da mensagem em modo texto
$PHPMailer->AltBody = 'Mensagem em texto';

$cookieID = $_COOKIE['cookieID'];
//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id='$cookieID'") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
{
  $fromaddress = $res['email'];
}
echo $fromaddress;
// adiciona destinatário (pode ser chamado inúmeras vezes)
$PHPMailer->AddReplyTo($fromaddress, 'Nome do visitante');
$PHPMailer->AddAddress($fromaddress);
$PHPMailer->addAttachment($tmpName, $fileName);

mysqli_query($mysqli, "call InserirRespostas('$assunto', '$conteudo','$id')");





mysqli_close($mysqli);
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