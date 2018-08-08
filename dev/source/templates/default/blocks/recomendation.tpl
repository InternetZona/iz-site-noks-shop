{assign var=params value=[
    'parent'    => 21
    ,'where'    => [
        'template:!='   => 52
    ]
    ,'filter'    => [
        'ishit'    => 1
    ]
    ,'limit'    => 0
    ,'dir'      => 'RAND()'
]}

{processor action="web/catalog/getdata" ns='modcatalog' params=$params assign=result}

{if $result.success && $result.count > 0}
    <div class="section block-recomendation">
        <div class="section__title">
            Лидеры продаж
        </div>
        <div class="section__content">

            <div id="swiper-recomendation" class="swiper-container swiper-content">
                <div class="swiper-wrapper">

                    {foreach $result.object as $object}
                        <div class="swiper-slide">
                            {include file="components/product/item.tpl" object=$object}
                        </div>
                    {/foreach}

                </div>

                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </div>
{/if}