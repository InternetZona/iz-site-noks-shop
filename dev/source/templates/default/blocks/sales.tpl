{assign var=params value=[
    'parent'    => 21
    ,'limit'    => 10
    ,'filter'    => [
        'issale'    => 1
    ]
    ,'dir'      => 'RAND()'
]}

{processor action="web/catalog/getdata" ns='modcatalog' params=$params assign=result}

{if $result.success && $result.count > 0}
    <div class="block-sales">
        <div class="section__title">
            Предложение месяца
        </div>
        <div class="section__content">

            <div id="swiper-sales" class="swiper-container swiper-content">
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