<?php
// CORS headers for development (Vite, etc.)
$allowed_origins = [
    'http://localhost:5173',
    'http://localhost:3000',
    'http://127.0.0.1:5173',
    'http://127.0.0.1:3000',
];
$origin = $_SERVER['HTTP_ORIGIN'] ?? '';
if (in_array($origin, $allowed_origins)) {
    header("Access-Control-Allow-Origin: $origin");
    header('Access-Control-Allow-Credentials: true');
} else {
    header('Access-Control-Allow-Origin: *');
}
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
header('Access-Control-Max-Age: 86400');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

require_once 'db.php';

// Only allow POST requests for signup
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Method not allowed']);
    exit();
}

// Set content type for JSON response
header('Content-Type: application/json');

// Get JSON data from request body
$data = json_decode(file_get_contents('php://input'), true);

// Validate required fields
if (!isset($data['name']) || !isset($data['email']) || !isset($data['password'])) {
    http_response_code(400);
    echo json_encode(['error' => 'Name, email, and password are required']);
    exit();
}

// Sanitize input
$name = sanitize_input($data['name']);
$email = sanitize_input($data['email']);
$password = $data['password']; // Don't sanitize password as it will be hashed

// Validate email format
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode(['error' => 'Invalid email format']);
    exit();
}

// Validate password strength
if (strlen($password) < 8) {
    http_response_code(400);
    echo json_encode(['error' => 'Password must be at least 8 characters long']);
    exit();
}

if (!preg_match('/[A-Z]/', $password)) {
    http_response_code(400);
    echo json_encode(['error' => 'Password must contain at least one uppercase letter']);
    exit();
}

if (!preg_match('/[0-9]/', $password)) {
    http_response_code(400);
    echo json_encode(['error' => 'Password must contain at least one number']);
    exit();
}

if (!preg_match('/[!@#$%^&*(),.?":{}|<>]/', $password)) {
    http_response_code(400);
    echo json_encode(['error' => 'Password must contain at least one special character']);
    exit();
}

try {
    // Check if email already exists
    $checkStmt = $conn->prepare("SELECT id FROM users WHERE email = :email LIMIT 1");
    $checkStmt->bindParam(':email', $email);
    $checkStmt->execute();

    if ($checkStmt->rowCount() > 0) {
        http_response_code(400);
        echo json_encode(['error' => 'Email already registered']);
        exit();
    }

    // Hash password
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Begin transaction
    $conn->beginTransaction();

    // Insert new user
    $stmt = $conn->prepare("
        INSERT INTO users (name, email, password, role, status, email_verified)
        VALUES (:name, :email, :password, 'user', 'active', FALSE)
    ");

    $stmt->execute([
        ':name' => $name,
        ':email' => $email,
        ':password' => $hashedPassword
    ]);

    $userId = $conn->lastInsertId();

    // Generate verification token
    $verificationToken = bin2hex(random_bytes(32));
    $tokenStmt = $conn->prepare("
        INSERT INTO user_tokens (user_id, token, token_type, expires_at)
        VALUES (:user_id, :token, 'email_verification', DATE_ADD(NOW(), INTERVAL 24 HOUR))
    ");

    $tokenStmt->execute([
        ':user_id' => $userId,
        ':token' => $verificationToken
    ]);

    // Commit transaction
    $conn->commit();

    // Get the created user (without password)
    $userStmt = $conn->prepare("
        SELECT id, name, email, role, status, created_at
        FROM users
        WHERE id = :id
    ");
    $userStmt->execute([':id' => $userId]);
    $user = $userStmt->fetch();

    // Send success response
    echo json_encode([
        'success' => true,
        'message' => 'Registration successful. Please check your email for verification.',
        'user' => $user,
        'verification_token' => $verificationToken, // In production, send this via email instead
        'redirect' => '/login'
    ]);

} catch(PDOException $e) {
    // Rollback transaction on error
    if ($conn->inTransaction()) {
        $conn->rollBack();
    }

    http_response_code(500);
    echo json_encode([
        'error' => handle_db_error($e),
        'redirect' => '/signup'
    ]);
}
?>