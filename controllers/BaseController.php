<?php

namespace app\controllers;

use yii\filters\VerbFilter;

class BaseController extends \yii\web\Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'ghost-access'=> [
                    'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
                ],
            ]
        );
    }
}