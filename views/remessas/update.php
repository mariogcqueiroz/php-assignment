<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Remessas */

$this->title = 'Update Remessas: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Remessas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="remessas-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
