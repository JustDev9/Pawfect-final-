<?php 
// use Models\AuthModels;

header("Access-Control-Allow-Origin: http://localhost:5173");
header("Content-Type: application/json; charset=utf-8");
header("Access-Control-Allow-Methods: GET,POST,PUT,PATCH,DELETE,OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-Requested-With, Authorization"); 
header("Access-Control-Max-Age: 86400");
header("Access-Control-Allow-Credentials: true");
date_default_timezone_set("Asia/Manila");
set_time_limit(1000);

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$rootPath = $_SERVER['DOCUMENT_ROOT'];
$apiPath = $rootPath . "/";
require_once($apiPath . "configs/connection.php");
require_once($apiPath . "model/Global.models.php");
require_once($apiPath . "model/lgx.models.php");
require_once($apiPath . "model/auth.models.php");
// require_once($apiPath . 'vendor/autoload.php');

$db = new Connection();
$pdo = $db->connect();

$glb = new GlobalMethods();
$auth = new AuthModels($pdo, $glb);

function verifyTokenAndGetUserId($auth) {
    $authResult = $auth->verifyAuthToken();
    if ($authResult['status']['remarks'] !== 'success') {
        echo json_encode($authResult);
        exit();
    }
    return $authResult['payload']['user_id'];
}


$req = [];
if (isset($_REQUEST['request']))
    $req = explode('/', rtrim($_REQUEST['request'], '/'));
else $req = array("errorcatcher");


// ENDPPOINTS 
switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST':
         if (isset($_GET['login'])) { /* if tatawagin sa frontend it would be 
                                        * const response = await api.post('/login)
                                        */
            try {
                $input = json_decode(file_get_contents('php://input'), true);
                
                // Validate required fields
                if (!isset($input['email'], $input['password'])) {
                    throw new Exception("Missing credentials");
                }
        
                // Sanitize inputs
                $email = $input['email'];
                $password = $input['password'];

                if (empty($email) || empty($password)) {
                    throw new Exception("Email and password cannot be empty");
                }
        
                // Call auth login
                $result = $auth->login($email, $password);
                echo json_encode($result);
        
            } catch (Exception $e) {
                echo json_encode($glb->responsePayload(
                    null,
                    "error",
                    $e->getMessage(),
                    400
                ));
            }
        }
        break;
    case 'GET':
        break;
    case 'PUT':
        break;
    case 'PATCH':
        break;
    case 'DELETE':
        break;
    default:
        $response = $glb->responsePayload([], 'error', 'Invalid request method', 405);
}