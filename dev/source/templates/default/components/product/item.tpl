<div class="card box-product">
    <div class="card-image">

        {$tvImages = $object.tvs.images.value|json_decode:true}

        {snippet name="pThumb" params=[
            "input" => $tvImages[0].image
            ,"options" => "&w=360&h=225&zc=1&aoe=0&far=0&q=80"
        ] assign=thumbImage}

        <a href="{$object.uri}"><img src="{$thumbImage}"></a>

        {include file="components/product/panel.reveal.tpl" object=$object}

    </div>
    <div class="card-content">
        <a href="{$object.uri}" class="card-title">
            {$object.menutitle|default:$object.pagetitle}
        </a>
        <div class="row row--grid">
            <div class="col s12 m6 valign-wrapper">
                {if $discount = $object.tvs.price_discount.value}
                    <div class="product--sale-info">
                        <div class="old-price">
                            <span class="product__cost">
                                {$object.tvs.price.value|number_format:0:'.':' '}
                            </span>
                            <span class="bonus-sum">экономия {($object.tvs.price.value - $discount)|number_format:0:'.':' '}</span>
                        </div>
                        <span class="product__cost">
                            {$discount|number_format:0:'.':' '}
                        </span>
                    </div>
                    {else}
                    <span class="product__cost">
                        {$object.tvs.price.value|number_format:0:'.':' '}
                    </span>
                {/if}
            </div>

            <div class="col s6 push-s6 m2 valign-wrapper">
                <div class="product__bar">

                    {$favorite = $smarty.cookies.favorite|json_decode:true}
                    {if in_array($object.id, $favorite)}
                        <a href="#" class="product__bar-btn favorite-btn" data-id="{$object.id}"></a>
                    {else}
                        <a href="#" class="product__bar-btn favorite-btn favorite--empty" data-id="{$object.id}"></a>
                    {/if}
                </div>
            </div>
            <div class="col s6 pull-s6 m4 valign-wrapper">
                <a href="#" class="product__order-btn" data-id="{$object.id}" data-price="{$object.tvs.price_discount.value|default:$object.tvs.price.value}" onclick="yaCounter49093180.reachGoal('zakaz');">Заказать</a>
            </div>
        </div>
    </div>

    {assign var=_li value=""}

    {if $object.tvs.ishit.value}
        {$_li = $_li|cat:'<li><span class="badge badge--hit">лидер продаж</span></li>'}
    {/if}
    {if $object.tvs.issale.value}

        {$fullPrice = $object.tvs.price.value|default:0}
        {$discountPrice = $object.tvs.price_discount.value|default:0}

        {$discountPersent = 0}
        {if ($fullPrice > $discountPrice) && $discountPrice}
            {$discountPersent = 100 - (100 * $discountPrice) / $fullPrice}
        {/if}

        {if $discountPersent}
            {$_li = $_li|cat:'<li><span class="badge badge--discount">скидка '|cat:"-{$discountPersent|number_format:0:',':' '}%</span></li>"}

        {else}

            {$_li = $_li|cat:'<li><span class="badge badge--discount">скидка</span></li>'}
        {/if}
    {/if}
    {if $object.tvs.isnew.value}
        {$_li = $_li|cat:'<li><span class="badge badge--new">новинка</span></li>'}
    {/if}
    {if $object.tvs.istop.value}
        {$_li = $_li|cat:'<li><span class="badge badge--top">наш выбор</span></li>'}
    {/if}

    {if !empty($_li)}
        <ul class="product__badges-list">
            {$_li}
        </ul>
    {/if}
</div>