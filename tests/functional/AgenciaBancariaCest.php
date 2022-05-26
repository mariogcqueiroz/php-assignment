<?php

class AgenciaBancariaCest
{
    /*public function _before(\FunctionalTester $I)
    {

    }*/

    public function submeterFomularioVazio(\FunctionalTester $I)
    {
        $I->amOnRoute('agencia-bancaria/create');
        $I->submitForm('form', []);
        $I->expectTo('see validations errors');
        $I->see('"Banco" não pode ficar em branco.');
        $I->see('"Número da Agência" não pode ficar em branco.');
        $I->see('"Telefone" não pode ficar em branco.');
        $I->see('"Telefone de contato" não pode ficar em branco.');
    }
    public function submitFormWithIncorrectTipo(\FunctionalTester $I)
    {
        $I->amOnRoute('agencia-bancaria/create');
        $I->submitForm('form', [
            'AgenciaBancaria[id_banco]'=>'1',
            'AgenciaBancaria[endereco]'=>'Endereço teste',
            'AgenciaBancaria[fone]'=>'62994883822',
            'AgenciaBancaria[tipo]'=>'12',
            'AgenciaBancaria[fone1]'=>'62994848833',
            'AgenciaBancaria[tipo1]'=>'0',
            'AgenciaBancaria[agencia]'=>'456-2',
            'AgenciaBancaria[nome_agencia]'=>'Teste',
        ]);
        $I->expectTo('see validations errors');
        $I->see('"Tipo" não pode ser maior que 1.');
        $I->dontSee('"Banco" não pode ficar em branco.');
        $I->dontSee('"Número da Agência" não pode ficar em branco.');
        $I->dontSee('"Telefone" não pode ficar em branco.');
        $I->dontSee('"Telefone de contato" não pode ficar em branco.');
    }
    public function submiterForularioCorreto(\FunctionalTester $I)
    {
        $I->amOnRoute('agencia-bancaria/create');
        $I->submitForm('form', [
            'AgenciaBancaria[id_banco]'=>'1',
            'AgenciaBancaria[endereco]'=>'Endereço teste',
            'AgenciaBancaria[fone]'=>'62994883822',
            'AgenciaBancaria[tipo]'=>'1',
            'AgenciaBancaria[fone1]'=>'62994848833',
            'AgenciaBancaria[tipo1]'=>'0',
            'AgenciaBancaria[agencia]'=>'456-2',
            'AgenciaBancaria[nome_agencia]'=>'Teste',
        ]);
        $I->expectTo('Ver registro de agencia no bando de dados');
        $I->seeRecord('\app\models\AgenciaBancaria',[
                'id_banco'=>'1',
                'endereco'=>'Endereço teste',
                'fone'=>'62994883822',
                'tipo'=>'1',
                'fone1'=>'62994848833',
                'tipo1'=>'0',
                'agencia'=>'456-2',
                'nome_agencia'=>'Teste',
            ]
        );
    }

}