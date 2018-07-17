{extends file="messages/mgr/base.tpl"}

{block name=content}

    {include file="messages/constructor/title.tpl" text="Детализация заказа"}
    {include file="messages/constructor/list.order.tpl" data=$properties.basket}

{/block}