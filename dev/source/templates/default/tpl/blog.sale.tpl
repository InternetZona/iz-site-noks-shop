{extends file="basepage.tpl"}

{block name=page_content prepend}
    {assign var=params value=[
        'parent'    => {field name=id}
        ,'dir'      => 'DESC'
        ,'sort'     => 'publishedon'
    ]}
    {processor action="site/web/resources/getdata" params=$params ns="modxsite" assign=result}

    {if $result.success && $result.count > 0}

        {foreach $result.object as $object}

            {include file="components/blog/sale.tpl" object=$object}

        {/foreach}

        {else}

        <div class="alert--empty">
            Все акции в нашем магазине завершились. Следите за обновлением раздела.
        </div>

    {/if}
{/block}