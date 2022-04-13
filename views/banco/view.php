<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var $model app\models\Banco
 */
$this->title = $model->nome;
?>
<div class="banco-view">
    <div class="body-content">
        <h4 class="display-4"> <?=HTML::encode($this->title) ?></h4>
    <?= \yii\widgets\DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id','nome','numero'
        ]
    ])
    ?>

    </div>
</div>
