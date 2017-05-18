<?php
require 'class.smtp.php';
require 'class.phpmailer.php';
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
$PHPMailer->Subject = 'aaa';

// corpo da mensagem
$PHPMailer->Body = '<p>Mensagem em HTML</p>';

// corpo da mensagem em modo texto
$PHPMailer->AltBody = 'Mensagem em texto';


// adiciona destinatário (pode ser chamado inúmeras vezes)
$PHPMailer->AddReplyTo('cacerftw@hotmail.com', 'Nome do visitante');
$PHPMailer->AddAddress( 'cacerftw@hotmail.com' );


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