{$data = explode('||', $tv)}

{assign var=params value=[
    'where' => [
        'id:IN' => $data
    ]
    ,'sort' => 'publishedon'
    ,'dir'  => 'desc'
    ,'limit'    => 0
]}

{processor action="web/catalog/getdata" ns='modcatalog' params=$params assign=result}

{if $result.success && $result.count > 0}
    <div class="block-related">
        <div class="section__title">
            {$title|default:"К этой модели подходят"}
        </div>
        <div class="section__content">

            <div id="swiper-related" class="swiper-container swiper-content">
                <div class="swiper-wrapper">

                    {foreach $result.object as $object}
                        <div class="swiper-slide">
                            {include file="components/product/item.light.tpl" object=$object}
                        </div>
                    {/foreach}

                </div>

                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </div>
{/if}