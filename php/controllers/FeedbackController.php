<?php

require_once __DIR__."/../models/Feedback.php";

class FeedbackController
{
    public function create(){
        $feedback= New Feedback;
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $feedback->nome=$_POST['name'];
            $feedback->email=$_POST['email'];
            $feedback->feedback= $_POST['feedback'];
            if ($feedback->validate()) {
                $feedback->save();
                //redirect
            } else {
                $error['email'] = "Email deve conter @";
            }
        }else {
            $error['email']="";
        }
        include("../views/feedback/feedback.php");
    }
    public function view(){
        $feedback= New Feedback;


    }
}
