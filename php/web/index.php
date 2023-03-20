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
        if ( strpos($feedback['email'],"@") ){
            $data = "Your feedback submitted successfully.".json_encode($forms_data);
                $db = new \PDO("pgsql:host=host.docker.internal;dbname=guia;port=5439",
                    'guia', 'guia2020');
                $sql = "insert into feedback(nome,email,feedback)
                  values( '".$feedback['name']."','".$feedback['email'].
                    "','".$feedback['feedback']."') ";
                $db->exec($sql);
        }
        else {
            $error['email']="Email deve conter @";
            include("../feedback.php");
        }

    }else {
        $feedback = [
            'name' => "",
            'email' => "",
            'feedback' => "",
        ];
        $error['email']="";
        include("../feedback.php");
    }
}
echo $data;
