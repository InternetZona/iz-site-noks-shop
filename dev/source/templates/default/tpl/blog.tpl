{extends file="basepage.tpl"}

{block name=page_content prepend}
    {assign var=params value=[
    'parent'    => {field name=id}
    ,'dir'      => 'DESC'
    ,'sort'     => 'publishedon'
    ,'cache'    => true
        ,'limit'    => 0
    ]}
    {processor action="site/web/resources/getdata" params=$params ns="modxsite" assign=result}

    {if $result.success && $result.count > 0}

        {block name=content_grid}
            <div class="row">

                {foreach $result.object as $object}

                    <div class="col s12 m4 l3">
                        {include file="components/blog/item.tpl" object=$object}
                    </div>

                {/foreach}

            </div>
        {/block}

    {/if}
{/block}