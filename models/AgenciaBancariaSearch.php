<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\AgenciaBancaria;

/**
 * AgenciaBancariaSearch represents the model behind the search form of `app\models\AgenciaBancaria`.
 */
class AgenciaBancariaSearch extends AgenciaBancaria
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_banco', 'fone', 'tipo', 'fone1', 'tipo1'], 'integer'],
            [['endereco', 'agencia','nome_agencia'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = AgenciaBancaria::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'id_banco' => $this->id_banco,
            'fone' => $this->fone,
            'tipo' => $this->tipo,
            'fone1' => $this->fone1,
            'tipo1' => $this->tipo1,
        ]);

        $query->andFilterWhere(['ilike', 'endereco', $this->endereco])
            ->andFilterWhere(['ilike', 'agencia', $this->agencia])
            ->andFilterWhere(['ilike', 'nome_agencia', $this->nome_agencia]);

        return $dataProvider;
    }
}
