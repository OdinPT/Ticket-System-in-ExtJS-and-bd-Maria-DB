<?php
$cookieEmail = $_COOKIE['cookieEmail'];
//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM admin WHERE username='$cookieEmail'") or die(mysqli_error($mysqli));

while($res = mysqli_fetch_array($result))
{
  $username = $res['username'];
	$password = $res['password'];
}
$mbox = imap_open("{imap.gmail.com:993/imap/ssl}INBOX", $username, $password)
    or die("Can't connect: " . imap_last_error());

$check = imap_mailboxmsginfo($mbox);
echo "Messages before delete: " . $check->Nmsgs . "<br />\n";

imap_delete($mbox, 1);

imap_expunge($mbox);

imap_close($mbox);
?>
