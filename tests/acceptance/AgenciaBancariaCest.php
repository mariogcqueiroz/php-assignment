<?php

use yii\helpers\Url;

class agenciabancariaCest
{
    public function submitFormCorrect(\AcceptanceTester $I)
    {
        $I->wait(5);
        $I->amOnPage(Url::toRoute('/agencia-bancaria/create'));
        $I->amGoingTo('submeter Agencia  Corretamente');
        $I->fillOutSelect2OptionField('#agenciabancaria-id_banco','001-Banco do Brasil S.A. ');
        $I->fillField('#agenciabancaria-endereco', 'tester address');
        $I->fillField('#agenciabancaria-endereco', 'tester address');
        $I->fillField('#agenciabancaria-fone','62994883822');
        $I->fillOutSelect2OptionField('#agenciabancaria-tipo', 'movel');
        $I->fillField('#agenciabancaria-fone1','62994848833');
        $I->fillOutSelect2OptionField('#agenciabancaria-tipo1', 'fixo');
        $I->fillField('#agenciabancaria-agencia','456-2');
        $I->fillField('#agenciabancaria-nome_agencia','Teste');
        $I->click('//*[@id="w0"]/div[2]/button');
        $I->wait(2);
        $I->expectTo('Ver Dados na página de view');
        $I->see('(62)99488-3822');
    }
}