<?php


/**
 * Inherited Methods
 * @method void wantToTest($text)
 * @method void wantTo($text)
 * @method void execute($callable)
 * @method void expectTo($prediction)
 * @method void expect($prediction)
 * @method void amGoingTo($argumentation)
 * @method void am($role)
 * @method void lookForwardTo($achieveValue)
 * @method void comment($description)
 * @method \Codeception\Lib\Friend haveFriend($name, $actorClass = NULL)
 *
 * @SuppressWarnings(PHPMD)
*/
class AcceptanceTester extends \Codeception\Actor
{
    use _generated\AcceptanceTesterActions;

   /**
    * Define custom actions here
    */
    public function fillOutSelect2OptionField($selector, $value)
    {
        $I=$this;
        $selector = substr($selector, 1);
        $element = "#select2-{$selector}-container";
        $I->waitForElementVisible($element);
        $I->click($element);
        $searchField = '.select2-search__field';
        $I->waitForElementVisible($searchField);
        $I->fillField($searchField, $value);
        $I->pressKey($searchField, \Facebook\WebDriver\WebDriverKeys::ENTER);
    }
}
