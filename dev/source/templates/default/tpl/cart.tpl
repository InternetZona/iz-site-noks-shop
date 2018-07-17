{extends file="basepage.tpl"}

{block name=page_content}
    {$basket = $smarty.cookies.basket|json_decode:true}

    {if $basket && is_array($basket)}

        {assign var=relatedProducts value=[]}

        <div class="row">
            <div class="col s12 m6 l7 xl8">

                <ul class="cart">

                    <li class="cart__alert">
                        <div class="cart__alert-content">
                            Упс! Вы удалили все товары. :(
                        </div>
                    </li>

                    {$total = 0}

                    {foreach $basket as $row}

                        {if $product = $modx->getObject('modResource', $row.id)}

                            {if $tvRelatedProducts = $product->getTVValue('relatedProducts')}
                                {append var=relatedProducts value=$tvRelatedProducts}
                            {/if}

                            <li class="cart__item">
                                <div class="row row--grid">
                                    <div class="col s12 m3 xl2 valign-wrapper">

                                        <div class="cart__item-image">
                                            {if $images = $product->getTVValue('images')|json_decode:true}

                                                {snippet name="pThumb" params=[
                                                "input" => $images[0].image
                                                ,"options" => "&w=145&h=80&zc=1&aoe=0&far=0&q=80"
                                                ] assign=thumbImage}

                                                <img src="{$thumbImage}" class="responsive-img">

                                            {/if}
                                        </div>

                                    </div>
                                    <div class="col s12 m9 xl10 valign-wrapper">
                                        <div class="cart__item-summary">
                                            <div class="cart__item-title"><a href="{$product->uri}">{$product->pagetitle}</a></div>

                                            {$fullPrice = $product->getTVValue('price')|default:0}
                                            {$discountPrice = $product->getTVValue('price_discount')|default:0}

                                            {$price = ($discountPrice) ? $discountPrice : $fullPrice}

                                            {$total= $total + $price}
                                            <div class="cart__item-content">

                                                <div class="cart__item-control">
                                                    <a href="#" class="cart__item-remove" data-id="{$product->id}"><small>Удалить</small></a>
                                                </div>

                                                {if $discountPrice}
                                                    <div class="product--sale-info">

                                                        <div class="old-price">
                                                            <span class="product__cost">
                                                                {$fullPrice|number_format:0:'.':' '}
                                                            </span>
                                                            <span class="bonus-sum">экономия {($fullPrice - $discountPrice)|number_format:0:'.':' '}</span>
                                                        </div>

                                                        Стоимость: <span class="cart__item-price">{$discountPrice|number_format:0:',':' '}</span>

                                                    </div>
                                                {else}
                                                    Стоимость: <span class="cart__item-price">{$fullPrice|number_format:0:',':' '}</span>
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        {/if}

                    {/foreach}

                    <li class="cart__total">
                        Итого: <span class="cart__total-price">{$total|number_format:0:',':' '}</span>
                    </li>

                </ul>

            </div>
            <div class="col s12 m6 l5 xl4">
                <div class="form-wrapper">
                    {include file="components/form/order.tpl"}
                </div>
            </div>
        </div>

        {if $relatedProducts}
            {include file="blocks/product.related.tpl" tv=implode('||', $relatedProducts) title="К этим моделям подходят"}
        {/if}

        {else}

        <div class="cart-empty">
            <div class="cart-empty__title">В корзине нет товаров.</div>
        </div>

    {/if}

{/block}