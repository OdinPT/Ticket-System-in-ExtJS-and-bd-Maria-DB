<?php
include_once("config.php");
//getting id from url
$id = $_COOKIE['cookieID'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM emails WHERE id=$id");

while($res = mysqli_fetch_array($result))
{
	$id = $res['id'];
	$fromaddress = $res['fromaddress'];
	$subject = $res['subject'];
	$date = $res['datea'];
	$body = $res['body'];
	$state = $res['state'];
	$department = $res['department'];
}
?>

<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>.w3-black,.w3-hover-black:hover{color:#fff!important;background-color:#00ff00!important}
.w3-teal,.w3-hover-teal:hover{color:#fff!important;background-color:#00ff00!important}</style>
<body>

<div class="w3-bar w3-black">
  <button class="w3-bar-item w3-button" onclick="openCity('InformacaoPrincipal')">Informação Principal</button>
  <button class="w3-bar-item w3-button" onclick="openCity('InformacaoSecundaria')">Informação Secundária</button>
</div>

<div id="InformacaoPrincipal" class="w3-container city">
  <h2>De: <?php echo $fromaddress;?></h2>
	<h3>Data: <?php echo $date;?></h3>
  <h3>Assunto: <?php echo $subject;?></h3>
	<h5>Estado: <?php echo $state;?></h5>
	<h5>Departamento: <?php echo $department;?></h5>
  <br>
  <h4>Conteúdo:</h4>
  <p><?php echo $body;?></p>
	<br>
<?php
    echo "<button class=\"w3-button w3-xlarge w3-circle w3-black\">▷</button>";
		echo "<a href=\"delete.php?id=$res[id]\"><button class=\"w3-button w3-xlarge w3-circle w3-teal\">HISTORICO</button></a>";
		?>
  </div>
</div>

<!-- <div id="InformacaoSecundaria" class="w3-container city" style="display:none">
  <h2>Paris</h2>
  <p>Paris is the capital of France.</p>
</div> -->
<script>
function openCity(cityName) {
    var i;
    var x = document.getElementsByClassName("city");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    document.getElementById(cityName).style.display = "block";
}
</script>

</body>
</html>
