<?php

include "../../config.php";

// Define $username and $password

session_start();
$truee = 'true';
$falsee = 'false';

$username=$_POST['user'];
$password=$_POST['pass'];

$url = "Login.js";

// Establishing Connection with Server by passing server_name, user_id and password as a parameter


// Tso protect MySQL injection for Security purpose

$username = stripslashes($username);
$password = stripslashes($password);

$username = mysqli_real_escape_string($mysqli, $username);
$password = mysqli_real_escape_string($mysqli, $password);

// Selecting Database
// SQL query to fetch information of registerd users and finds user match.

$query = mysqli_query($mysqli, "Call Login('$username','$password')");
$rows = mysqli_num_rows($query);
if ($rows == 1) {
  setcookie('password','true',time()+60*60*24*365, '/');
  setcookie('cookieEmail',$username,time()+60*60*24*365, '/');
  header("Refresh:0");
  }
else {
  setcookie('password','false',time()+60*60*24*365, '/');
  header("Refresh:0");
}
mysqli_close($mysqli); // Closing Connection

?>

/*
const transport = nodemailer.createTransport({
 host: 'smtp.gmail.com',
    port: 587,
    secure: false,
    auth: {
        user: 'testetrackit@gmail.com',
        pass: 'testetrackit123',
    },
});
var imap = {
      user: "testetrackit@gmail.com",
      password: "testetrackit123",
      host: "imap.gmail.com",
      port: 993,
      tls: true,
      tlsOptions: { rejectUnauthorized: false }
};

*/
