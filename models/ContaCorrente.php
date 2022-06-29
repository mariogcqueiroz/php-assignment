<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * Classe model que instancia objetos contendo dados da tabela "conta_corrente".
 *  Contém dados cadastrados de uma conta corrente, bem como: número, agência,
 *  saldo, tipo desta conta, aplicabilidade desta conta e funcionários da agência
 *  conhecidos e cadastrados nesta conta.
 *
 * @property integer $id chave primaria da tabela "conta_corrente"
 * @property integer $id_agencia_bancaria chave extrangeira ligada a tabela "agencia_bancaria"
 * @property integer $tipo chave extrangeira referenciando a tabela "cd_complementares",
 *  podendo assumir: 34 - conta corrente, 35 - poupanca, 36 - aplicacao financeira,
 *  aplicacao de conta bancaria
 * @property integer $aplicacao chave extrangeira referenciando a tabela "cd_complementares",
 *  podendo assumir: 61 - pagamento diversos,
 *  62 - recebimento diversos
 * @property string $n_conta numero desta conta
 * @property integer $contabil chave extrangeira da tabela "plano_de_contas", que por sua vez,
 *  representa a classificacao contabil desta conta corrente
 * @property float $saldo valor monetario que foi cadastrado no sistema
 * @property \app\models\AgenciaBancaria $agenciaBancaria retorna uma instancia de AgenciaBancaria,
 *  a qual pertence esta conta
 * @property \app\models\CdComplementares $tipo0 retorna uma instancia de CdComplementares contendo
 *  o tipo desta conta (conta corrente, poupanca,...)
 * @property \app\models\CdComplementares $aplicacao0 retorna uma instancia de CdComplementares
 *  contendo a aplicacao desta conta (pagamento diversos, recebimento diversos)
 * @property \app\models\ContatoBanco[] $contatoBancos vetor de instancias de ContatoBanco, contendo
 *  funcionarios conhecidos da agencia que pertence esta conta e foram vinculadas a esta conta
 */
class ContaCorrente extends \yii\db\ActiveRecord
{

