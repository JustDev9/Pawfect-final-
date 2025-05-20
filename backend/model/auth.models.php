<?php

interface IAuthModels {
    public function login($email, $password);
    // public function verifyAuthToken();
    // public function cleanupExpiredTokens();
    // public function getUserIdFromToken($token);
    // public function generateAuthToken($userId);
    // public function validateAuthToken($token);
}

class AuthModels implements IAuthModels {
    private $pdo;
    private $glb;

    public function __construct($pdo, $glb) {
        $this->pdo = $pdo;
        $this->glb = $glb;
    }

    public function login($email, $password) {
        try {
            // Check if user exists
           
            // logic for login...

            return $this->glb->responsePayload(['token' => 'dummy_token'], 'success', 'Login successful', 200);
        } catch (PDOException $e) {
            return $this->glb->responsePayload([], 'error', 'Database error: ' . $e->getMessage(), 500);
        }
    }
}