<?php

namespace app\controllers;

use app\models\AgenciaBancaria;
use app\models\ContatoBanco;
use Yii;
use app\models\ContaCorrente;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Json;

/**
 * ContaCorrenteController implements the CRUD actions for ContaCorrente model.
 */
class ContaCorrenteController extends Controller
{
    /**
     * @return array
     */
    public function behaviors()
    {
        return [
            'ghost-access' => [
                'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Procura as agências cadastradas no banco passado em 'parents'.
     * Retorna um json com a agência selecionada.
     * Se 'parents' for nulo, retorna as agências do banco 1.
     *
     * @return string
     */
    public function actionAgencias()
    {
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $parents = $_POST['depdrop_parents'];
            if ($parents != NULL) {
                $banco_id = $parents[0];
                $out = AgenciaBancaria::find()->where(['id_banco' => $banco_id])->select(['id', "(case when nome_agencia = '' then agencia else nome_agencia end) as name"])->asArray()->all();

                return Json::encode(['output' => $out, 'selected' => '']);
            }
        }
        $out = AgenciaBancaria::find()->where(['id_banco' => 1])->select(['id', 'nome_agencia as name'])->asArray()->all();
        return Json::encode(['output' => $out, 'selected' => '']);
    }

    /**
     * Busca as informações da conta salvas no banco de dados.
     *
     * @param $id
     * @return string
     * @throws \yii\db\Exception
     */
    public function actionDadosConta($id)
    {
        $connection = \Yii::$app->db;
            $results = $connection->createCommand("select fc.numero as fc_numero, conta_corrente.n_conta, b.numero || ' - '::TEXT || b.nome as nome_banco, (case when ab.nome_agencia = '' then ab.agencia else ab.nome_agencia end) as nome_agencia, cc.nome as nome_aplicacao,
                  pdc.descricao from conta_corrente left join agencia_bancaria ab on conta_corrente.id_agencia_bancaria = ab.id
                  left join banco b on ab.id_banco = b.id left join cd_complementares cc on conta_corrente.aplicacao = cc.id
                  left join plano_de_contas pdc on conta_corrente.contabil = pdc.id 
                  left join folhas_cheque fc on fc.\"id_contaCorrente\" = :conta_corrente
                  where conta_corrente.id = :conta_corrente and fc.usado = false order by fc_numero", [
            ':conta_corrente' => $id,
        ])->queryAll();
        if(!isset($results[0])){
            $results = $connection->createCommand("select conta_corrente.n_conta, b.numero || ' - '::TEXT || b.nome as nome_banco, (case when ab.nome_agencia = '' then ab.agencia else ab.nome_agencia end) as nome_agencia, cc.nome as nome_aplicacao,
              pdc.descricao from conta_corrente left join agencia_bancaria ab on conta_corrente.id_agencia_bancaria = ab.id
              left join banco b on ab.id_banco = b.id left join cd_complementares cc on conta_corrente.aplicacao = cc.id
              left join plano_de_contas pdc on conta_corrente.contabil = pdc.id 
              where conta_corrente.id = :conta_corrente", [
                ':conta_corrente' => $id,
            ])->queryAll();
        }
        return Json::encode($results[0]);
    }

    /**
     * Retorna o saldo em conta corrente
     * @param $id
     * @return float|mixed|null
     */
    public function actionGetSaldo($id)
    {
        $conta = ContaCorrente::find()->where(['id'=>$id])->one();
        if ($conta){
            return $conta->saldo;
        }else{
            return null;
        }
    }

    /**
     * Lists all ContaCorrente models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => ContaCorrente::find(),
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ContaCorrente model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new ContaCorrente model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     * @throws \yii\db\Exception
     */
    public function actionCreate()
    {
        $modelCustomer = new ContaCorrente();
        $dataProvider = new ActiveDataProvider([
            'query' => ContaCorrente::find(),
        ]);
        /**
         *
         */
        $modelsContato = [new ContatoBanco()];

        if ($modelCustomer->load(Yii::$app->request->post())) {
            $modelsContato = ContaCorrente::createMultiple(ContatoBanco::classname());
            ContaCorrente::loadMultiple($modelsContato, Yii::$app->request->post());

            // validate all models
            $valid = $modelCustomer->validate();
            $valid = ContaCorrente::validateMultiple($modelsContato) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();

                try {
                    if ($flag = $modelCustomer->save(false)) {
                        foreach ($modelsContato as $modelAddress) {
                            $modelAddress->id_conta_corrente = $modelCustomer->id;
                            $modelAddress->tipo = 2;
                            if (!($flag = $modelAddress->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }

                    if ($flag) {
                        $transaction->commit();
                        Yii::$app->getSession()->setFlash('success', 'Conta corrente cadastrada com sucesso!');
                        return $this->redirect(['create']);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
        }
        /**
         *
         */

        return $this->render('create', [
            'model' => $modelCustomer,
            'dataProvider' => $dataProvider,
            'modelsContato' => (empty($modelsContato)) ? [new ContatoBanco()] : $modelsContato
        ]);
    }

    /**
     * Updates an existing ContaCorrente model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException
     * @throws \yii\db\Exception
     */
    public function actionUpdate($id)
    {
        $modelCustomer = $this->findModel($id);
        $dataProvider = new ActiveDataProvider([
            'query' => ContaCorrente::find(),
        ]);
        /**
         *
         */
        $modelsContato = $modelCustomer->contatoBancos;

        if ($modelCustomer->load(Yii::$app->request->post())) {

            $oldIDs = ArrayHelper::map($modelsContato, 'id', 'id');
            $modelsContato = ContaCorrente::createMultiple(ContatoBanco::classname(), $modelsContato);
            ContaCorrente::loadMultiple($modelsContato, Yii::$app->request->post());
            $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($modelsContato, 'id', 'id')));

            // validate all models
            $valid = $modelCustomer->validate();
            $valid = ContaCorrente::validateMultiple($modelsContato) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $modelCustomer->save(false)) {
                        if (!empty($deletedIDs)) {
                            ContatoBanco::deleteAll(['id' => $deletedIDs]);
                        }
                        foreach ($modelsContato as $modelContato) {
                            $modelContato->id_conta_corrente = $modelCustomer->id;
                            $modelContato->tipo = 2;
                            if (!($flag = $modelContato->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        Yii::$app->getSession()->setFlash('success', 'Conta corrente atualizada com sucesso!');
                        return $this->redirect(['create']);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
        } else {
            $agencia = AgenciaBancaria::findOne(['id' => $modelCustomer->id_agencia_bancaria]);
            $modelCustomer->banco = ((!empty($agencia) && $agencia->id_banco != null)
                ? $agencia->id_banco
                : null);
        }
        /**
         *
         */
        return $this->render('update', [
            'model' => $modelCustomer,
            'modelsContato' => (empty($modelsContato)) ? [new ContatoBanco()] : $modelsContato,
            'dataProvider' => $dataProvider,
        ]);

    }

    /**
     * Deletes an existing ContaCorrente model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException
     * @throws \Throwable
     * @throws \yii\db\StaleObjectException
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        return $this->redirect(['index']);
    }

    /**
     * Finds the ContaCorrente model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ContaCorrente the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ContaCorrente::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}