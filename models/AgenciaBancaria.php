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
    public  static $tipoarray = [0=>'movel',1=>'fixo'];
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
            [['id_banco', 'tipo','tipo1'], 'integer'],
            [['fone', 'fone1'], 'integer' , 'enableClientValidation' => false],
            [['id_banco'], 'integer','min'=>0, 'max' => 2147483648],
            [['tipo','tipo1'], 'integer', 'min'=>0, 'max' => 1],
            [['fone','fone1'], 'integer','min'=>1000000000, 'max' => 99999999999,
                'message' => 'Telefones devem possuir 11 dígitos',
                'enableClientValidation' => false],
            [['fone'],'telefonesdistintos'],
            [['fone'],'required', 'when'=> function ($model){
                        return $model->fone1==null;
            }],
            [['fone1'],'required', 'when'=> function ($model){
                return $model->fone1==null;
            }],
            [['endereco', 'agencia', 'nome_agencia'], 'string'],
            [['id_banco'], 'exist',
                'skipOnError' => true, 'targetClass' => Banco::className(), 'targetAttribute' => ['id_banco' => 'id']],
        ];
    }

    public function telefonesdistintos($attribute, $params, $validator){
        if ( $this->fone == $this->fone1){
            $this->addError($attribute,'Os telefones não podem ser iguais');
        }
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_banco' => 'Banco',
            'endereco' => 'Endereço',
            'fone' => 'Telefone',
            'tipo' => 'Tipo',
            'fone1' => 'Telefone de contato',
            'tipo1' => 'Tipo',
            'tiponome'=>'Tipo',
            'tipo1nome'=>'Tipo',
            'agencia' => 'Número da Agência',
            'nome_agencia' => 'Nome da Agência',
        ];
    }

    public function  getTiponome ()
    {
        return AgenciaBancaria::$tipoarray[$this->tipo];
    }
    public function  getTipo1nome ()
    {
        return AgenciaBancaria::$tipoarray[$this->tipo1];
    }

    public function  getBanconome ()
    {
        return $this->banco->nome;
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
