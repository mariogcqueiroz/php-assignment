<?php
include_once "../vendor/autoload.php";

use Illuminate\Database\Capsule\Manager as Capsule;

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

$params= explode("/", $_SERVER['REQUEST_URI']);
$name = ucfirst($params[1])."Controller";
require_once __DIR__."/../controllers/".$name.".php";
$instance = new $name();
$instance->{$params[2]}($params[3]??null);

