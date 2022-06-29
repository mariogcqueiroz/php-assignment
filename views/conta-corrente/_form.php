<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use yii\helpers\ArrayHelper;
use app\models\Banco;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use wbraganca\dynamicform\DynamicFormWidget;

/* @var $this yii\web\View */
/* @var $model app\models\ContaCorrente */
/* @var $form yii\widgets\ActiveForm */

$js = '
jQuery(".dynamicform_wrapper").on("afterInsert", function(e, item) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {
        $("#contatobanco-"+index+"-fone").inputmask({ mask: "(99) 9 9999-9999"});
        jQuery(this).html("Contato: " + (index + 1))
    });
});

jQuery(".dynamicform_wrapper").on("afterDelete", function(e) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {
        jQuery(this).html("Contato: " + (index + 1))
    });
});
';

$this->registerJs($js);
?>

<div class="conta-corrente-form">

    <?php $form = ActiveForm::begin(['id' => 'dynamic-form']); ?>

    <?php

    if ($model->banco) {

    }
    $bancos = Banco::getBancosWithAgencias();

    echo Form::widget([
        'model' => $model,
        'form' => $form,
        'columns' => 10,
        'attributes' => [
            'banco' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 7],
                'widgetClass' => '\kartik\widgets\Select2',
                'options' => [
                    'options' => [
                        'id' => 'banco-id',
                        'placeholder' => 'Selecione o banco',
                        'value' => '1',
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    'data' => $bancos,
                ]
            ],
            'id_agencia_bancaria' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 5],
                'widgetClass' => '\kartik\depdrop\DepDrop',
                'options' => [
                    'type' => \kartik\depdrop\DepDrop::TYPE_SELECT2,
                    'data' => (!is_null($model->id_agencia_bancaria)) ?
                        [$model->id_agencia_bancaria =>
                            ((!empty($model->agenciaBancaria->nome_agencia))
                                ? $model->agenciaBancaria->nome_agencia
                                : $model->agenciaBancaria->agencia
                            )]
                        : [''],
                    'options' => [
                        'id' => 'id_agencia_bancaria-id',
                    ],
                    'pluginOptions' => [
                        'depends' => ['banco-id'],
                        'initialize' => true,
                        'placeholder' => 'Selecione a agência',
                        'url' => Url::to(['conta-corrente/agencias']),
                        'params' => ['banco_id'],
                    ]
                ]
            ],
            'tipo' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 4],
                'widgetClass' => '\kartik\widgets\Select2',
                'options' => [
                    'options' => [
                        'placeholder' => 'Selecione o tipo'
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    'data' => \yii\helpers\ArrayHelper::map(\app\models\CdComplementares::find()->orderBy(\app\models\CdComplementares::representingColumn())->where(['tipo' => 'tipo-de-conta-bancaria'])->asArray()->all(), 'id', \app\models\CdComplementares::representingColumn())
                ]
            ],
            'aplicacao' => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 4],
                'widgetClass' => '\kartik\widgets\Select2',
                'options' => [
                    'options' => [
                        'placeholder' => 'Selecione o tipo'
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    'data' => \yii\helpers\ArrayHelper::map(\app\models\CdComplementares::find()->orderBy(\app\models\CdComplementares::representingColumn())->where(['tipo' => 'tipo-de-aplicacao'])->asArray()->all(), 'id', \app\models\CdComplementares::representingColumn())
                ]
            ],
            'n_conta' => ['type' => Form::INPUT_TEXT, 'columnOptions' => ['colspan' => 4]],
        ],
    ]);

    ?>


    <hr>
    <div class="padding-v-md">
        <div class="line line-dashed"></div>
    </div>
    <?php DynamicFormWidget::begin([
        'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
        'widgetBody' => '.container-items', // required: css class selector
        'widgetItem' => '.item', // required: css class
        'limit' => 4, // the maximum times, an element can be cloned (default 999)
        'min' => 1, // 0 or 1 (default 1)
        'insertButton' => '.add-item', // css class
        'deleteButton' => '.remove-item', // css class
        'model' => $modelsContato[0],
        'formId' => 'dynamic-form',
        'formFields' => [
            'nome',
            'funcao',
            'fone',
            'email',
        ],
    ]); ?>
    <div class="row">
        <div class="panel-heading text-center">
            <b><i class="fa fa-envelope"></i> CONTATOS</b>
            <div class="clearfix"></div>
        </div>
        <div class="container-fluid container-items"><!-- widgetContainer -->
            <?php foreach ($modelsContato as $index => $modelContato): ?>
                <div class="item panel panel-default"><!-- widgetBody -->
                    <div class="panel-heading">
                        <span class="panel-title-address">Contato: <?= ($index + 1) ?></span>
                        <button type="button" class="pull-right remove-item btn btn-danger btn-xs"><i
                                    class="fa fa-minus"></i></button>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">

                        <?= Form::widget([
                            'model' => $modelContato,
                            'form' => $form,
                            'columns' => 7,
                            'attributes' => [
                                "[{$index}]nome" => ['type' => Form::INPUT_TEXT, 'columnOptions' => ['colspan' => 7]],
                                "[{$index}]funcao" => ['type' => Form::INPUT_TEXT, 'columnOptions' => ['colspan' => 5]],
                                "[{$index}]fone" => ['type' => Form::INPUT_WIDGET, 'columnOptions' => ['colspan' => 4],
                                    'widgetClass' => '\yii\widgets\MaskedInput',
                                    'options' => [
                                        'name' => 'fone',
                                        'mask' => ['(99) 9999-9999', '(99) 9 9999-9999'],
                                        'clientOptions' => [
                                            'removeMaskOnSubmit' => true,
                                        ]
                                    ],
                                ],
                                "[{$index}]email" => ['type' => Form::INPUT_TEXT, 'columnOptions' => ['colspan' => 8]],
                            ],
                        ]);
                        ?>

                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="text-right">
            <button type="button" class="pull-right add-item btn btn-primary btn-sm"><i class="fa fa-plus"></i>
                Adicionar Contato
            </button>
        </div>
    </div>
    <?php DynamicFormWidget::end(); ?>

    <div class="form-group text-center">
        <?= Html::submitButton($model->isNewRecord ? 'CADASTRAR' : 'ATUALIZAR', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('SAIR', [Url::to('/')], ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
