<?php
session_start(); // Start the session


session_destroy();

// Redirect to login page
header('Location: first_task_signin.php');
exit(); // Ensure no further code is executed
?>
