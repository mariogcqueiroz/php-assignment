<?php
include_once "../vendor/autoload.php";

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;



$capsule = new Capsule;
$capsule = new Capsule;
$capsule->addConnection([
    "driver" => "pgsql",
    "host" =>"db",
    "database" => "site",
    "username" => "app",
    "password" => "app2022"
]);
$capsule->setAsGlobal();
$capsule->bootEloquent();


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

        if ( strpos($feedback['email'],"@") ){
            $data = "Your feedback submitted successfully.".json_encode($forms_data);

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
