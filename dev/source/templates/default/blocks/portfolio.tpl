{assign var=params value=[
    'id' => 17
    ,'current'    => true
    ,'cache'    => true
    ,'showhidden'   => true
]}

{processor action="site/web/resources/getdata" params=$params ns="modxsite" assign=result}

{if $result.success && $result.count > 0}
    <div class="section block-portfolio">
        <div class="section__title">
            Портфолио выполненных заказов
        </div>
        <div class="section__content">

            {$data = $result.object.tvs.portfolio.value|json_decode:true}

            {$portfolio = []}

            {foreach $data as $item}

                {$images = $item.images|json_decode:true}

                {if $images}

                    {$portfolio = array_merge($portfolio, $images)}

                {/if}

            {/foreach}

            {if $portfolio && is_array($portfolio)}
                <div id="swiper-portfolio" class="swiper-container swiper-content">
                    <div class="swiper-wrapper mp-gallery">

                        {foreach $portfolio as $data}

                            <div class="swiper-slide center-align">
                                <div class="card  box-item">
                                    <div class="card-image" style="padding: 8px;">
                                        {snippet name="pThumb" params=[
                                        "input" => $data.image
                                        ,"options" => "&w=242&h=168&zc=1&aoe=0&far=0&q=70"
                                        ] assign=thumbImage}

                                        <a href="{$data.image}">
                                            <img src="{$thumbImage}">
                                        </a>
                                    </div>
                                </div>
                            </div>

                        {/foreach}

                    </div>

                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            {/if}
        </div>
    </div>
{/if}
