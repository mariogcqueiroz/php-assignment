<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AgenciaBancaria */

$this->title = 'Create Agencia Bancaria';
$this->params['breadcrumbs'][] = ['label' => 'Agencia Bancarias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="agencia-bancaria-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
