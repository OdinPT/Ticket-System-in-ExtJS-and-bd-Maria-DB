<?php
$hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
include_once("config.php");
//getting id from url
$cookieEmail = $_COOKIE['cookieEmail'];
//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
{
  $iddepartamento = $res['id_departamento_funcionarios'];
}
$escolhe = mysqli_query($mysqli, "SELECT * FROM funcionario WHERE Tipo_Funcionario=4 AND id_departamento_funcionarios=$iddepartamento") or die(mysqli_error($mysqli));
while($rese = mysqli_fetch_array($escolhe))
{
  $username = $rese['username'];
  $password = $rese['pass'];
}
/* try to connect */
$inbox = imap_open($hostname,$username,$password) or die('Cannot connect to Tiriyo: ' . imap_last_error());
//echo $inbox;
/* grab emails */
$emails = imap_search($inbox,'UNSEEN');


/* if emails are returned, cycle through each... */
if($emails) {

  /* begin output var */
  $output = '';

  /* put the newest emails on top */
  rsort($emails);

  /* for every email... */
  foreach($emails as $email_number) {
    $overview = imap_fetch_overview($inbox,$email_number,0);
            $structure = imap_fetchstructure($inbox, $email_number);
            $header = imap_header($inbox, $email_number);
            $frome = $header->from;
            foreach ($frome as $ide => $object) {
                $fromaddress = $object->mailbox . "@" . $object->host;
            }
    if(isset($structure->parts) && is_array($structure->parts) && isset($structure->parts[1])) {
        $part = $structure->parts[0];
        $message = quoted_printable_decode(imap_fetchbody($inbox,$email_number,"1.2"));
        if(empty($message))
        {
          $message = imap_fetchbody($inbox,$email_number,1);
        }
        if($part->encoding == 3) {
            $message = imap_base64($message);
        } else if($part->encoding == 1) {
            $message = imap_8bit($message);
            echo $message;
        } else if($part->encoding == 2) {
            $message = imap_binary($message);
        }
        else if($part->encoding == 4){
          $message = utf8_encode(quoted_printable_decode($message));
        }
        else if($part->encoding == 5)
        {
          $message = $message;
        } else {
            $message = imap_qprint($message);
        }
    }
    $from = quoted_printable_decode(imap_utf8($overview[0]->from));
        $date = utf8_decode(imap_utf8($overview[0]->date));
        $subject = quoted_printable_decode(imap_utf8($overview[0]->subject));
        $message = strip_tags($message);
        $message = html_entity_decode($message);
        $message = htmlspecialchars($message);
    echo $message;
    $conn= mysqli_connect("localhost","root","","emails");
    mysqli_query($conn, "Call InserirTickets2('$fromaddress','$from', '$subject', '$message','$cookieEmail')");
	    mysqli_close($conn);
  }
}

/* close the connection */
imap_close($inbox);
?>