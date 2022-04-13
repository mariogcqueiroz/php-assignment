<?php
    namespace app\models;
    use Yii;
    use yii\db\ActiveRecord;

    class Banco extends ActiveRecord
    {
        /**
         * {@inheritDoc}
         */
        public static function tableName()
        {
            return 'banco';
        }

        /**
         * {@inheritDoc}
         */
        public  function rules()
        {
            return [
                [ ['nome'],'required'],
                [['nome','numero'],'string']
            ] ;
        }


        /**
         * {@inheritDoc}
         */
        public function attributeLabels()
        {
            return [
                    'id'=>'ID',
                    'nome'=>'Nome',
                    'numero'=>'Número'
            ];
        }


    }