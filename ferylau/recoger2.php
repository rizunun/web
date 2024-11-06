<?php
require_once 'conexion2.php';
session_start();

if (!isset($_SESSION['username'])) {
    die("Debe iniciar sesión para registrar el viaje.");
}

// Obtener el ID del usuario logueado
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

// Recibir datos del formulario
$nombre = $_POST['nombre'];
$Edad = $_POST['Edad'];
$Fecha = $_POST['Fecha'];
$VIP = $_POST['VIP'];
$Provincia = $_POST['Provincia'];

// Insertar en la tabla `compania` con `id_usuario`
$stmt = $conexion2->prepare("INSERT INTO compania (nombre, Edad, Fecha, VIP, Provincia, id_usuario) VALUES (?, ?, ?, ?, ?, ?)");

$stmt->bind_param("sisssi", $nombre, $Edad, $Fecha, $VIP, $Provincia, $id_usuario);

if ($stmt->execute()) {
    $_SESSION['message'] = "Datos del viaje guardados correctamente";
} else {
    $_SESSION['message'] = "Error: " . $stmt->error;
}

$stmt->close();
$conexion2->close();

// Redirigir a welcome.php
header("Location: welcome.php");
exit();
?>
