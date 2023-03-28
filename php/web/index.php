<?php
include_once "../vendor/autoload.php";

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;

/**
 * Model Feedback.
 *
 * @property int $id
 * @property string $nome
 * @property string $email
 * @property string $feedback
 **/
class Feedback extends Model
{
    protected $table = 'feedback';
    public $timestamps = false;
}

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

        $feedback= New Feedback;
        $feedback->nome=$_POST['name'];
        $feedback->email=$_POST['email'];
        $feedback->feedback= $_POST['feedback'];

        if ( strpos($feedback['email'],"@") ){
            $data = "Your feedback submitted successfully.".json_encode($forms_data);
            $feedback->save();
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
