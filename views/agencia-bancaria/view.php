<?php

use webvimark\modules\UserManagement\models\User;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\AgenciaBancaria */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Agencia Bancarias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="agencia-bancaria-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>

        <?php
        if (User::hasPermission("delete_agencia-bancaria"))
        echo Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>



    <?php
    if(  preg_match( '/^(\d{2})(\d{5})(\d{4})$/', $model->fone,  $matches ) )
    {
        $result = '('.$matches[1] . ')' .$matches[2] . '-' . $matches[3];
    }
    echo DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'banconome',
            'endereco:ntext',
            [
                'label' => 'Telefone',
                'value' => $result,
            ],
            'tiponome',
            'fone1',
            'tipo1nome',
            'agencia:ntext',
            'nome_agencia:ntext',
        ],
    ]) ?>

</div>
