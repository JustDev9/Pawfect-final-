<?php
// Database configuration
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');     // Change this to your MySQL username
define('DB_PASSWORD', '');         // Change this to your MySQL password
define('DB_NAME', 'pawfect_db');   // Change this to your database name

// Attempt to connect to MySQL database
try {
    $conn = new PDO("mysql:host=" . DB_SERVER . ";dbname=" . DB_NAME, DB_USERNAME, DB_PASSWORD);

    // Set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Set default fetch mode to associative array
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

} catch(PDOException $e) {
    die("ERROR: Could not connect to database. " . $e->getMessage());
}

// Function to sanitize user inputs
function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Function to handle database errors
function handle_db_error($e) {
    error_log("Database Error: " . $e->getMessage());
    return "An error occurred. Please try again later.";
}
?>