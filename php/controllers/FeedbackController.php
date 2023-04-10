<?php

require_once __DIR__."/../models/Feedback.php";

class FeedbackController
{
    public function create(){
        $feedback= New Feedback;
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $feedback->load($POST);
            if ($feedback->validate()) {
                $feedback->save();
                header("Location: /feedback/view/$feedback->id",TRUE,301);
                exit();
            }
        }
        include("../views/feedback/create.php");
    }
    public function view($id){
        $feedback= Feedback::find($id);
        include("../views/feedback/view.php");
    }
}/
