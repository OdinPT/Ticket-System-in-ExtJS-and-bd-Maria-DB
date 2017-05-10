<?php
include_once("config.php");
$id = $_COOKIE['cookieID'];
//$query = mysqli_query($mysqli, "SELECT * FROM emails WHERE id=$id");
$query = mysqli_query($mysqli, "Call TicketSelec($id)");
while($res = mysqli_fetch_array($query))
{
  $to = $res['fromaddress'];
}
if(isset($_POST['submit'])){
    $from = $_COOKIE['cookieEmail']; // this is the sender's Email address
    $subject = $_POST['subject'];
    $message = $_POST['message'];
    $headers = "From:" . $from;
    $headers2 = "From:" . $to;
    mysqli_query($mysqli, "Call InserirRespostas('$message', '$id')");

    mysqli_close($mysqli);
    mail($to,$subject,$message,$headers);
    echo "Resposta enviada";
    // You can also use header('Location: thank_you.php'); to redirect to another page.
    }
?>

<!DOCTYPE html>
<head>
<style>

@import url(https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic);
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  -moz-font-smoothing: antialiased;
  -o-font-smoothing: antialiased;
  font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}
html { overflow-y: hidden; }
body {
  margin: 0;
  font-family: "Roboto", Helvetica, Arial, sans-serif;
  font-size: 12px;
  color: #777;
  background: #fff;
}

#contact input[type="text"],
#contact input[type="email"],
#contact input[type="tel"],
#contact input[type="url"],
#contact textarea,
#contact button[type="submit"] {
  font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
}

#contact {
  background: #F9F9F9;
}

#contact h3 {
  display: block;
  font-size: 30px;
  font-weight: 300;
  margin-bottom: 10px;
}

#contact h4 {
  margin: 5px 0 15px;
  display: block;
  font-size: 15px;
  font-weight: 400;
}

fieldset {
  border: medium none !important;
  margin: 0 0 10px;
  min-width: 100%;
  padding: 0;
  width: 100%;
}

#contact input[type="text"],
#contact textarea {
  width: 100%;
  border: 1px solid #ccc;
  background: #FFF;
  margin: 0 0 5px;
  padding: 10px;
}

#contact input[type="text"]:hover,
#contact textarea:hover {
  -webkit-transition: border-color 0.3s ease-in-out;
  -moz-transition: border-color 0.3s ease-in-out;
  transition: border-color 0.3s ease-in-out;
  border: 1px solid #aaa;
}

#contact textarea {
  height: 100px;
  max-width: 100%;
  resize: none;
}

#contact button[type="submit"] {
  cursor: pointer;
  width: 100%;
  border: none;
  background: #00ff00;
  color: #FFF;
  margin: 0 0 5px;
  padding: 10px;
  font-size: 15px;
}

#contact button[type="submit"]:hover {
  background: #43A047;
  -webkit-transition: background 0.3s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  transition: background-color 0.3s ease-in-out;
}

#contact button[type="submit"]:active {
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
}

.copyright {
  text-align: center;
}

#contact input:focus,
#contact textarea:focus {
  outline: 0;
  border: 1px solid #aaa;
}

::-webkit-input-placeholder {
  color: #888;
}

:-moz-placeholder {
  color: #888;
}

::-moz-placeholder {
  color: #888;
}

:-ms-input-placeholder {
  color: #888;
}

</style>
<title>Form submission</title>
</head>
<body>
<form action="" method="post" id="contact">
  <h3>Formulário de resposta</h3>
    <h4>Insira a sua resposta ao ticket seleccionado.</h4>
    <fieldset>
<input type="text" name="subject" placeholder="Assunto..." tabindex="1" required autofocus>
</fieldset>
<br>
<fieldset>
<textarea name="message" placeholder="Conteúdo..." tabindex="2"></textarea>
</fieldset>
<br>
<fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
</fieldset>

</form>

</body>
</html>
