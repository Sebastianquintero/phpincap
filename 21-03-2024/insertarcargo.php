<?php
$conexion=mysqli_connect("localhost","root","","pyh") or die("Problemas con la conexion");
$nombre=$_POST['nom'];
$descripcion=$_POST['desc'];
$salario=$_POST['sal'];
$comision=$_POST['com'];
$horario=$_POST['hor'];

$registros=mysqli_query($conexion,"select Id_cargo,Nombre_cargo,Descripcion,Salario,Comision,Horario from cargo") or die ("Problemas en el Select ...".mysqli_error($conexion));

echo "<table border='2' width='80%'><caption>Registros Cargo</caption><tr><th>Id_cargo</th><th>Nombre Cargo</th><th>Descripcion</th><th>Salario</th><th>Horario</th></tr><tr>";
while($reg=mysqli_fetch_array($registros))
{
    echo "<td>".$reg['Id_cargo']."</td>";
    echo "<td>".$reg['Nombre_cargo']."</td>";
    echo "<td>".$reg['Descripcion']."</td>";
    echo "<td>".$reg['Salario']."</td>";
    echo "<td>".$reg['Comision']."</td>";
    echo "<td>".$reg['Horario']."</td></tr>";
}
echo "</table>";
mysqli_close($conexion);
?> 