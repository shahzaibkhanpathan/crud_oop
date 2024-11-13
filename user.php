
<!-- In this example,
 Car is a class with
 two properties (color and model) and
 two methods (startEngine and stopEngine). -->
<?php
// User.php
class User {
    
    private $db;
    
    public function __construct($conn) {  
        $this->db = $conn;  
    }
    
    // Register new user in the database
    public function register($fname, $lname, $email, $pass) {  
        $passHash = password_hash($pass, PASSWORD_BCRYPT);
        

         // Prepare a query to check if email already exists
    //  $query = $conn->prepare("SELECT id FROM users WHERE email = ?");
    //  $query->bind_param("s", $email);
    //  $query->execute();
    //  $query->store_result();
 
    //  if ($query->num_rows > 0) {
    //      // Email already exists
    //      $msg = "<div class='alert alert-danger'>This email is already registered.</div>";
    //  } else {

        $stmt = $this->db->prepare("INSERT INTO users(first_name, last_name, email, password) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $fname, $lname, $email, $passHash);
        
        if ($stmt->execute()) {
            return true;
        } else {
            return $stmt->error;
        }
    // }
}
    
    // Look for existing user in the database
    
    public function login($email, $pass) {
    $stmt = $this->db->prepare("SELECT password FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($passHash);
        $stmt->fetch();
        
        if (password_verify($pass, $passHash)) {
            $_SESSION['user_email'] = $email;
            return true;
        } else {
            return false; // Simply return false for login failure
        }
    } else {
        return false; // Email not registered, return false
    }
}

    
    // Check if user is logged in
    public function isLoggedIn() {
        return isset($_SESSION['user_email']);
    }
    
    // Redirect to a different page
    public function redirect($url) {
        header("Location: $url");
        exit();
    }
    
    // Logout user
    public function logout() {
        session_start();
        $_SESSION = array();
        session_destroy();
        $this->redirect('index.php');
    }
}
?>
