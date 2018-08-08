{extends file="tpl/index.tpl"}

{block name=main}
    <div class="section container">
        <div class="breadcrumbs">
            <a href="{config name=base_url}" class="breadcrumb">Главная</a>

            {snippet name=ProductCrumbs}

            <span class="breadcrumb">{{field name=menutitle}|default:{field name=pagetitle}}</span>
        </div>

        <div class="section page__content page--product">

            <div class="row">
                <div class="col s12 m6 l8">
                    {include file="components/product/gallery.tpl" tvData={tv name=images}|json_decode:true}
                </div>
                <div class="col s12 m6 l4">
                    <h1>{field name=pagetitle}</h1>
                    <ul class="product__params">
                        <li>
                            {$discount = {tv name=price_discount}|default:0}

                            {if $discount}
                                <div class="product-discount">
                                    <span class="product__old-price">{{tv name=price}|number_format:0:',':' '}</span>
                                    <span class="product--economy">экономия {({tv name=price} - $discount)|number_format:0:',':' '}</span>
                                </div>
                                Стоимость: {if {field name=template} == 9}от{/if} <span class="product__cost">{$discount|number_format:0:',':' '}</span>

                                {$discountPersent = 100 - (100 * $discount) / {tv name=price}}
                                <span class="badge--discount">скидка -{$discountPersent|number_format:0:',':' '|cat:"%"}</span>
                            {else}
                                Стоимость: {if {field name=template} == 9}от{/if} <span class="product__cost">{{tv name=price_discount}|default:{tv name=price}|number_format:0:',':' '}</span>
                            {/if}
                        </li>

                        {if {field name=template} == 9}
                            <li>Цена включает: <span>фасады, корпус, цоколь, ножки, ручки, петли, ящики, сушка</span></li>
                        {/if}
                    </ul>

                    {if {field name=template} == 52}
                        {include file="components/product/params.tpl" product=$modx->getObject('modResource', {tv name=productId})}
                    {else}
                        {include file="components/product/params.tpl" product=$modx->resource}
                    {/if}

                    {if $params = {tv name=params}|json_decode:true}

                        <ul class="product__params">
                            {foreach $params as $param}
                                <li>{$param.name}: <span>{$param.value}</span></li>
                            {/foreach}
                        </ul>

                    {/if}

                    <div class="product__divider"></div>

                    <div class="row row--grid">
                        <div class="col s6 push-s6 m2 valign-wrapper">
                            <div class="product__bar">
                                {$favorite = $smarty.cookies.favorite|json_decode:true}
                                {if in_array({field name=id}, $favorite)}
                                    <a href="#" class="product__bar-btn favorite-btn" data-id="{field name=id}"></a>
                                {else}
                                    <a href="#" class="product__bar-btn favorite-btn favorite--empty" data-id="{field name=id}"></a>
                                {/if}

                            </div>
                        </div>

                        <div class="col s6 pull-s6 m8 offset-m2 pull-m2 valign-wrapper">
                            {$price = {tv name=price_discount}|default:{tv name=price}}
                            <a href="#" class="product__order-btn btn-block" data-id="{field name=id}" data-price="{$price}" onclick="yaCounter49093180.reachGoal('buy');">Заказать</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        {if {field name=template} != 52}

            {assign var=content value={field name=content}}
            {assign var=fasadeList value={tv name=fasade}|json_decode:true}
            {assign var=colorsList value={tv name=colors}|json_decode:true}
            {assign var=equipList value={tv name=equip}|json_decode:true}

            {if $content || $fasadeList || $colorsList || $equipList}
                <div class="row product-tabs">
                    <div class="col s12">
                        <ul id="product-overview" class="tabs">
                            {if $content}
                                <li class="tab col s12 m3"><a href="#tab-content">Описание</a></li>
                            {/if}
                            {if $fasadeList}
                                <li class="tab col s12 s3"><a href="#tab-fasade">Варианты фасадов</a></li>
                            {/if}
                            {if $colorsList}
                                <li class="tab col s12 s3"><a href="#tab-colors">Цветовые решения</a></li>
                            {/if}
                            {if $equipList}
                                <li class="tab col s12 s3"><a href="#tab-options">Комплектация и цены</a></li>
                            {/if}
                        </ul>
                    </div>
                    {if $content}
                        <div id="tab-content" class="tab__item col s12">
                            <div class="content-wrapper">
                                {$content}
                            </div>
                        </div>
                    {/if}
                    {if $fasadeList}
                        <div id="tab-fasade" class="tab__item col s12">
                            <div class="row row--grid">
                                {foreach $fasadeList as $data}
                                    <div class="col s6 m4 l3 xl2">
                                        {include file="components/product/fasade.tpl" data=$data}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                    {if $colorsList}
                        <div id="tab-colors" class="tab__item col s12">
                            <div class="row row--grid">
                                {foreach $colorsList as $data}
                                    <div class="col s6 m4 l3 xl2">
                                        {include file="components/product/colors.tpl" data=$data}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                    {if $equipList}
                        <div id="tab-options" class="tab__item col s12">
                            <div class="product-equip">
                                <div class="product-equip__header">
                                    <div class="row">
                                        <div class="col hide-on-small-and-down m4 product-equip__title">Конфигурация</div>
                                        <div class="col hide-on-small-and-down m3 product-equip__title">Размер</div>
                                        <div class="col hide-on-small-and-down m3 product-equip__title">Комплектация</div>
                                        <div class="col hide-on-small-and-down m2 product-equip__title">Цена</div>
                                    </div>
                                </div>
                                <ul class="product-equip__list">
                                    {foreach $equipList as $data}
                                        <li class="product-equip__item">
                                            <div class="row">
                                                <div class="col s12 m4">
                                                    <div class="product-equip__title hide-on-med-and-up">Конфигурация</div>
                                                    {snippet name="pThumb" params=[
                                                    "input" => $data.image
                                                    ,"options" => "&w=275&h=235&zc=0&aoe=0&far=0&q=70"
                                                    ] assign=thumbImage}
                                                    <img src="{$thumbImage}" class="responsive-img">
                                                </div>
                                                <div class="col s12 m3">
                                                    <div class="product-equip__title hide-on-med-and-up">Размер</div>
                                                    {$data.size}
                                                </div>
                                                <div class="col s12 m3">
                                                    <div class="product-equip__title hide-on-med-and-up">Комплектация</div>
                                                    <ul class="product-equip__list-inner">

                                                        {$items = $data.items|json_decode:true}

                                                        {foreach $items as $item}
                                                            <li>{$item.title}</li>
                                                        {/foreach}

                                                    </ul>
                                                </div>
                                                <div class="col s12 m2">
                                                    <div class="row">
                                                        <div class="col s12">
                                                            <div class="product-equip__title hide-on-med-and-up">Цена</div>

                                                            {if $data.price_discount}
                                                                <div class="product--sale-info">
                                                                    <div class="old-price">
                                                                    <span class="product__cost">
                                                                        {$data.price|number_format:0:'.':' '}
                                                                    </span>
                                                                        <span class="bonus-sum">экономия {($data.price - $data.price_discount)|number_format:0:'.':' '}</span>
                                                                    </div>
                                                                    <span class="product__cost">
                                                                    {$data.price_discount|number_format:0:'.':' '}
                                                                </span>
                                                                </div>
                                                            {else}

                                                                <span class="product__cost">{$data.price|number_format:0:',':' '}</span>

                                                            {/if}
                                                        </div>
                                                        <div class="col s12">
                                                            <a href="#" class="product__order-btn btn-block" data-id="{field name=id}" data-discount="{$data.price_discount}" data-price="{$data.price}" onclick="yaCounter49093180.reachGoal('buy');">Заказать</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        </div>
                    {/if}
                </div>
            {/if}

            {if $tv = {tv name=relatedProducts}}
                {include file="blocks/product.related.tpl" data=$tv}
            {/if}

            {if $tv = {tv name=buysProducts}}
                {include file="blocks/product.buys.tpl" data=$tv}
            {/if}

            {if $tv = {tv name=semiProducts}}
                {include file="blocks/product.semi.tpl" data=$tv}
            {/if}
        {/if}

        {include file="blocks/testimonials.tpl"}
        {include file="blocks/request.tpl"}
    </div>

{/block}

{block name=modals append}
    {include file="components/modals/testimonials.tpl"}
{/block}

{block name=js_inject prepend}
    {include file="components/photoswipe/constructor.tpl"}
{/block}