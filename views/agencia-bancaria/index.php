<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AgenciaBancariaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Agencia Bancarias';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="agencia-bancaria-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'panel' => [
            'type' => GridView::TYPE_PRIMARY,
            'heading' => '<i class="glyphicon glyphicon-book"></i> Agências Bancárias',
        ],
        'toolbar' =>  [
            ['content' =>
                Html::a('Adicionar Agência', ['create'], ['class' => 'btn btn-primary'])
            ],
            '{export}',
            '{toggleData}',
        ],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            ['attribute' => 'id_banco',
                'width'=>'400px',
                'filterType'=> GridView::FILTER_SELECT2,
                'filter'=>\yii\helpers\ArrayHelper::map(\app\models\Banco::find()->orderBy('nome')->asArray()->all(), 'id', 'nome'),
                'filterWidgetOptions'=>[
                    'pluginOptions'=>['allowClear'=>true],
                ],
                'filterInputOptions'=>['placeholder'=>'Banco'],
                'value' => function ($model){
                    return $model->banconome ;
                }
            ],
            'endereco:ntext',
            'fone',
            ['attribute'=>'tipo',
                'width'=>'100px',
                'filterType'=>GridView::FILTER_SELECT2,
                'filter'=>\app\models\AgenciaBancaria::$tipoarray,
                'filterWidgetOptions'=>[
                    'pluginOptions'=>['allowClear'=>true],
                ],
                'filterInputOptions'=>['placeholder'=>'Selecione'],
                'value' => function ($model){
                        return $model->tiponome ;
                }

            ],
            //'fone1',
            //'tipo1',
            'agencia:ntext',
            'nome_agencia:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action,  $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
