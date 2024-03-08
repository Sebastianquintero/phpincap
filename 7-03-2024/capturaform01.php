<?php

$n1=$_POST['a'];
if($_POST['rad1']=="cuadrado")
{
    $r=pow($n1,2);
    echo "El cuadrado del numero $n1 es : $r";
}
elseif($_POST['rad1']=="cubo")
{
    $r=pow($n1,3);
    echo "El cuadrado del numero $n1 es : $r";
}
?>