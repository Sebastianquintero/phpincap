<?php
$n1=$_POST['num1'];
$n2=$_POST['num2'];

function cubo($a)
{
    //$a es equivalente a $n1
    $r=pow($a,3);
    echo "El cubo del primer numero $a ingresado es: $r <br>";
}

function cubo01($b)
{
    //b$ es equivalente a $n2 -- esta funcion recibe parametros pero no retorna valores
    $r1=pow ($b,3);
    echo "El cubo del segundo numero $b ingresado es: $r1 <br>";
}
function raiz($a)
{
    $respuesta=sqrt($a);
    return $respuesta;
}
function raiz1($b)
{
    $respuesta=sqrt($b);
    return $respuesta;
}
function division($a,$b)
{
    $r=$a/$b;
    echo "El resultado de dividir $a entre $b es: $r <br>";
    $r1=$b/$a;
    echo "El resultado de dividir $b entre $a es: $r1 <br>";
}
//´Programa principal
if($_POST['operacion']=="cuadrado")
{
    //operaciones sencillas sobre el programa principal
    $r=pow($n1,2);
    $r1=pow($n2,2);
    echo "El cuadrado de $n1 es: $r <br> El cuadrado de $n2 es: $r1 <br>";
}
elseif($_POST['operacion']=="cubo")
{
    //realizar la operacion a traves de funciones que reciben parametros pero no retorna valores
    cubo($n1);
    cubo01($n2);
}
elseif($_POST['operacion']=="raiz")
{
    //funciones que reciben y devuelven parametros
    $r=raiz($n1);
    $r1=raiz1($n2);
    echo "La raiz cuadrada del primer numero $n1 ingresado es: $r <br> La raiz cuadrada del segundo numero $n2 ingresado es: $r1 <br>";
}
elseif($_POST['operacion']=="resto")
{
    $r=$n1%$n2;
    echo "El residuo de dividir $n1 entre $n2 es: $r <br>";
    $r1=$n2%$n1;
    echo "el residuo de dividir $n2 entre $n1 es: $r1 <br>";
}
elseif($_POST['operacion']=="div")
{
    division($n1,$n2);
}