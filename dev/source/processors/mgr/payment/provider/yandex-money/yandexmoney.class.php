<?php

require_once dirname(dirname(dirname(__FILE__))) . "/vendor/yandex-money/autoload.php";

use YandexCheckout\Client;

abstract class modYandexMoneyProviderProcessor extends modProcessor
{
    /**
     * @var YandexCheckout\Client $client;
     */
    protected $client;

    public function initialize()
    {
        $this->setDefaultProperties(array(
            'shop_id'   => $this->modx->getOption('yandexmoney.shop_id'),
            'secret_key'    => $this->modx->getOption('yandexmoney.secret_key'),
        ));

        if (!$this->getProperty('shop_id')) $this->addFieldError('shop_id', 'Shop ID can`t be empty.');
        if (!$this->getProperty('shop_id')) $this->addFieldError('secret_key', 'Secret key can`t be empty.');

        $this->client = new Client();
        $this->client->setAuth(
            $this->getProperty('shop_id'),
            $this->getProperty('secret_key')
        );

        if (!parent::initialize()) {
            return false;
        }

        return !$this->hasErrors();
    }
}
return 'modYandexMoneyProviderProcessor';