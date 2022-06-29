<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ContaCorrente */

$this->title = 'CADASTRO - CONTA CORRENTE';
$this->params['breadcrumbs'][] = ['label' => 'Conta Corrente'];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="conta-corrente-update">
    <div class="conta-corrente-form panel panel-info col-md-offset-3 col-md-6">
        <div class="panel-heading row">CADASTRO DE CONTA CORRENTE</div>
        <div class="panel-body">
            <?= $this->render('_form', [
                'model' => $model,
                'modelsContato' => $modelsContato,
            ]) ?>

            <hr>

            <?php
            echo $this->render('_listContas', [
                'dataProvider' => $dataProvider,
                'model' => $model,
            ]);
            ?>
        </div>
    </div>
</div>
