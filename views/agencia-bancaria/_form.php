<?php

use app\models\AgenciaBancaria;
use app\models\Banco;
use kartik\builder\Form;
use kartik\form\ActiveForm;
use kartik\select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Banco */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="form">

    <?php $form = ActiveForm::begin();
    $bancos = ArrayHelper::map(
        Banco::find()->orderby('id')->all(),
        'id',
        function ($model){
            if ($model['numero'] ) {
                return $model['numero'] . '-' . $model['nome'];
            }
            return $model['nome'];
        }
    );

    echo Form::widget([
        'model' => $model,
        'form' => $form,
        'columns' => 12,
        'attributes' => [
            'id_banco' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 8],
                'widgetClass' => '\kartik\select2\Select2',
                'options' => [
                    'options' => [
                        'placeholder' => 'Selecione o banco'
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    'data' => $bancos
                ]
            ],
            'agencia' => ['type' => Form::INPUT_TEXT, 'columnOptions' => ['colspan' => 4]],
            'nome_agencia' => ['type' => Form::INPUT_TEXT, 'columnOptions' => ['colspan' => 4]],
            'endereco' => ['type' => Form::INPUT_TEXT, 'columnOptions' => ['colspan' => 8]],
            'fone' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 8],
                'widgetClass' => '\yii\widgets\MaskedInput',
                'options' => [
                    'mask' => ['(99) 9999-9999','(99) 99999-9999'],
                    'clientOptions' => [
                        'removeMaskOnSubmit' => true,
                    ]
                ],
            ],
            'tipo' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 4],
                'widgetClass' => '\kartik\select2\Select2',
                'options' => [
                    'options' => [
                        'placeholder' => 'Selecione o tipo'
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    'data' => AgenciaBancaria::$tipoarray
                ]
            ],
            'fone1' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 8],
                'widgetClass' => '\yii\widgets\MaskedInput',
                'options' => [
                    'name' => 'fone',
                    'mask' => ['(99) 9999-9999','(99) 99999-9999'],
                    'clientOptions' => [
                        'removeMaskOnSubmit' => true,
                    ]
                ],
            ],
            'tipo1' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 4],
                'widgetClass' => '\kartik\select2\Select2',
                'options' => [
                    'options' => [
                        'placeholder' => 'Selecione o tipo'
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    'data' => AgenciaBancaria::$tipoarray
                ]
            ],
        ]]);
    ?>



    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
