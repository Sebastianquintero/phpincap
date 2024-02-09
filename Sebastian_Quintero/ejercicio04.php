<html>
<head>
    <title>BASICO PHP</title>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Ejercicio Basico en PHP</h1>
<?php
    /* programa que toma 3 cadenas, las concatena y muestra por pantalla */
    $nombre1="Diego";
    $nombre2="Juan";
    $nombre3="Ana";

    //concatenar o unir cadenas
    $estudiantes=$nombre1 ." ". $nombre2 ." ". $nombre3;
    echo "<font color='Blue' size='10'> $estudiantes </font><br>";

    $edad1="15";
    $edad2="18";
    $edad3="24";
    $edades=$edad1." ". $edad2." ".$edad3;

    echo "<b><s> Las edades respectivas son:",$edades,"años </s></b><br>";

    $edades1=$edad1+$edad2+$edad3;
    echo "La suma de las unidades es : $edades1 años";
?>
<h6>Ultima Linea En HTML</h6>
</body>
</html>