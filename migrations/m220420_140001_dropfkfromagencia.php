<?php

use yii\db\Migration;

/**
 * Class m220420_140001_dropfkfromagencia
 */
class m220420_140001_dropfkfromagencia extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->dropForeignKey('fk_tipo','agencia_bancaria');
        $this->dropForeignKey('fk_tipo1','agencia_bancaria');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m220420_140001_dropfkfromagencia cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m220420_140001_dropfkfromagencia cannot be reverted.\n";

        return false;
    }
    */
}
