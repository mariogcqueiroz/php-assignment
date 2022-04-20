<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "banco".
 *
 * @property int $id
 * @property string $nome
 * @property string|null $numero
 * @property int|null $ispb
 *
 * @property AgenciaBancaria[] $agenciaBancarias
 * @property Cheque[] $cheques
 * @property Funcionario[] $funcionarios
 * @property Operadora[] $operadoras
 * @property PessoaFisica[] $pessoaFisicas
 * @property PessoaFisica[] $pessoaFisicas0
 * @property PessoaFisica[] $pessoaFisicas1
 */
class Banco extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'banco';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nome','numero'], 'required'],
            [['nome', 'numero'], 'string'],
            [['ispb'], 'default', 'value' => null],
            [['ispb'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nome' => 'Nome',
            'numero' => 'Numero',
            'ispb' => 'Ispb',
        ];
    }

    /**
     * Gets query for [[AgenciaBancarias]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAgenciaBancarias()
    {
        return $this->hasMany(AgenciaBancaria::className(), ['id_banco' => 'id']);
    }

    /**
     * Gets query for [[Cheques]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCheques()
    {
        return $this->hasMany(Cheque::className(), ['banco_id' => 'id']);
    }

    /**
     * Gets query for [[Funcionarios]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFuncionarios()
    {
        return $this->hasMany(Funcionario::className(), ['fbanco' => 'id']);
    }

    /**
     * Gets query for [[Operadoras]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOperadoras()
    {
        return $this->hasMany(Operadora::className(), ['id_banco' => 'id']);
    }

    /**
     * Gets query for [[PessoaFisicas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPessoaFisicas()
    {
        return $this->hasMany(PessoaFisica::className(), ['banco' => 'id']);
    }

    /**
     * Gets query for [[PessoaFisicas0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPessoaFisicas0()
    {
        return $this->hasMany(PessoaFisica::className(), ['banco1' => 'id']);
    }

    /**
     * Gets query for [[PessoaFisicas1]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPessoaFisicas1()
    {
        return $this->hasMany(PessoaFisica::className(), ['banco2' => 'id']);
    }
}
