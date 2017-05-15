<?php
$hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
include_once("config.php");
//getting id from url
$cookieEmail = $_COOKIE['cookieEmail'];
echo $id;
//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM admin WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
{
  $username = $res['username'];
	$password = $res['pass'];
}

$inbox = imap_open($hostname,$username,$password, NULL, 1, array('DISABLE_AUTHENTICATOR' => 'GSSAPI')) or die('Cannot connect to server: ' . imap_last_error());

$emails = imap_search($inbox,'ALL');

if($emails) {
    $output = '';

    foreach($emails as $email_number) {
        $overview = imap_fetch_overview($inbox,$email_number,0);
        $structure = imap_fetchstructure($inbox, $email_number);

        if(isset($structure->parts) && is_array($structure->parts) && isset($structure->parts[1])) {
            $part = $structure->parts[1];
            $message = imap_fetchbody($inbox,$email_number,2);

            if($part->encoding == 3) {
                $message = imap_base64($message);
            } else if($part->encoding == 1) {
                $message = imap_8bit($message);
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
        $from = utf8_decode(imap_utf8($overview[0]->from));
        $date = utf8_decode(imap_utf8($overview[0]->date));
        $subject = utf8_decode(imap_utf8($overview[0]->subject));
         $subject = str_replace('c?', 'ç', $subject);
         $subject = str_replace('C?', 'Ç', $subject);
        $conn= mysqli_connect("localhost","root","","emails");
        $message = strip_tags($message);
        $message = html_entity_decode($message);
        $message = htmlspecialchars($message);
        $message = str_replace('Ã§Ã£', 'çã', $message);
        $message = str_replace('Ã§Ãµ', 'çõ', $message);
        $message = str_replace('Ã§Ãµ', 'çõ', $message);
        $message = str_replace('Ãº', 'ú', $message);
        $message = str_replace('Â', ' ', $message);
        $message = str_replace('Ã', 'Ç', $message);

        echo $message;
        // echo "<br>";
        // echo "<br>";
				    //save to MySQL

                mysqli_query($conn, "Call InserirTickets2('$from', '$subject', '$message','$cookieEmail')");
				mysqli_close($conn);
    }

    echo $output;
}

imap_close($inbox);
?>

<script>
   window.history.back();
</script>
