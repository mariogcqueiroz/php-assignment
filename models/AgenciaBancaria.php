<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "agencia_bancaria".
 *
 * @property int $id
 * @property int $id_banco
 * @property string|null $endereco
 * @property int|null $fone
 * @property int|null $tipo
 * @property int|null $fone1
 * @property int|null $tipo1
 * @property string $agencia
 * @property string|null $nome_agencia
 *
 * @property Banco $banco
 * @property ContaCorrente[] $contaCorrentes
 * @property ContatoBanco[] $contatoBancos
 * @property CdComplementares $tipo0
 * @property CdComplementares $tipo10
 */
class AgenciaBancaria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'agencia_bancaria';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_banco', 'agencia'], 'required'],
            [['id_banco', 'fone', 'tipo', 'fone1', 'tipo1'], 'default', 'value' => null],
            [['id_banco', 'fone', 'fone1', 'tipo1'], 'integer'],
            [['tipo'], 'integer', 'min'=>0, 'max' => 1],
            [['endereco', 'agencia', 'nome_agencia'], 'string'],
            [['id_banco'], 'exist',
                'skipOnError' => true, 'targetClass' => Banco::className(), 'targetAttribute' => ['id_banco' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_banco' => 'Id Banco',
            'endereco' => 'Endereco',
            'fone' => 'Fone',
            'tipo' => 'Tipo',
            'fone1' => 'Fone 1',
            'tipo1' => 'Tipo 1',
            'agencia' => 'Agencia',
            'nome_agencia' => 'Nome Agencia',
        ];
    }

    /**
     * Gets query for [[Banco]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBanco()
    {
        return $this->hasOne(Banco::className(), ['id' => 'id_banco']);
    }

    /**
     * Gets query for [[ContaCorrentes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getContaCorrentes()
    {
        return $this->hasMany(ContaCorrente::className(), ['id_agencia_bancaria' => 'id']);
    }

    /**
     * Gets query for [[ContatoBancos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getContatoBancos()
    {
        return $this->hasMany(ContatoBanco::className(), ['id_agencia_bancaria' => 'id']);
    }

    /**
     * Gets query for [[Tipo0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo0()
    {
        return $this->hasOne(CdComplementares::className(), ['id' => 'tipo']);
    }

    /**
     * Gets query for [[Tipo10]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo10()
    {
        return $this->hasOne(CdComplementares::className(), ['id' => 'tipo1']);
    }
}
