<?php

$DBHOST = "localhost";  
$DBUSER = "root";      
$DBPASS = "";           
$DBNAME = "signup";   

$conn = new mysqli($DBHOST, $DBUSER, $DBPASS, $DBNAME);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>