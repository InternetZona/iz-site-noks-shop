{extends file="basepage.tpl"}

{block name=main}
    <div class="section container">

        <div class="row">
            <div class="col l9 push-l3">
                {snippet name="BreadCrumb@BreadCrumb"}
                <h1>{field name=pagetitle}</h1>

                <div class="section page__content">

                    <img src="{tv name=image}" class="responsive-img">

                    <div class="content-wrapper">
                        {field name=content}
                    </div>

                </div>

            </div>

            <div class="col l3 pull-l9">
                {include file="components/menu/folder.tpl" title="Другие акции" parent=38}
            </div>
        </div>

        {$bonusProducts = explode('||', {tv name=bonusProducts})}

        {if is_array($bonusProducts)}

            {assign var=params value=[
            'where' => [
            'id:in'    => $bonusProducts
            ]
            ,'limit'    => 0
            ]}

            {processor action="web/catalog/getdata" ns='modcatalog' params=$params assign=result}

            {if $result.success && $result.count > 0}
                <div class="block-sales">
                    <div class="section__title">
                        Акционные товары
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

        {/if}

    </div>

    {block name=aside}{/block}
{/block}