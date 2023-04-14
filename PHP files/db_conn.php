<?php
$servername = "localhost";
$username = "root";
$password = "Blackboy1";
$dbname = "vetdb";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection Failed " . mysqli_connect_error());
}

// echo "Connected Successfully";