{extends file="messages/base.tpl"}

{block name=body}

    {block name=client}

        {include file="messages/constructor/title.tpl" text="Информация от пользователя сайта"}
        {include file="messages/constructor/client.tpl"}

    {/block}

    {block name=content}{/block}

{/block}