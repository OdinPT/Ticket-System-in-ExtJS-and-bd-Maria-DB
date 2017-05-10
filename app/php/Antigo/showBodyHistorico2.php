<style>

/*#departments {
   overflow:hidden;
   width:150px;
   -moz-border-radius: 5px 5px 5px 5px;
   -webkit-border-radius: 5px 9px 9px 5px;
   border-radius: 5px 5px 5px 5px;
   box-shadow: 1px 1px 5px #330033;
	 color: #fff;
   background: #00ff00 no-repeat 319px center;
}*/
h2 {
  text-shadow: 0 1px 0 #ccc,
               0 2px 0 #c9c9c9,
               0 3px 0 #bbb,
               0 4px 0 #b9b9b9,
               0 5px 0 #aaa,
               0 6px 1px rgba(0,0,0,.1),
               0 0 5px rgba(0,0,0,.1),
               0 1px 3px rgba(0,0,0,.3),
               0 3px 5px rgba(0,0,0,.2),
               0 5px 10px rgba(0,0,0,.25),
               0 10px 10px rgba(0,0,0,.2),
               0 20px 20px rgba(0,0,0,.15);
               color: #00ff00;
}
p {
    font-family: "Times New Roman", Times, serif;
}
</style>
<?php
//including the database connection file
include("config.php");

//getting id of the data from url
$id = $_COOKIE['cookieIDhistorico'];

//deleting the row from table

$query = mysqli_query($mysqli, "SELECT * FROM historico WHERE id=$id");
while($res = mysqli_fetch_array($query))
{
  echo "<h2>Outras Informações</h2>";
  echo "<br />";
  $id = $res['id'];
  echo "ID: $id";
  echo "<br />";
  $from = $res['fromaddress'];
  echo "De: $from";
  echo "<br />";
  $subject = $res['subject'];
  echo "Assunto: $subject";
  echo "<br />";
  $data = $res['datea'];
  echo "Data: $data";
  echo "<br />";
  $state = $res['state'];
  echo "Estado: $state";
  echo "<br />";
  $department = $res['department'];
  echo "Departamento: $department";
}
//redirecting to the display page (index.php in our case)
?>
<!-- <br><br><br><br>
<form action="showBody.php" method="GET" id="form1" name="form1">
    <select name="departments" id="departments" onchange="form1.submit()">
    <option value="Departamento1">Departamento1</option>
    <option value="Departamento2">Departamento2</option>
    <option value="Departamento3">Departamento3</option>
    <option value="Departamento4">Departamento4</option>
    </select>
    </form>
		<script type="text/javascript">
  document.getElementById('departments').value = "<?php echo $_GET['departments'];?>";
</script> -->
<!-- <?php
    if(isset($_GET['departments']))
    {
        $department=$_GET['departments'];
        $ins=mysqli_query($mysqli,"UPDATE emails SET department='$department' WHERE id=$id");

    }

?> -->

<!-- <script>
    window.history.back();
</script> -->
