{assign var=content value={field name=content}}
{assign var=fasadeList value={tv name=fasade}|json_decode:true}
{assign var=doorsList value={tv name=doors}|json_decode:true}
{assign var=colorsList value={tv name=colors}|json_decode:true}
{assign var=equipList value={tv name=equip}|json_decode:true}
{assign var=equipBoardList value={tv name=equipBoard}|json_decode:true}
{assign var=checkequip value={tv name=checkequip}}

{if $content || $fasadeList || $colorsList || $equipList || $doorsList || $equipBoardList}
    <div class="row product-tabs">
        <div class="col s12">
            <ul id="product-overview" class="tabs">
                {if $content}
                    <li class="tab col s12 m3"><a href="#tab-content">Описание</a></li>
                {/if}
                {if $fasadeList}
                    <li class="tab col s12 s3"><a href="#tab-fasade">Варианты фасадов</a></li>
                {/if}
                {if $doorsList}
                    <li class="tab col s12 s3"><a href="#tab-doors">Модели дверей</a></li>
                {/if}
                {if $colorsList}
                    <li class="tab col s12 s3"><a href="#tab-colors">Цветовые решения</a></li>
                {/if}
                {if $equipList}
                    <li class="tab col s12 s3"><a href="#tab-options">Комплектация и цены</a></li>
                {/if}
                {if !$checkequip && $equipBoardList}
                    <li class="tab col s12 s3"><a href="#tab-options-board">Комплектация и цены</a></li>
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
        {if $doorsList}
            <div id="tab-doors" class="tab__item col s12">
                <div class="row row--grid">
                    {foreach $doorsList as $data}
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

        {if !$checkequip && $equipBoardList}
            <div id="tab-options-board" class="tab__item col s12">
                <div class="product-equip">
                    <div class="product-equip__header">
                        <div class="row">
                            <div class="col hide-on-small-and-down m4 product-equip__title">Вид шкафа</div>
                            <div class="col hide-on-small-and-down m3 product-equip__title">Комплектация</div>
                            <div class="col hide-on-small-and-down m3 product-equip__title">Описание</div>
                            <div class="col hide-on-small-and-down m2 product-equip__title">Цена</div>
                        </div>
                    </div>
                    <ul class="product-equip__list">
                        {foreach $equipBoardList as $data}
                            <li class="product-equip__item">
                                <div class="row">
                                    <div class="col s12 m4">
                                        <div class="product-equip__title hide-on-med-and-up">Вид шкафа</div>
                                        <img src="{$data.viewImage}" class="materialboxed responsive-img" width="200">
                                    </div>
                                    <div class="col s12 m3">
                                        <div class="product-equip__title hide-on-med-and-up">Комплектация</div>
                                        <img src="{$data.configImage}" class="materialboxed responsive-img" width="200">
                                    </div>
                                    <div class="col s12 m3">
                                        <div class="product-equip__title hide-on-med-and-up">Описание</div>
                                        {$data.description}
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