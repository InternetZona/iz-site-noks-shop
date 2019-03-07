{extends file="messages/mgr/base.tpl"}

{block name="client" prepend}

    <b>{$properties.subject}</b><br/>

{/block}

{block name=content}

    {if $properties.files}
        <b>Загруженные файлы:</b>
        <b><ul>{$properties.files}</ul></b><br/>
    {/if}
{/block}