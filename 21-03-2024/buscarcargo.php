<?php
$conexion=mysqli_connect("localhost","root","","pyh") or die("Problemas con la conexion");
$opcion=$_POST['opc'];
$buscar=$_POST['busc'];

if ($opcion=="cod")
{
    $registros=mysqli_query($conexion,"select Id_cargo,Nombre_cargo,Descripcion,Salario,Comision,Horario from cargo where Id_cargo=$buscar") or die ("Problemas en el Select ...".mysqli_error($conexion));
    if($reg=mysqli_fetch_array($registros))
    {
        mysqli_query($conexion,"select from cargo where $buscar==Id_cargo")or die ("Problemas con el select ...".mysqli_error($conexion));
        echo "Se efectuo la busqueda del registro solicitado .... <br><br>";
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
    }
    else
    {
        echo "Registro solicitado NO EXISTE...";
    }
}
