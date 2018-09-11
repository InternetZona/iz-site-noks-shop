{extends file="tpl/index.tpl"}

{block name=main}
    <div class="container">
        {include file="components/banner/index.tpl"}
        {include file="blocks/free.tpl"}
        {include file="blocks/featured.tpl"}
    </div>

    <div class="grey-bg" style="margin-top: 2rem; padding-bottom: 2rem;">
        <div class="container">
            {include file="blocks/sales.tpl"}
        </div>
    </div>

    <div class="container">
        {include file="blocks/recomendation.tpl"}
        {include file="blocks/events.tpl"}

        {*
            {include file="blocks/showroom.tpl"}
        *}

        {include file="blocks/request.tpl"}

        {*
            {include file="blocks/portfolio.tpl"}
        *}

        {include file="blocks/blog.tpl"}
        {include file="blocks/testimonials.tpl"}
        {include file="blocks/request.tpl"}
        {include file="blocks/brands.tpl"}
    </div>


{/block}

{block name=modals append}
    {include file="components/modals/testimonials.tpl"}
{/block}
