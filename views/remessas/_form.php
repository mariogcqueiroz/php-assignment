<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Remessas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="remessas-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emissao')->textInput() ?>

    <?= $form->field($model, 'arquivo')->fileInput() ?>

    <?= $form->field($model, 'conta_corrente_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
