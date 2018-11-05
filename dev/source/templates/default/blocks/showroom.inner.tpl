{assign var=params value=[
'parent'    => 21
,'where'    => [
    'template'  => 52
]
,'filter'   => [
    'issale'    => 1
    ,'productType'  => $productTypeId
]
,'limit'    => 10
,'dir'      => 'RAND()'
]}

{processor action="web/catalog/getdata" ns='modcatalog' params=$params assign=result}

{if $result.success && $result.count > 0}
    <div class="block-showroom" style="padding-bottom: 30px;">
        <div class="section__title">
            Выставочные образцы
        </div>
        <div class="section__content">

            <div id="swiper-showroom" class="swiper-container swiper-content">
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

            <div class="center-align">
                <a href="{$modx->makeUrl(755)}" class="button-action" style="width:auto">Все предложения</a>
            </div>
        </div>
    </div>
{/if}