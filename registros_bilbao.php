<?php
require_once 'conexion2.php';
session_start();

if (!isset($_SESSION['username'])) {
    die("Debe iniciar sesión para ver los registros.");
}

$username = $_SESSION['username'];
$sql = "SELECT id_usuario FROM users WHERE username = ?";
$stmt = $conexion2->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$stmt->bind_result($id_usuario);
$stmt->fetch();
$stmt->close();

$sql = "SELECT nombre, Edad, Fecha, VIP, Provincia FROM compania WHERE id_usuario = ? AND Provincia = 'Bilbao'";
$stmt = $conexion2->prepare($sql);
$stmt->bind_param("i", $id_usuario);
$stmt->execute();
$result = $stmt->get_result();

echo "<table border='1'>
<tr>
<th>Nombre</th>
<th>Edad</th>
<th>Fecha</th>
<th>VIP</th>
<th>Provincia</th>
</tr>";

while ($registro = $result->fetch_assoc()) {
    echo "<tr>
    <td>{$registro['nombre']}</td>
    <td>{$registro['Edad']}</td>
    <td>{$registro['Fecha']}</td>
    <td>{$registro['VIP']}</td>
    <td>{$registro['Provincia']}</td>
    </tr>";
}
echo "</table>";

$stmt->close();
$conexion2->close();
?>
