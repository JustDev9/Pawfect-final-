<?php

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');     
define('DB_PASSWORD', '');       
define('DB_NAME', 'pawfect_db'); 
class Connection
{
    protected $con_string = "mysql:host=" . DB_SERVER . ";dbname=" . DB_NAME . "; charset=utf8mb4";
    protected $options = [
        \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
        \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
        \PDO::ATTR_EMULATE_PREPARES => false
    ];

    public function connect()
    {
        try {
            return new \PDO($this->con_string, DB_USERNAME, DB_PASSWORD, $this->options);
        } catch (\PDOException $e) {
            echo $e->getMessage();
        }
    }
}