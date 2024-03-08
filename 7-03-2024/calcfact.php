<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pre-factura</title>
    <link rel="stylesheet" href="../css/estilo01.css">
</head>
<body>
    
<h1>Tirilla de pago</h1>
<?php

$nombre=$_POST['nom'];
$telefono=$_POST['tel'];
$prod1=$_POST['prod'];
$cantidad=$_POST['ca'];
$valorunit=$_POST['vu'];
$subtotal=$cantidad*$valorunit;
$iva=$subtotal*0.19;
if($_POST['rad1']=="efe")
{
    $descuento=$subtotal*0.10;
}
elseif($_POST['rad1']=="cheq")
{
    $descuento=$subtotal*0.05;
}
elseif($_POST['rad1']=="tar")
{
    $descuento=$subtotal*0.02;
}
$neto=$subtotal+$iva-$descuento;

echo "<table><caption> Tirrilla de pago </caption><tr><th>Cliente</th><td>$nombre</td></tr><tr><th>Telefono</th><td>$telefono</td></tr><tr><th>Producto</th><td>$prod1</td></tr><tr><th>Unidades</th><td>$cantidad</td></tr><tr><th>Valor Unitario</th><td>$valorunit</td></tr><tr><th>Subtotal</th><td>$subtotal</td></tr><tr><th>Iva</th><td>iva</td></tr><tr><th>Descuento</th><td>$descuento</td></tr><tr><th>Neto A Pagar</th><td>$neto</td></tr></table>";

?>
</body>
</html>