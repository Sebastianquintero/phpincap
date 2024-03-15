<?php
$nombre=$_POST['nom'];
$salario=$_POST['sal'];
$dias1=$_POST['dias'];
$cantidad=$_POST['ch'];
$comisiones=$_POST['com'];
$prestamos=$_POST['prest'];
$base=($salario/30)*$dias1;//salario base o proporcional por dias trabajados

if($salario<=2600000)//calcular auxilio transporte
{
    $auxilio=(162000/30)*$dias1;
}
else
{
    $auxilio=0;
}
//calculo horas extras
$hn=($salario/240); //8 horas diarias * 30 dias = 240 horas mensuales
if($_POST['thoras']=="diurna")
{
    $vhorad=$hn*$cantidad*1.25; //incremento por horas diurnas 25%
}
elseif($_POST['thoras']=="noct")
{
    $vhoran=$hn*$cantidad*1.75; //incremento por horas nocturnas 75%
}
elseif($_POST['thoras']=="fest")
{
    $vhoraf=$hn*$cantidad*2.00; //incremento por horas festiva 100%
}
elseif($_POST['thoras']=="rec")
{
    $vhorarec=$hn*$cantidad*1.35; //incremento por recargo nocturno 35%
}

$vtotalhoras=$vhorad+$vhoran+$vhoraf+$vhorarec;
$devengado=$base+$auxilio+$vtotalhoras+$comisiones;
$salud=($devengado-$auxilio)*0.04;
$pension=($devengado-$auxilio)*0.04;
$deducido=$salud+$pension+$prestamos;
$neto=$devengado-$deducido;