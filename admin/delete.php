<?php
    include("../config/database.php");
    $id = $_GET['id'];
    $database = new Database();
    $conn = $database->getConnection();
    $query = "DELETE FROM `products` WHERE id=$id";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    header("Location:tables.php");
?>
