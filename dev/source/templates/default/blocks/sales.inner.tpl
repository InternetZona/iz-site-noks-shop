{$where = ({field name=template} == 25) ? ['id'=>{tv name=productType}] : ['seo_template_id'=>{field name=template}]}

{if $productType = $modx->getObject('catalogProductType', $where)}

    {assign var=params value=[
        'parent'    => 21
        ,'where' => [
            'template'  => $productType->template_id
        ]
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
                <div class="center-align">
                    <a href="{$modx->makeUrl(752)}" class="button-action" style="width:auto">Все предложения</a>
                </div>
            </div>
        </div>
    {/if}

{/if}