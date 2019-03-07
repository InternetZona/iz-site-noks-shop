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
                                Стоимость: {if {tv name=isStartPrice}}от {/if} <span class="product__cost">{{tv name=price_discount}|default:{tv name=price}|number_format:0:',':' '}</span>
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

                    {if
                    {field name=pagetitle}|strpos:"Стол" !== false ||
                    {field name=pagetitle}|strpos:"Стул" !== false ||
                    {field name=pagetitle}|strpos:"Обеденные" !== false ||
                    {field name=pagetitle}|strpos:"Бытовая техника" !== false ||
                    {field name=pagetitle}|strpos:"Духовой шкаф" !== false ||
                    {field name=pagetitle}|strpos:"Посудомоечная машина" !== false ||
                    {field name=pagetitle}|strpos:"Микроволновая печь" !== false ||
                    {field name=pagetitle}|strpos:"Вытяжка" !== false ||
                    {field name=pagetitle}|strpos:"Сиденье" !== false ||
                    {field name=pagetitle}|strpos:"поверхность" !== false}

                        <div class="row">

                            <div class="col s6 pull-s6 m8 offset-m2 pull-m2 valign-wrapper">
                                {$price = {tv name=price_discount}|default:{tv name=price}}
                                <a href="#" class="product__order-btn btn-block" data-id="{field name=id}" data-price="{$price}" onclick="yaCounter49093180.reachGoal('buy');">Купить</a>
                            </div>
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

                        </div>
                    {else}

                    <div class="row">

                        <div class="col s6 pull-s6 m8 offset-m2 pull-m2 valign-wrapper">
                            {$price = {tv name=price_discount}|default:{tv name=price}}
                            <a href="#modal-calculation" class="computation button-action modal-trigger" onclick="yaCounter49093180.reachGoal('buy');">Заказать расчет</a>
                        </div>
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

                    </div>
                    {/if}
                </div>
            </div>

        </div>

        {if !in_array({field name=template}, [37, 41])}

            {include file="components/product/inner.default.tpl"}

            {else}

            {include file="components/product/inner.brief.tpl"}

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