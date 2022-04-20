<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\AgenciaBancaria */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="agencia-bancaria-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_banco')->textInput() ?>

    <?= $form->field($model, 'endereco')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'fone')->textInput() ?>

    <?= $form->field($model, 'tipo')->textInput() ?>

    <?= $form->field($model, 'fone1')->textInput() ?>

    <?= $form->field($model, 'tipo1')->textInput() ?>

    <?= $form->field($model, 'agencia')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'nome_agencia')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
