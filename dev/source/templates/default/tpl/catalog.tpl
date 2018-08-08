{extends file="basepage.tpl"}

{block name=page_content prepend}
    <div class="row">
        {assign var=params value=[
        'parent'    => {field name=id}
        ,'sort' => 'menuindex'
        ,'dir'  => 'asc'
        ]}

        {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

        {if $result.success && $result.count > 0}

            {foreach $result.object as $object}
                <div class="col s12 m6 l6 xl4">
                    <div class="card box-item">
                        <div class="card-image">

                            {snippet name="pThumb" params=[
                            "input" => $object.tvs.image.value
                            ,"options" => "&w=360&h=225&zc=1&aoe=0&far=0&q=70"
                            ] assign=thumbImage}

                            <img src="{$thumbImage}" class="responsive-img">
                        </div>
                        <div class="card-content">
                                    <span class="card-title">
                                        <a href="{$object.uri}">
                                            {$object.pagetitle}
                                        </a>
                                    </span>
                        </div>
                    </div>
                </div>
            {/foreach}

        {/if}
    </div>

{/block}

{block name=aside}
    <div class="grey-bg">
        <div class="container">
            {include file="blocks/sales.tpl"}
        </div>
    </div>
    <div class="container">
        {include file="blocks/blog.tpl"}
        {include file="blocks/testimonials.tpl"}
        {include file="blocks/request.tpl"}
    </div>
{/block}

{block name=modals append}
    {include file="components/modals/testimonials.tpl"}
{/block}