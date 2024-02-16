<html>
<head>
    <title>CONDICIONALES</title>
</head>
<body bgcolor="#68F5D5">
    <!-- captura los 3 lados de un triangulo y clasificarlo: Equilatero (Todos los lados iguales) 
        Isoceles (dos lados iguales), Escaleno (Todos los lados son diferentes)-->
    
<?php
$l1=$_POST['lado1'];
$l2=$_POST['lado2'];
$l3=$_POST['lado3'];
if($l1==$l2 and $l1==$l3)
{
    echo "El triangulo ingresado es Equilatero porque todos sus lados son iguales";
}
elseif($l1==$l2 or $l1==$l3 or $l2==$l3)
{
    echo "El triangulo ingresado es ISOCELES porque dos de sus de sus lados son iguales";
}
else
{
    echo "El triangulo ingresado es Escaleno porque todos sus lados son diferentes";
}
?>
</body>
</html>