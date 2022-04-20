<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\AgenciaBancariaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="agencia-bancaria-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'id_banco') ?>

    <?= $form->field($model, 'endereco') ?>

    <?= $form->field($model, 'fone') ?>

    <?= $form->field($model, 'tipo') ?>

    <?php // echo $form->field($model, 'fone1') ?>

    <?php // echo $form->field($model, 'tipo1') ?>

    <?php // echo $form->field($model, 'agencia') ?>

    <?php // echo $form->field($model, 'nome_agencia') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
