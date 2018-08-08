{extends file="basepage.tpl"}

{block name=page_content prepend}

    {$tvData = {tv name=worktopCatalog}|json_decode:true}

    {if $tvData && is_array($tvData)}

        <div style="margin-bottom: 30px;">
            <form id="list-controller" class="form form-catalog-controller">

                <div class="filter-wrapper">
                    <ul class="filter-list" style="margin:0;">

                        <li class="filter__item" style="width: 200px;">
                            <select name="material" class="filter__control">
                                <option value="0" selected>Все</option>

                                {foreach $tvData as $data}

                                    {if $smarty.get.material == $data.MIGX_id}

                                        <option value="{$data.MIGX_id}" selected>{$data.title}</option>

                                    {else}
                                        <option value="{$data.MIGX_id}">{$data.title}</option>
                                    {/if}

                                {/foreach}

                            </select>
                            <label class="filter__label">Материал столешницы</label>
                        </li>

                        <li class="filter__item">
                            <a href="{field name=uri}" class="button-reset" onclick="yaCounter49093180.reachGoal('filtr');">Сбросить фильтр</a>
                        </li>

                    </ul>
                </div>

            </form>
        </div>

        {if $smarty.get.material}

            {foreach $tvData as $data}

                {if $smarty.get.material == $data.MIGX_id}

                    {$items = $data.items|json_decode:true}

                    {if $items && is_array($items)}

                        <div class="catalog-feed">
                            <div class="catalog-feed__title">{$data.title}</div>

                            <div class="catalog-feed__content row row--grid gallery-grid">

                                {foreach $items as $row}

                                    <figure class="center-align col s6 m3 xl2">
                                        {snippet name="pThumb" params=[
                                        "input" => $row.image
                                        ,"options" => "&w=1600&h=1200&zc=0&aoe=0&far=0&q=80"
                                        ] assign=thumbImage}

                                        <div class="catalog-feed__item" data-size="1200x600">
                                            {snippet name="pThumb" params=[
                                            "input" => $row.image,
                                            "options" => "&w=250&h=250&zc=1&aoe=0&far=0&q=80"
                                            ] assign=thumbImage}

                                            <img src="{$thumbImage}" class="responsive-img" />

                                            <a href="{$thumbImage}" class="item__zoom">
                                                <i class="material-icons">zoom_in</i>
                                            </a>
                                        </div>
                                        <figcaption>
                                            <ul class="left-align">
                                                <li>Производитель: <span class="text--bold">{$row.manufacturer}</span></li>
                                                <li>Цвет: <span class="text--bold">{$row.color}</span></li>
                                            </ul>
                                        </figcaption>
                                    </figure>
                                {/foreach}

                            </div>
                        </div>

                    {/if}

                {/if}

            {/foreach}

            {else}

            {foreach $tvData as $data}

                {$items = $data.items|json_decode:true}

                {if $items && is_array($items)}

                    <div class="catalog-feed">
                        <div class="catalog-feed__title">{$data.title}</div>

                        <div class="catalog-feed__content row row--grid gallery-grid">

                            {foreach $items as $row}

                                <figure class="center-align col s6 m3 xl2">
                                    {snippet name="pThumb" params=[
                                    "input" => $row.image
                                    ,"options" => "&w=1600&h=1200&zc=0&aoe=0&far=0&q=80"
                                    ] assign=thumbImage}

                                    <div class="catalog-feed__item" data-size="1200x600">
                                        {snippet name="pThumb" params=[
                                        "input" => $row.image,
                                        "options" => "&w=250&h=250&zc=1&aoe=0&far=0&q=80"
                                        ] assign=thumbImage}

                                        <img src="{$thumbImage}" class="responsive-img" />

                                        <a href="{$thumbImage}" class="item__zoom">
                                            <i class="material-icons">zoom_in</i>
                                        </a>
                                    </div>
                                    <figcaption>
                                        <ul class="left-align">
                                            <li>Производитель: <span class="text--bold">{$row.manufacturer}</span></li>
                                            <li>Цвет: <span class="text--bold">{$row.color}</span></li>
                                        </ul>
                                    </figcaption>
                                </figure>
                            {/foreach}

                        </div>
                    </div>

                {/if}

            {/foreach}

        {/if}

    {/if}

{/block}

{block name=js_inject prepend}
    {include file="components/photoswipe/constructor.tpl"}
{/block}