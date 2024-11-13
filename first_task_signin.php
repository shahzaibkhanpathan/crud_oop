<?php
session_start();
require_once('connection.php');
require_once('User.php');

$user = new User($conn);

// Variable to hold error message
$errorMessage = '';

if (isset($_POST['signin'])) {
    $email = $_POST['email'];
    $pass = $_POST['password'];
    
    // Attempt login and capture result
    $login = $user->login($email, $pass);
    
    if ($login === true) {
        // Successful login
        $_SESSION['userEmail'] = $email;
        
        // Retrieve user's first name from the database
        $stmt = $conn->prepare("SELECT first_name FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($firstName);
        $stmt->fetch();
        
        // Store first name in session
        $_SESSION['FirstName'] = $firstName;
        
        $user->redirect('first_task_welcome.php');
    } else {
        // Login failed, store appropriate error message
        $errorMessage = "<div class='alert alert-danger'>Invalid email or password</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    form{
        border-radius:15px;
        height:450px;
        width:400px;
    }
    .form-control{
        border-radius:150px;
    }
  
</style>
</head>
<body>
    <form action="first_task_signin.php" method="post" class="border m-auto mt-5 mb-5 p-3">
        <h2 class="text-center">Signin Form</h2>
        
        <?php if ($errorMessage): ?>
            <?php echo $errorMessage; ?>
        <?php endif; ?>
        
        <label><b>Email</b></label>
        <input type="email" name="email" class="form-control" required />
        
        <label><b>Password</b></label>
        <input type="password" name="password" class="form-control" required />
        
        <input type="submit" name="signin" class="btn btn-primary form-control mt-3" value="Signin" />
        
        <p class="text-center mt-3">Don't have an account? <a href="first_task_signup.php" class="text-decoration-none">Register</a></p>
    </form>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
