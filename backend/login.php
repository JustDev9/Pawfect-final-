<?php
require_once 'cors.php';
require_once 'db.php';

// Only allow POST requests for login
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Method not allowed']);
    exit();
}

// Set content type for JSON response
header('Content-Type: application/json');

// Get JSON data from request body
$data = json_decode(file_get_contents('php://input'), true);

// Improved validation
if (empty($data['email']) || empty($data['password']) || !filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode(['error' => 'Valid email and password are required']);
    exit();
}

// Sanitize input
$email = sanitize_input(trim($data['email']));
$password = trim($data['password']);

try {
    // Prepare SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT id, email, password, name, role, status FROM users WHERE email = :email LIMIT 1");
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    if ($stmt->rowCount() === 1) {
        $user = $stmt->fetch();

        // Check if account is active
        if ($user['status'] !== 'active') {
            http_response_code(403);
            echo json_encode([
                'error' => 'Account is not active. Please contact support.',
                'redirect' => '/login'
            ]);
            exit();
        }

        // Verify password
        if (password_verify($password, $user['password'])) {
            // Password is correct, create session
            session_start();
            session_regenerate_id(true); // Prevent session fixation

            // Remove sensitive data before sending response
            unset($user['password']);

            // Set session variables
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_email'] = $user['email'];
            $_SESSION['user_role'] = $user['role'];

            // Generate token
            $token = bin2hex(random_bytes(32));

            // Store token in database
            $tokenStmt = $conn->prepare("INSERT INTO user_tokens (user_id, token, token_type, expires_at) VALUES (:user_id, :token, 'auth', DATE_ADD(NOW(), INTERVAL 24 HOUR))");
            $tokenStmt->execute([
                ':user_id' => $user['id'],
                ':token' => $token
            ]);

            // Log successful login
            $ip = $_SERVER['REMOTE_ADDR'];
            $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
            $logStmt = $conn->prepare("INSERT INTO login_history (user_id, email, ip_address, user_agent, status) VALUES (:user_id, :email, :ip, :user_agent, 'success')");
            $logStmt->execute([
                ':user_id' => $user['id'],
                ':email' => $email,
                ':ip' => $ip,
                ':user_agent' => $userAgent
            ]);

            // Update last login
            $updateStmt = $conn->prepare("UPDATE users SET last_login = NOW() WHERE id = :user_id");
            $updateStmt->execute([':user_id' => $user['id']]);

            // Determine redirect based on user role
            $redirect = '/home'; // Default redirect
            if ($user['role'] === 'admin') {
                $redirect = '/admin';
            } elseif ($user['role'] === 'staff') {
                $redirect = '/staff/dashboard';
            }

            // Send success response with redirect information
            echo json_encode([
                'success' => true,
                'message' => 'Login successful',
                'user' => $user,
                'token' => $token,
                'redirect' => $redirect
            ]);
        } else {
            // Log failed login attempt
            $ip = $_SERVER['REMOTE_ADDR'];
            $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
            $logStmt = $conn->prepare("INSERT INTO login_history (email, ip_address, user_agent, status) VALUES (:email, :ip, :user_agent, 'failed')");
            $logStmt->execute([
                ':email' => $email,
                ':ip' => $ip,
                ':user_agent' => $userAgent
            ]);

            // Password is incorrect
            http_response_code(401);
            echo json_encode([
                'error' => 'Invalid email or password',
                'redirect' => '/login'
            ]);
        }
    } else {
        // Log failed login attempt
        $ip = $_SERVER['REMOTE_ADDR'];
        $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
        $logStmt = $conn->prepare("INSERT INTO login_history (email, ip_address, user_agent, status) VALUES (:email, :ip, :user_agent, 'failed')");
        $logStmt->execute([
            ':email' => $email,
            ':ip' => $ip,
            ':user_agent' => $userAgent
        ]);

        // User not found
        http_response_code(401);
        echo json_encode([
            'error' => 'Invalid email or password',
            'redirect' => '/login'
        ]);
    }
} catch(PDOException $e) {
    http_response_code(500);
    echo json_encode([
        'error' => handle_db_error($e),
        'redirect' => '/login'
    ]);
} catch(Exception $e) {
    http_response_code(500);
    echo json_encode([
        'error' => 'Server error. Please try again later.',
        'redirect' => '/login'
    ]);
}
?>