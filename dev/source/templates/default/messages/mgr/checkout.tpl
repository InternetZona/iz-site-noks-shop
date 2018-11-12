{extends file="messages/mgr/base.tpl"}
{block name=content}
    {include file="messages/constructor/title.tpl" text="Детализация платежа"}
    {include file="messages/constructor/checkout.tpl" data=$properties.basket}
{/block}