<?php
$path = $_SERVER['REQUEST_URI'];

if ($path == "/app") {
    echo "Hello, Web!\n";
} elseif ($path == "/app/feedback" && $_SERVER['REQUEST_METHOD'] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $feedback = $_POST['feedback'];
    echo "$name $email $feedback";
}
?>
