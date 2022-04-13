<?php
namespace app\controllers;
use Yii;
use yii\web\Controller;
use app\models\Banco;


class BancoController extends Controller
{

    public function actionCreate(){
        $model = new Banco();
        return $this->render('create', [
            'model' => $model
        ]);
    }
}
