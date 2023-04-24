<?php

use yii\db\Migration;

/**
 * Handles adding columns to table `{{%feedback}}`.
 */
class m230417_150559_add_idade_column_to_feedback_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%feedback}}', 'idade', $this->integer());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropColumn('{{%feedback}}', 'idade');
    }
}
