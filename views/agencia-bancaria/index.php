<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AgenciaBancariaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Agencia Bancarias';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="agencia-bancaria-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Agencia Bancaria', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'id_banco',
            'endereco:ntext',
            'fone',
            'tipo',
            //'fone1',
            //'tipo1',
            //'agencia:ntext',
            //'nome_agencia:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, AgenciaBancaria $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
