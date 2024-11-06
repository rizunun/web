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

if (!$id_usuario) {
    die("Usuario no encontrado.");
}

$consulta = $conexion2->prepare("SELECT nombre, Edad, Fecha, VIP, Provincia FROM compania WHERE id_usuario = ? AND VIP = 'No'");
$consulta->bind_param("i", $id_usuario);
$consulta->execute();
$result = $consulta->get_result();

echo '<table border="1" cellpadding="10" style="border-collapse: collapse;">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Edad</th>
            <th>Fecha</th>
            <th>VIP</th>
            <th>Provincia</th>
        </tr>
    </thead>
    <tbody>';

while ($registro = $result->fetch_assoc()) {
    echo "<tr>
        <td>{$registro['nombre']}</td>
        <td>{$registro['Edad']}</td>
        <td>{$registro['Fecha']}</td>
        <td>{$registro['VIP']}</td>
        <td>{$registro['Provincia']}</td>
    </tr>";
}
echo '</tbody></table>';

$consulta->close();
$conexion2->close();
?>


