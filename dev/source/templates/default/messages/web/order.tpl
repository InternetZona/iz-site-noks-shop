{extends file="messages/web/base.tpl"}

{block name=content}

    <div style="margin-top: 20px; font-size:18px;font-weight:bold;">Спасибо за заказ!</div>
    <p style="margin-top: 0; margin-bottom: 20px;">В ближайшее время с вами свяжется наш менеджер.</p>

    {include file="messages/constructor/title.tpl" text={"Детализация заказа №"|cat:$properties.orderId}}
    {include file="messages/constructor/list.order.tpl" data=$properties.basket}

{/block}