<?php

namespace app\controllers;

use app\models\Banco;
use app\models\BancoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * BancoController implements the CRUD actions for Banco model.
 */
class BancoController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Banco models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new BancoSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Banco model.
     * @param int $id ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Banco model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Banco();
        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save() ) {
                return $this->redirect(['view', 'id' => $model->id]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    public function actionCreate2()
    {
        $model = new Banco();
        if ($this->request->isPost) {
            if ($model->load($this->request->post())  ) {
                $db = new \PDO("pgsql:host=db;dbname=easysell", 'app', 'app2022');

                //asdasd',12312 ); drop table auditlog; select ('a
                $sql = "insert into banco(nome,numero,ispb)
                  values( '$model->nome','$model->numero',$model->ispb) ";

                $db->exec($sql);
                //Maneira correta de se usar constultas customizadas
                /*
                $connection = \Yii::$app->db;
                $connection->createCommand("insert into banco(nomeq,numero,ispb )
                values( :nome,:numero,:ispb)")
                    ->bindValue(':nome', $model->nome)
                    ->bindValue(':numero', $model->numero)
                    ->bindValue(':ispb', $model->ispb)
                    ->execute();*/
                $model= Banco::findone(['numero'=>$model->numero]);
                return $this->redirect(['view', 'id' => $model->id]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }


    /**
     * Updates an existing Banco model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Banco model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Banco model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return Banco the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Banco::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
