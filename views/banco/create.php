<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var $model app\models\Banco
 */
$this->title = 'Adicionar Banco';
?>
<div class="banco-create">
    <div class="body-content">
        <h1 class="display-4"> <?=HTML::encode($this->title) ?></h1>
        <?php
            $form= ActiveForm::begin();
            echo $form->field($model,'nome')->textInput();
            echo $form->field($model,'numero')->textInput();
            echo HTML::submitButton('Save',[
                'class' =>'btn btn-success'
            ]);
            ActiveForm::end();
        ?>

    </div>
</div>
