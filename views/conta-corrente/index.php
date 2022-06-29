<?php

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

use yii\helpers\Html;
use kartik\export\ExportMenu;
use kartik\grid\GridView;

$this->title = 'Conta Corrente';
$this->params['breadcrumbs'][] = $this->title;
$search = "$('.search-button').click(function(){
	$('.search-form').toggle(1000);
	return false;
});";
$this->registerJs($search);
?>
<div class="conta-corrente-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Conta Corrente', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php 
        foreach (Yii::$app->session->getAllFlashes() as $key => $message){
            echo '<div class="alert alert-', $key.'">'.$message."</div>\n";
        }
    ?>

<?php 
    $gridColumn = [
       //['class' => 'yii\grid\SerialColumn'],
        ['attribute' => 'id', 'visible' => false],
        [
                'attribute' => 'id_agencia_bancaria',
                'label' => 'Id Agencia Bancaria',
                'value' => function($model){
                    if($model->id_agencia_bancaria!=NULL){
                        return $model->agenciaBancaria->nome_agencia;
                    }else{
                        return NULL;
                    }
                },
                'filterType' => GridView::FILTER_SELECT2,
                'filter' => \yii\helpers\ArrayHelper::map(\app\models\AgenciaBancaria::find()->asArray()->orderBy('nome_agencia')->all(), 'id', "nome_agencia"),
                'filterWidgetOptions' => [
                    'pluginOptions' => ['allowClear' => true],
                ],
                'filterInputOptions' => ['placeholder' => 'Agência Bancária', 'id' => 'grid--id_agencia_bancaria']
            ],
        [
                'attribute' => 'tipo',
                'label' => 'Tipo',
                'value' => function($model){
                    if($model->tipo!=NULL){
                        return $model->tipo0->{\app\models\CdComplementares::representingColumn()};
                    }else{
                        return NULL;
                    }
                },
                'filterType' => GridView::FILTER_SELECT2,
                'filter' => \yii\helpers\ArrayHelper::map(\app\models\CdComplementares::find()->asArray()->orderBy(\app\models\CdComplementares::representingColumn())->all(), 'id', \app\models\CdComplementares::representingColumn()),
                'filterWidgetOptions' => [
                    'pluginOptions' => ['allowClear' => true],
                ],
                'filterInputOptions' => ['placeholder' => 'Cd complementares', 'id' => 'grid--tipo']
            ],
        [
                'attribute' => 'aplicacao',
                'label' => 'Aplicacao',
                'value' => function($model){
                    if($model->aplicacao!=NULL){
                        return $model->aplicacao0->{\app\models\CdComplementares::representingColumn()};
                    }else{
                        return NULL;
                    }
                },
                'filterType' => GridView::FILTER_SELECT2,
                'filter' => \yii\helpers\ArrayHelper::map(\app\models\CdComplementares::find()->asArray()->orderBy(\app\models\CdComplementares::representingColumn())->all(), 'id', \app\models\CdComplementares::representingColumn()),
                'filterWidgetOptions' => [
                    'pluginOptions' => ['allowClear' => true],
                ],
                'filterInputOptions' => ['placeholder' => 'Cd complementares', 'id' => 'grid--aplicacao']
            ],
        'n_conta:ntext',
        [
            'class' => 'petersonsilva\easyiigii\extensions\ActionColumn',
        ],
    ]; 
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => $gridColumn,
        'pjax' => true,
        'pjaxSettings' => ['options' => ['id' => 'kv-pjax-container-conta-corrente']],
        'panel' => [
            'type' => GridView::TYPE_PRIMARY,
            'heading' => '<span class="glyphicon glyphicon-book"></span>  ' . Html::encode($this->title),
        ],
        'export' => false,
        // your toolbar can include the additional full export menu
        'toolbar' => [
            '{export}',
            ExportMenu::widget([
                'dataProvider' => $dataProvider,
                'columns' => $gridColumn,
                'target' => ExportMenu::TARGET_BLANK,
                'fontAwesome' => true,
                'dropdownOptions' => [
                    'label' => 'Full',
                    'class' => 'btn btn-default',
                    'itemsBefore' => [
                        '<li class="dropdown-header">Export All Data</li>',
                    ],
                ],
                'exportConfig' => [
                    ExportMenu::FORMAT_PDF => false
                ]
            ]) ,
        ],
    ]); ?>

</div>
