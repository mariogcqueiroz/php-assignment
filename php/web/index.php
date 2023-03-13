<?php
$data ="";
$forms_data = [];
if ($_SERVER['REQUEST_URI'] === '/')
	$data="Hello World";
if ($_SERVER['REQUEST_URI'] === '/feedback') {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
        $message = $_POST['feedback'];
        $feedback = [
            'name' => $_POST['name'],
            'email' => $email,
            'feedback' => $message,
        ];
        array_push($forms_data, $feedback);
        $data = "Your feedback submitted successfully.";
    }
}
echo $data;
