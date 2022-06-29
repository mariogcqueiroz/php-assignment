<?php

namespace app\models;

use Yii;

/**
 * Classe model que instancia objetos da tabela "cd_complementares".
 *  Contém as opções padrões do sistema, como tipos de: gêneros,
 *  escolaridades, telefones, estado civil, documentos, entre outros.
 *
 * @property integer $id chave primária da tabela "cd_complementares"
 * @property string $nome valor da opcao (Masculino, Feminino,..)
 * @property string $tipo classificacao da opcao (sexo,escolaridade,...)
 */
class CdComplementares extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nome', 'tipo'], 'required'],
            [['nome', 'tipo'], 'string'],        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_complementares';
    }

    /**
     * @inheritdoc
     */
    public static function representingColumn()
    {
        return 'nome';
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nome' => 'Nome',
            'tipo' => 'Tipo',
        ];
    }
}
