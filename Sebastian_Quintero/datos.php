<?php
$nombre=$_POST['nom'];
$edad=$_POST['ed'];
echo "El nombre ingresado es $nombre y su edad actual es : $edad años  <br>";

if($edad>18)
{
    echo "Felicitaciones ... Eres MAYOR DE EDAD <br>";
}
else
{
    echo"Lo siento ... Eres menor de edad.. <br>",18-$edad," años para
    cumplir la mayoria de edad";
}
?>