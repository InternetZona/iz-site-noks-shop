{extends file="messages/web/base.tpl"}
{block name=content}
    <div style="margin: 20px 0; font-size:18px;font-weight:bold;">Вы оплатили заказ №{$properties.orderId}!</div>
    {include file="messages/constructor/title.tpl" text="Детализация платежа"}
    {include file="messages/constructor/checkout.tpl" data=$properties.basket}
{/block}