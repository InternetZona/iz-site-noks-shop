{extends file="basepage.tpl"}

{block name=breadcrumbs}
    {snippet name="BreadCrumb@BreadCrumb" params=[
        'showHidden'    => true
    ]}
{/block}

{block name=page_content prepend}

    {if $portfolio = {field name=portfolio}|json_decode:true}

        <div style="margin-bottom: 30px;">
            <form id="portfolio-controller" class="form form-catalog-controller">

                <div class="filter-wrapper">
                    <ul class="filter-portfolio" style="margin:0;">

                        <li class="filter__item">
                            <select name="type" class="filter__control">
                                <option value="0" selected>Все</option>

                                {foreach $portfolio as $data}

                                    {if $type = $modx->getObject('catalogProductType', $data.type_id)}
                                        {if $smarty.get.type == $data.type_id}

                                            <option value="{$data.type_id}" selected>{$type->name}</option>

                                            {else}
                                            <option value="{$data.type_id}">{$type->name}</option>
                                        {/if}
                                    {/if}

                                {/foreach}

                            </select>
                            <label class="filter__label">Вид продукции</label>
                        </li>

                        <li class="filter__item">
                            <a href="{$url}" class="button-reset" onclick="yaCounter49093180.reachGoal('filtr');">Сбросить фильтр</a>
                        </li>

                    </ul>
                </div>

            </form>
        </div>

        <div class="row catalog-grid">

            {if $smarty.get.type}

                {$items = []}

                {foreach $portfolio as $data}

                    {if $data.MIGX_id == $smarty.get.type}

                        {$items = $data.images|json_decode:true}
                        {break}

                    {/if}

                {/foreach}

                {if $items}

                    {foreach $items as $item}

                        <div class="col s12 m6 l4 xl3">

                            <div class="card box-item">
                                <div class="card-image">

                                    {snippet name="pThumb" params=[
                                    "input" => $item.image
                                    ,"options" => "&w=480&h=320&zc=1&aoe=0&far=0&q=80"
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

                {/if}

            {else}

                {foreach $portfolio as $data}

                    {$items = $data.images|json_decode:true}

                    {foreach $items as $item}

                        <div class="col s12 m6 l4 xl3">

                            <div class="card box-item">
                                <div class="card-image">

                                    {snippet name="pThumb" params=[
                                    "input" => $item.image
                                    ,"options" => "&w=480&h=320&zc=1&aoe=0&far=0&q=80"
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

                {/foreach}

            {/if}

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