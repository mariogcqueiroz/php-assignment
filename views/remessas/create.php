<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Remessas */

$this->title = 'Create Remessas';
$this->params['breadcrumbs'][] = ['label' => 'Remessas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="remessas-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
