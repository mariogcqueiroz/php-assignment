<?php

namespace app\models;

use Yii;

/**
 * Classe model que intancia objetos com dados da tabela "conta_banco".
 *  Contém dados de contatos ligados a uma agência bancária ou a uma conta
 *  corrente, e possuem algum cargo na agência em questão.
 *
 * @property integer $id correspondente a chave primaria de "conta_banco"
 * @property string $nome nome do contato
 * @property string $funcao cargo do contato
 * @property integer $fone numero de telefone do contato
 * @property integer $tipo inteiro referenciando se o contato esta vinculado
 *  a conta corrente (recebe valor 2) ou a agencia bancaria (valor 1)
 * @property string $email endereco eletronico do contato
 * @property integer $id_conta_corrente chave extrangeira referenciando a conta
 *  a qual este contato pertence (caso o tipo seja 2)
 * @property integer $id_agencia_bancaria chave extrangeira referenciando a agencia
 *  a qual este contato pertence (caso o tipo seja 1)
 *
 * @property \app\models\AgenciaBancaria $agenciaBancaria
 * @property \app\models\ContaCorrente $contaCorrente
 */
class ContatoBanco extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nome', 'funcao', 'email'], 'string'],
            [['fone', 'tipo', 'id_conta_corrente', 'id_agencia_bancaria'], 'default', 'value' => null],
            [['tipo', 'id_conta_corrente', 'id_agencia_bancaria'], 'integer'],
            [['email'],'email'],
            [['fone'],'safe'],
            [['id_agencia_bancaria'], 'exist', 'skipOnError' => true, 'targetClass' => AgenciaBancaria::className(), 'targetAttribute' => ['id_agencia_bancaria' => 'id']],
            [['id_conta_corrente'], 'exist', 'skipOnError' => true, 'targetClass' => ContaCorrente::className(), 'targetAttribute' => ['id_conta_corrente' => 'id']],        ];
    }
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'contato_banco';
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
            'funcao' => 'Função',
            'fone' => 'Fone',
            'tipo' => 'Tipo',
            'email' => 'E-mail',
            'id_conta_corrente' => 'Id Conta Corrente',
            'id_agencia_bancaria' => 'Id Agência Bancária',
        ];
    }

    /**
     * Retorna uma instancia de AgenciaBancaria a qual este contato pertence (caso este contato
     *  esteja vinculado a uma agência).
     *
     * @return \yii\db\ActiveQuery instancia de \app\models\AgenciaBancaria
     */
    public function getAgenciaBancaria()
    {
        return $this->hasOne(\app\models\AgenciaBancaria::className(), ['id' => 'id_agencia_bancaria']);
    }

    /**
     * Retorna uma instancia de ContaCorrente a qual este contato pertence (caso este contato
     *  esteja vinculado a uma conta corrente).
     * @return \yii\db\ActiveQuery
     */
    public function getContaCorrente()
    {
        return $this->hasOne(\app\models\ContaCorrente::className(), ['id' => 'id_conta_corrente']);
    }
}
