<?php

use yii\db\Migration;

/**
 * Handles adding columns to table `{{%banco}}`.
 */
class m220420_110028_add_ispb_column_to_banco_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%banco}}',
            'ispb', $this->integer());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropColumn('{{%banco}}', 'ispb');
    }
}
