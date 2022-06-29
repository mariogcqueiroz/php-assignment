<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\extencoes;

use Yii;

/**
 * Class Download
 * @package app\extencoes
 */
class Download
{
    /**
     * @param $model
     * @param $arquivo
     * Método responsável por permitir o usuário realizar um download
     */
    public function Download($model,$arquivo)
    {
        $file = Yii::getAlias('@webroot').$model->getUploadedFileUrl($arquivo);
        ob_start();
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename=' . basename($file));
        header('Content-Transfer-Encoding: Binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . filesize($file));
        while (ob_get_level()) {
            ob_end_clean();
        }
        readfile($file);
        exit;
    }
}