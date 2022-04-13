<?php
namespace app\controllers;
use Yii;
use yii\web\Controller;
use app\models\Banco;
use yii\web\NotFoundHttpException;


class BancoController extends Controller
{

    public function actionView($id) {
        $model=Banco::findOne(['id'=>$id]);
        if ($model!=Null){
            return $this->render('view', [
                'model' => $model
            ]);
        }
        throw new NotFoundHttpException
        ('Número do Banco não econtrado');

    }

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
