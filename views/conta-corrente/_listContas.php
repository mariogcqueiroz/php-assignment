<?php
/**
 * Created by PhpStorm.
 * User: peterson
 * Date: 18/01/19
 * Time: 15:42
 */

use kartik\grid\GridView;
use yii\helpers\Html;
use yii\helpers\Url;

?>

<h5 class="text-center">
    <b>CONTAS CORRENTES CADASTRADAS</b>
</h5>

<?php
$gridColumn = [
   //['class' => 'yii\grid\SerialColumn'],
    ['attribute' => 'id', 'visible' => false],
    [
        'label' => 'Banco',
        'value' => function ($model) {
            if ($model->id_agencia_bancaria != NULL) {
                return $model->agenciaBancaria->banco->nome;
            } else {
                return NULL;
            }
        },
    ],
    'n_conta:ntext',
    [
        'attribute' => 'id_agencia_bancaria',
        'value' => function ($model) {
            if ($model->id_agencia_bancaria != NULL) {
                return (!empty($model->agenciaBancaria->nome_agencia))
                    ? $model->agenciaBancaria->nome_agencia
                    : $model->agenciaBancaria->agencia;
            } else {
                return NULL;
            }
        },
        'filterType' => GridView::FILTER_SELECT2,
        'filter' => \yii\helpers\ArrayHelper::map(\app\models\AgenciaBancaria::find()->asArray()->orderBy('nome_agencia')->all(), 'id','nome_agencia'),
        'filterWidgetOptions' => [
            'pluginOptions' => ['allowClear' => true],
        ],
        'filterInputOptions' => ['placeholder' => 'Agência Bancária', 'id' => 'grid--id_agencia_bancaria']
    ],
    [
        'attribute' => 'tipo',
        'value' => function ($model) {
            if ($model->tipo != NULL) {
                return $model->tipo0->{\app\models\CdComplementares::representingColumn()};
            } else {
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
        'value' => function ($model) {
            if ($model->aplicacao != NULL) {
                return $model->aplicacao0->{\app\models\CdComplementares::representingColumn()};
            } else {
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
];
?>
<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => $gridColumn,
    'export' => false,
]); ?>
