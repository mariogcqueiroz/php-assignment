<?php

namespace app\models;

use Yii;

/**
 * Classe model que instancia objetos contendo dados da tabela "remessas".
 *  Contém dados de arquivos de remessa vindos de um banco correspondente ao
 *  pagamento de boletos gerados.
 *  Salva a data de emissão do arquivo, nome do arquivo de remessa contido
 *  na pasta "uploads/boleto/remessa" e a conta corrente que recebeu o saldo
 *  de um ou mais boletos através desta remessa.
 *
 * @property integer $id chave primaria da tabela "remessas"
 * @property string $emissao data de emissao deste arquivo de remessa
 * @property string $arquivo nome do arquivo de remessa contido na pasta uploads/boleto/remessa
 * @property integer $conta_corrente_id chave extrangeira referenciando a tabela "conta_corrente",
 *  contendo a conta a qual ira recebeu o valor de boletos
 *
 * @property \app\models\ContaCorrente $ContaCorrente conta a qual recebeu o saldo neste arquivo de remessa
 */
class Remessas extends \yii\db\ActiveRecord
{

    public function behaviors(){
        return [
            [
                'class' => '\yiidreamteam\upload\FileUploadBehavior',
                'attribute' => 'arquivo',
                'filePath' => '/app/uploads/Remessas/[[pk]].[[extension]]',
                'fileUrl' => '/uploads/Remessas/[[pk]].[[extension]]',
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['emissao'], 'safe'],
            [['arquivo'],'file'],
            [['conta_corrente_id'], 'integer'],
            [['conta_corrente_id'], 'exist', 'skipOnError' => true, 'targetClass' => ContaCorrente::className(), 'targetAttribute' => ['conta_corrente_id' => 'id']],
        ];
    }
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'remessas';
    }

    /**
    * @inheritdoc
    */
    public static function representingColumn()
    {
        return 'arquivo';
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'emissao' => 'Data de Emissão',
            'arquivo' => 'Arquivo',
            'conta_corrente_id' => 'Conta Corrente',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContaCorrente()
    {
        return $this->hasOne(\app\models\ContaCorrente::className(), ['id' => 'conta_corrente_id']);
    }
}
