{extends file="basepage.tpl"}

{block name=page_content prepend}

    {$showcase = {tv name=showcase}|json_decode:true}

    {if $showcasse}

        <div class="row row--grid">

            {foreach $showcase as $item}

                <div class="col s12 m6 l4">

                    <div class="card box-item">
                        <div class="card-image">

                            {snippet name="pThumb" params=[
                            "input" => $item.image
                            ,"options" => "&w=320&h=480&zc=1&aoe=0&far=0&q=80"
                            ] assign=thumbImage}

                            <img src="{$thumbImage}" class="responsive-img">
                        </div>
                        <div class="card-content">
                                            <span class="card-title">
                                                {$item.title}
                                            </span>
                        </div>
                    </div>

                </div>

            {/foreach}

        </div>

    {/if}
{/block}

{block name=aside}
    <div class="container">
        {include file="blocks/blog.tpl"}
        {include file="blocks/testimonials.tpl"}
        {include file="blocks/request.tpl"}
    </div>
{/block}

{block name=modals append}
    {include file="components/modals/testimonials.tpl"}
{/block}