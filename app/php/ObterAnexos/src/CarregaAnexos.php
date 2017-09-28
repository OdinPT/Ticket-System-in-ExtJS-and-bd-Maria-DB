<?php
error_reporting(0);
include "../../config.php";

$id = $_COOKIE['cookieID'];
set_time_limit(3000);

/* connect to gmail with your credentials */
$hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
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
$buscaassunto = mysqli_query($mysqli, "SELECT * FROM emails WHERE id=$id");
while($res = mysqli_fetch_array($buscaassunto))
{
 	$subject = $res['subject'];
 }

/* try to connect */
$inbox = imap_open($hostname,$username,$password) or die('Cannot connect to Gmail: ' . imap_last_error());

$emails = imap_search($inbox, 'SUBJECT '.$subject.'');

/* if any emails found, iterate through each email */
if($emails) {

    $count = 1;

    /* put the newest emails on top */
    rsort($emails);

    /* for every email... */
    foreach($emails as $email_number)
    {

        /* get information specific to this email */
        $overview = imap_fetch_overview($inbox,$email_number,0);

        $message = imap_fetchbody($inbox,$email_number,2);

        /* get mail structure */
        $structure = imap_fetchstructure($inbox, $email_number);

        $attachments = array();

        /* if any attachments found... */
        if(isset($structure->parts) && count($structure->parts))
        {
            for($i = 0; $i < count($structure->parts); $i++)
            {
                $attachments[$i] = array(
                    'is_attachment' => false,
                    'filename' => '',
                    'name' => '',
                    'attachment' => ''
                );

                if($structure->parts[$i]->ifdparameters)
                {
                    foreach($structure->parts[$i]->dparameters as $object)
                    {
                        if(strtolower($object->attribute) == 'filename')
                        {
                            $attachments[$i]['is_attachment'] = true;
                            $attachments[$i]['filename'] = $object->value;
                        }
                    }
                }

                if($structure->parts[$i]->ifparameters)
                {
                    foreach($structure->parts[$i]->parameters as $object)
                    {
                        if(strtolower($object->attribute) == 'name')
                        {
                            $attachments[$i]['is_attachment'] = true;
                            $attachments[$i]['name'] = $object->value;
                        }
                    }
                }

                if($attachments[$i]['is_attachment'])
                {
                    $attachments[$i]['attachment'] = imap_fetchbody($inbox, $email_number, $i+1);

                    /* 3 = BASE64 encoding */
                    if($structure->parts[$i]->encoding == 3)
                    {
                        $attachments[$i]['attachment'] = base64_decode($attachments[$i]['attachment']);
                    }
                    /* 4 = QUOTED-PRINTABLE encoding */
                    elseif($structure->parts[$i]->encoding == 4)
                    {
                        $attachments[$i]['attachment'] = quoted_printable_decode($attachments[$i]['attachment']);
                    }
                }
            }
        }

        /* iterate through each attachment and save it */
        foreach($attachments as $attachment)
        {
            if($attachment['is_attachment'] == 1)
            {
                $filename = $attachment['name'];
                if(empty($filename)) $filename = $attachment['filename'];

                if(empty($filename)) $filename = time() . ".dat";
                $folder = "Downloads Email";
                if(!is_dir($folder))
                {
                     mkdir($folder);
                }
                $fp = fopen("./". $folder ."/". $filename, "w+");
                fwrite($fp, $attachment['attachment']);
                fclose($fp);
                $fp = fopen($filename, 'r');
        $data = fread($fp, filesize($filename));
        $data = addslashes($data);
        fclose($fp);
        $filename = quoted_printable_decode(imap_utf8($filename));
        $insere = mysqli_query($mysqli, "INSERT INTO upload(nome, content, id_ticket) VALUES ('$filename','$data','$id')");
            }
        }
    }
}
imap_close($inbox);
?>