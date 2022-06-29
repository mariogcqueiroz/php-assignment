<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\grid\GridView;
use yii\helpers\Url;

$this->title = $model->{$model::representingColumn()};
$this->params['breadcrumbs'][] = ['label' => 'Conta Corrente', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="conta-corrente-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('ALTERAR', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
                    <?= Html::a('SAIR', [Url::to('/')], ['class' => 'btn btn-default'])?>
    </p>

    <?php 
        foreach (Yii::$app->session->getAllFlashes() as $key => $message){
            echo '<div class="alert alert-', $key.'">'.$message."</div>\n";
        }
    ?>

    <div class="row">
<?php 
    $gridColumn = [
        ['attribute' => 'id', 'visible' => false],
        [
            'attribute' => 'id_agencia_bancaria',
            'label' => 'Agência Bancária',
            'value' => function($model){
                if(is_null($model->id_agencia_bancaria)){
                    return '';
                }
                return \app\models\AgenciaBancaria::findOne(['id'=>$model->id_agencia_bancaria])->agencia;
            },
        ],
        [
            'attribute' => 'tipo0.'.\app\models\CdComplementares::representingColumn(),
            'label' => 'Tipo',
        ],
        [
            'attribute' => 'aplicacao0.'.\app\models\CdComplementares::representingColumn(),
            'label' => 'Aplicacao',
        ],
        [
            'attribute' => 'saldo',
            'label' => 'Saldo (R$)',
            'value' => function($model){
                if(is_null($model->saldo)){
                    return '0,00';
                }
                return number_format($model->saldo, 2,',', '.');
            },
        ],
        'n_conta:ntext',
    ];
    echo DetailView::widget([
        'model' => $model,
        'attributes' => $gridColumn
    ]); 
?>

<?php    $query = app\models\ContatoBanco::find()->where(['id_conta_corrente'=> $model->id])->indexBy('id_conta_corrente');
    $dataProvider = new yii\data\ActiveDataProvider([
        'query' => $query,
        'pagination' => [
            'pagesize' => 10
        ]
    ]);

    $form = kartik\widgets\ActiveForm::begin(['action'=>Url::to(['contato-banco/batchupdate','id'=>$model->id,'return'=>'conta-corrente'])]);

    echo kartik\builder\TabularForm::widget([
        'dataProvider'=>$dataProvider,
        'form'=>$form,
        'checkboxColumn'=>false,
        'actionColumn'=>false,
        'attributes'=>[
//            'id'=>[
//            'type'=>kartik\builder\TabularForm::INPUT_STATIC,
//            'label'=>'id',
//            'columnOptions'=>['hAlign'=>GridView::ALIGN_RIGHT, 'width'=>'90px']
//            ],
            'nome'=>[
            'type'=>kartik\builder\TabularForm::INPUT_STATIC,
            'label'=>'nome',
            'columnOptions'=>['hAlign'=>GridView::ALIGN_RIGHT, 'width'=>'90px']
            ],
            'funcao'=>[
            'type'=>kartik\builder\TabularForm::INPUT_STATIC,
            'label'=>'funcao',
            'columnOptions'=>['hAlign'=>GridView::ALIGN_RIGHT, 'width'=>'90px']
            ],
            'fone'=>[
            'type'=>kartik\builder\TabularForm::INPUT_STATIC,
            'label'=>'fone',
            'columnOptions'=>['hAlign'=>GridView::ALIGN_RIGHT, 'width'=>'90px']
            ],
//            'tipo'=>[
//            'type'=>kartik\builder\TabularForm::INPUT_STATIC,
//            'label'=>'tipo',
//            'columnOptions'=>['hAlign'=>GridView::ALIGN_RIGHT, 'width'=>'90px']
//            ],
            'email'=>[
            'type'=>kartik\builder\TabularForm::INPUT_STATIC,
            'label'=>'email',
            'columnOptions'=>['hAlign'=>GridView::ALIGN_RIGHT, 'width'=>'90px']
            ],
//            'id_conta_corrente'=>[
//            'type'=>kartik\builder\TabularForm::INPUT_STATIC,
//            'label'=>'id_conta_corrente',
//            'columnOptions'=>['hAlign'=>GridView::ALIGN_RIGHT, 'width'=>'90px']
//            ],
//            'id_agencia_bancaria'=>[
//            'type'=>kartik\builder\TabularForm::INPUT_STATIC,
//            'label'=>'id_agencia_bancaria',
//            'columnOptions'=>['hAlign'=>GridView::ALIGN_RIGHT, 'width'=>'90px']
//            ],
        ],
        'gridSettings'=>[
            'floatHeader'=>true,
            'panel'=>[
                'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-book"></i>ContatoBanco</h3>',
                'type' => GridView::TYPE_PRIMARY,
            ]
        ]
    ]);

    kartik\widgets\ActiveForm::end();

?>
    </div>
</div>
