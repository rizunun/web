<?php
$servidor='localhost';
$basedatos='simple_login_system';
$usuario='root';
$contrasena='';

$conexion2 = new mysqli($servidor,$usuario,$contrasena,$basedatos);
if ($conexion2->connect_errno)
{
	echo"error de conexion verifique sus datos ";
}
else 
{
	echo "<h1>Ejecutado correctamente</h1>";
}
?>