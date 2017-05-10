<?php
//including the database connection file
include("config.php");

//getting id of the data from url
$id = $_COOKIE['cookieID'];

//deleting the row from table

$query = mysqli_query($mysqli, "SELECT * FROM emails WHERE id=$id");
while($res = mysqli_fetch_array($query))
{
	$body = $res['body'];
  $subject = $res['subject'];
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
body {
  margin: 0;
  font-family: "Roboto", Helvetica, Arial, sans-serif;
  font-size: 12px;
  color: #777;
}
#contact input[type="text"],
#contact input[type="email"],
#contact input[type="tel"],
#contact input[type="url"],
#contact textarea,
#contact button[type="submit"] {
  font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
}

#contact h2 {
  display: block;
  font-size: 30px;
  font-weight: 300;
  margin-bottom: 10px;
}

#contact h3 {
  margin: 5px 0 15px;
  display: block;
  font-size: 15px;
  font-weight: 400;
}

#contact h4 {
  margin: 5px 0 15px;
  display: block;
  font-size: 16px;
  font-weight: 400;
}

fieldset {
  border: medium none !important;
  margin: 0 0 10px;
  min-width: 100%;
  padding: 0;
  width: 100%;
}
</style>
<title>Form submission</title>
</head>
<body>
  <div>
<form action="" method="post" id="contact">
  <h2>Conteúdo do Ticket </h2>
    <h3>Utilize as tabs como meio de moderação do ticket.</h4>
    <br>
    <fieldset>
    <h3>Assunto: <?php echo $subject ?></h3>
      </fieldset>
    <fieldset>
    <h3>Body:</h3>
<h4><?php echo $body ?></h4>
</fieldset>
</form>
</div>
</body>
</html>
