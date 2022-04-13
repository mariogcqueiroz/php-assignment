<?php
use yii\helpers\Html;
/**
 * @var yii\web\View $this
 * @var string $message
 */

$this->title = 'My Yii Application';
?>
<div class="site-index">
    <div class="body-content">
        <h1 class="display-4"> <?=HTML::encode($message) ?></h1>
    </div>
</div>
