<?php 
include 'db.php';

header('Content-Type: application/json');

$response = ["success" => false, "message" => ""];

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $username = htmlspecialchars($_POST['username']);
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $sql = "INSERT INTO users (username, password) VALUES (:username, :password)";
    $stmt = $conn->prepare($sql);

    if ($stmt->execute(['username' => $username, 'password' => $password])) {
        $response["success"] = true;
        $response["message"] = "Registration successful. You can now log in.";
    } else {
        $response["message"] = "Error registering.";
    }
} else {
    $response["message"] = "Invalid request.";
}

echo json_encode($response);
?>

