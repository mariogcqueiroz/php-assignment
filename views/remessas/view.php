<?php

use yii\helpers\Html;

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Remessas */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Remessas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="remessas-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'emissao',
            ['label'=>'Projeto da Pesquisa',
                'format'=>'raw',
                'value'=>$model->arquivo?Html::a($model->arquivo,\yii\helpers\Url::to(['remessas/download','id'=>$model->id])):"Arquivo não enviado"
            ],
            'conta_corrente_id',
        ],
    ]) ?>

</div>
