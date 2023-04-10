<?php

use Illuminate\Database\Eloquent\Model;

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
    public $errors=[];
    protected $table = 'feedback';
    public $timestamps = false;
    public function validate(){
        if (strpos($this->email, "@")) {
            return true;
        }else{
            $this->errors['email']="Email deve conter @";
        }
        return false;
    }
}
