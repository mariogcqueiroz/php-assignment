<?php
namespace app\controllers;
use Yii;
use yii\web\Controller;
use app\models\Banco;


class BancoController extends Controller
{

    public function actionCreate(){
        $model = new Banco();
        if ($this->request->isPost){
            if( $model->load($this->request->post())) {
                if ($model->save()) {
                    return $this->redirect(['view',
                        'id'=>$model->id] );
                }
            }
        }
        else {
            $model->loadDefaultValues();
        }
        return $this->render('create', [
            'model' => $model
        ]);
    }
}
