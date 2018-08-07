{extends file="basepage.tpl"}

{block name=page_content prepend}

    {$tvData = {tv name=worktopCatalog}|json_decode:true}

    {if $tvData && is_array($tvData)}

        {foreach $tvData as $data}

            {$items = $data.items|json_decode:true}

            {if $items && is_array($items)}

                <div class="catalog-feed">
                    <div class="catalog-feed__title">{$data.title}</div>

                    <div class="catalog-feed__content row row--grid">

                        {foreach $items as $row}

                            <div class="col s12 m4 xl3">

                                <figure class="center-align">

                                    {snippet name="pThumb" params=[
                                    "input" => $row.image
                                    ,"options" => "&w=1600&h=1200&zc=0&aoe=0&far=0&q=80"
                                    ] assign=thumbImage}

                                    <a href="{$thumbImage}" data-size="1200x600" class="catalog-feed__item">

                                        {snippet name="pThumb" params=[
                                        "input" => $row.image,
                                        "options" => "&w=250&h=250&zc=1&aoe=0&far=0&q=80"
                                        ] assign=thumbImage}

                                        <img src="{$thumbImage}" class="responsive-img" />
                                    </a>
                                    <figcaption>
                                        <ul class="left-align">
                                            <li>Производитель: <span class="text--bold">{$row.manufacturer}</span></li>
                                            <li>Цвет: <span class="text--bold">{$row.color}</span></li>
                                        </ul>
                                    </figcaption>
                                </figure>
                            </div>
                        {/foreach}

                    </div>
                </div>

            {/if}

        {/foreach}

    {/if}

{/block}