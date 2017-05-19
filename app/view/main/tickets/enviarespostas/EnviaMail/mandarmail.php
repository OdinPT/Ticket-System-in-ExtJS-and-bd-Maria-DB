<?php
require 'class.smtp.php';
require 'class.phpmailer.php';
require 'config.php';
$assunto = $_POST['assuntoresposta'];
$conteudo = $_POST['conteudoresposta'];

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
$PHPMailer->Username = 'testetrackit@gmail.com';
$PHPMailer->Password = 'testetrackit123';

// E-Mail do remetente (deve ser o mesmo de quem fez a autenticação
// nesse caso seu_login@gmail.com)
$PHPMailer->From = 'testetrackit@gmail.com';

// Nome do rementente
$PHPMailer->FromName = 'teste trackit';

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
  $fromaddress = $res['fromaddress'];
}
// adiciona destinatário (pode ser chamado inúmeras vezes)
$PHPMailer->AddReplyTo($fromaddress, 'Nome do visitante');
$PHPMailer->AddAddress( $fromaddress );


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