    public $banco;
    public $data_inicio;
    public $data_fim;
    public $id_select;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_agencia_bancaria', 'tipo', 'aplicacao', 'n_conta'], 'required'],
            [['id_agencia_bancaria', 'tipo', 'aplicacao', 'banco'], 'default', 'value' => null],
            [['id_agencia_bancaria', 'tipo', 'aplicacao', 'contabil', 'banco'], 'integer'],
            [['saldo'], 'number', 'min' => 0],
            [['n_conta'], 'string'],
            [['n_conta', 'id_agencia_bancaria'], 'validateContaCorrenteUnique'],
            [['id_agencia_bancaria'], 'exist', 'skipOnError' => true, 'targetClass' => AgenciaBancaria::className(), 'targetAttribute' => ['id_agencia_bancaria' => 'id']],
            [['tipo'], 'exist', 'skipOnError' => true, 'targetClass' => CdComplementares::className(), 'targetAttribute' => ['tipo' => 'id']],
            [['aplicacao'], 'exist', 'skipOnError' => true, 'targetClass' => CdComplementares::className(), 'targetAttribute' => ['aplicacao' => 'id']],
            ['id_select', 'integer'],
            ['id_select','exist', 'skipOnError' => true,'targetClass' => ContaCorrente::className(), 'targetAttribute' => ['id_select' => 'id']],
            [['data_inicio','data_fim'], 'date', 'format' => 'php:d/m/Y'],
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'conta_corrente';
    }

    /**
     * @inheritdoc
     */
    public static function representingColumn()
    {
        return 'n_conta';
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_agencia_bancaria' => 'Agência',
            'tipo' => 'Tipo',
            'aplicacao' => 'Aplicação',
            'n_conta' => 'Nº de conta',
            'saldo' => 'Saldo',
            'data_inicio' => 'Início da Movimentação',
            'data_fim' => 'Final da Movimentação',
            'id_select' => 'Conta Corrente',
        ];
    }

    /**
     * Retorna uma instancia de AgenciaBancaria correspondente a agencia desta
     *  conta corrente.
     *
     * @return \yii\db\ActiveQuery instancia de \app\models\AgenciaBancaria
     */
    public function getAgenciaBancaria()
    {
        return $this->hasOne(\app\models\AgenciaBancaria::className(), ['id' => 'id_agencia_bancaria']);
    }

    /**
     * Retorna uma instancia de CdComplementares, contendo o tipo desta conta (34 - conta corrente,
     *  35 - poupança, 36 - aplicação financeira, aplicação de conta bancaria).
     *
     * @return \yii\db\ActiveQuery instancia de \app\models\CdComplementares
     */
    public function getTipo0()
    {
        return $this->hasOne(\app\models\CdComplementares::className(), ['id' => 'tipo']);
    }

    /**
     * Retorna uma instancia de CdComplementares, contendo o tipo de aplicação desta conta,
     *  se ela é usada para: 61 - pagamento diversos, 62 - recebimento diversos.
     *
     * @return \yii\db\ActiveQuery instancia de \app\models\CdComplementares
     */
    public function getAplicacao0()
    {
        return $this->hasOne(\app\models\CdComplementares::className(), ['id' => 'aplicacao']);
    }

    /**
     * Retorna uma instancia do model "Banco", a qual pertence a agência desta conta.
     *
     * @return \yii\db\ActiveQuery instancia de \app\models\Banco
     */
    public function getBanco0()
    {
        return $this->agenciaBancaria->banco;
    }

    /**
     * Retorna um Array com um ou mais instâncias de ContatoBanco que possuem
     *  a chave extrangeira "id_conta_corrente" igual a chave primaria desta conta.
     *  Permitindo rastrear funcionários conhecidos de uma agência que foram vinculadas
     *  à esta conta.
     *
     * @return \yii\db\ActiveQuery instancia de \app\models\ContatoBanco
     */
    public function getContatoBancos()
    {
        return $this->hasMany(\app\models\ContatoBanco::className(), ['id_conta_corrente' => 'id']);
    }

    /**
     * Verifica se a conta corrente que será criada já existe na agência.
     * Se ela já existir, é adicionado um erro.
     *
     * @param $attribute
     * @param $params
     * @param $validator
     */
    public function validateContaCorrenteUnique($attribute, $params, $validator)
    {
        $this->id_agencia_bancaria = ($this->id_agencia_bancaria != "" ? $this->id_agencia_bancaria : null);
        $this->n_conta = ($this->n_conta != "" ? $this->n_conta : null);

        if (Yii::$app->controller->id == "conta-corrente") {
            $data = ContaCorrente::find()->where(['and',
                    ['id_agencia_bancaria' => $this->id_agencia_bancaria],
                    ['n_conta' => $this->n_conta],
                ]
            )->all();
            if (!empty($data)) {
                $this->addError('n_conta', 'Número de conta corrente já cadastrada para esta agência.');
            }
        }
    }

    /**
     * Verifica se o saldo da pessoa é suficiente para o valor desejado.
     * Se for, diminui do saldo e retorna verdadeiro.
     * Se não, adiciona um erro e retorna falso.
     *
     * @param $valor valor a ser retirado da conta.
     * @return bool
     */
    public function subAndSave($valor)
    {
        if ($this->saldo >= $valor) {
            $this->saldo -= $valor;
            if ($this->save())
                return true;
        } else {
            $this->addError('id', 'Conta corrente não possui saldo suficiente!');
        }
        return false;
    }

    /**
     * Adiciona o valor no saldo da conta corrente.
     * Se o valor for negativo, adiciona um erro e retorna falso.
     * Se for salvo sem erros, retorna verdadeiro.
     *
     * @param $valor saldo a ser adicionado.
     * @return bool Verdadeiro se for adicionado.
     */
    public function addAndSave($valor)
    {
        if ($valor > 0) {
            $this->saldo += $valor;
            if ($this->save())
                return true;
        } else {
            $this->addError('id', 'Valor inválido!');
        }
        return false;
    }

    /**
     * Retira um determinado valor do saldo da conta.
     * Esse método retira do saldo sem verificar se ele é suficiente.
     *
     * @param $valor quantidade a ser retirada.
     * @return bool verdadeiro se for retirado.
     */
    public function subForceAndSave($valor)
    {
        $this->saldo -= $valor;
        if ($this->save())
            return true;
        return false;
    }

    /**
     * Creates and populates a set of models.
     *
     * @param string $modelClass
     * @param array $multipleModels
     * @return array
     */
    public static function createMultiple($modelClass, $multipleModels = [])
    {
        $model = new $modelClass;
        $formName = $model->formName();
        $post = Yii::$app->request->post($formName);
        $models = [];

        if (!empty($multipleModels)) {
            $keys = array_keys(ArrayHelper::map($multipleModels, 'id', 'id'));
            $multipleModels = array_combine($keys, $multipleModels);
        }

        if ($post && is_array($post)) {
            foreach ($post as $i => $item) {
                if (isset($item['id']) && !empty($item['id']) && isset($multipleModels[$item['id']])) {
                    $models[] = $multipleModels[$item['id']];
                } else {
                    $models[] = new $modelClass;
                }
            }
        }

        unset($model, $formName, $post);

        return $models;
    }
}
