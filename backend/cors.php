<?php
/**
 * CORS Configuration File
 * Include this file at the beginning of your API endpoints to handle CORS
 */

// List of allowed origins (domains)
$allowed_origins = [
    'http://localhost:5173',     // Vite default development server
    'http://localhost:3000',     // Common development port
    'http://127.0.0.1:5173',     // Alternative localhost
    'http://127.0.0.1:3000',     // Alternative localhost
    // Add your production domain when ready
    // 'https://your-production-domain.com'
];

// Get the origin of the request
$origin = $_SERVER['HTTP_ORIGIN'] ?? '';

// Check if the origin is in the allowed list
if (in_array($origin, $allowed_origins)) {
    header("Access-Control-Allow-Origin: $origin");
    header('Access-Control-Allow-Credentials: true');
} else {
    // Optionally, you can block or allow all origins for development
    header('Access-Control-Allow-Origin: *');
}

// Set common CORS headers
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
header('Access-Control-Max-Age: 86400');    // Cache preflight request for 24 hours

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Function to check if request is from allowed origin
function is_allowed_origin() {
    global $allowed_origins;
    $origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
    return in_array($origin, $allowed_origins);
}

// Function to get allowed origins (useful for debugging)
function get_allowed_origins() {
    global $allowed_origins;
    return $allowed_origins;
}
?>