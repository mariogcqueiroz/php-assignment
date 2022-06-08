<?php

use yii\db\Migration;

/**
 * Class m220608_115257_rbac_banco
 */
class m220608_115257_rbac_banco extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->batchInsert('auth_item',['name','type','description'],[
            ['Funcionario',1,'Funcionário'],
        ]);

        $this->batchInsert('auth_item',['name','type','description'],[
            ['listarbanco',2,'listar banco'],
            ['editbanco',2,'edit banco'],
            ['delete_banco',2,'delete banco'],
            ['viewbanco',2,'View banco'],
            ['criarbanco',2,'Criar banco'],
            ['/banco/create',3,''],
            ['/banco/delete',3,''],
            ['/banco/index',3,''],
            ['/banco/update',3,''],
            ['/banco/view',3,''],

            ['listar_agencia-bancaria',2,'listar Agência Bancaria'],
            ['edit_agencia-bancaria',2,'edit Agência Bancaria'],
            ['delete_agencia-bancaria',2,'delete Agência Bancaria'],
            ['view_agencia-bancaria',2,'View Agência Bancaria'],
            ['criar_agencia-bancaria',2,'Criar Agência Bancaria'],
            ['/agencia-bancaria/create',3,''],
            ['/agencia-bancaria/delete',3,''],
            ['/agencia-bancaria/index',3,''],
            ['/agencia-bancaria/update',3,''],
            ['/agencia-bancaria/view',3,''],

        ]);

        $this->batchInsert('auth_item_child',['parent','child'],[
            ['criarbanco','/banco/create'],
            ['listarbanco','/banco/index'],
            ['delete_banco','/banco/delete'],
            ['editbanco','/banco/update'],
            ['viewbanco','/banco/view'],

            ['criar_agencia-bancaria','/agencia-bancaria/create'],
            ['delete_agencia-bancaria','/agencia-bancaria/delete'],
            ['listar_agencia-bancaria','/agencia-bancaria/index'],
            ['edit_agencia-bancaria','/agencia-bancaria/update'],
            ['view_agencia-bancaria','/agencia-bancaria/view'],

            ['Funcionario','criarbanco'],
            ['Funcionario','viewbanco'],
            ['Funcionario','listarbanco'],
            ['Funcionario','editbanco'],


            ['Funcionario','criar_agencia-bancaria'],
            ['Funcionario','view_agencia-bancaria'],
            ['Funcionario','listar_agencia-bancaria'],
            ['Funcionario','edit_agencia-bancaria'],
        ]);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m220608_115257_rbac_banco cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m220608_115257_rbac_banco cannot be reverted.\n";

        return false;
    }
    */
}
