{$where = ({field name=template} == 25) ? ['id'=>{tv name=productType}] : ['seo_template_id'=>{field name=template}]}

{if $productType = $modx->getObject('catalogProductType', $where)}

    {assign var=params value=[
        'parent'    => 21
         ,'where'   => [
            'template'  => $productType->template_id
        ]
        ,'filter'    => [
            'ishit'    => 1
        ]
        ,'limit'    => 0
        ,'sort'      => 'RAND()'
        ,'cached'   => true
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

                        {$result.object|@shuffle}

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

{/if}