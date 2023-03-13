<?php
$data ="";
$forms_data = [];
if ($_SERVER['REQUEST_URI'] === '/')
	$data="Hello World";
if ($_SERVER['REQUEST_URI'] === '/feedback') {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $feedback = [
            'name' => $_POST['name'],
            'email' => $_POST['email'],
            'feedback' => $_POST['feedback'],
        ];
        array_push($forms_data, $feedback);
        $data = "Your feedback submitted successfully.".json_encode($forms_data);
    }
}
echo $data;
