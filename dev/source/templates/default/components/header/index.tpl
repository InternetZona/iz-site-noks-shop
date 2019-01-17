<header class="header">
    <div class="header__bar">
        <div class="container">
            <div class="row">
                <div class="col s4 hide-on-med-and-up">

                    {include file="components/logo/index.tpl" image="noks-logo-s.svg"}

                </div>
                <div class="col s8 m12">
                    <a href="tel:84951085696" class="header__phone hide-on-med-and-up">8 (495) 108-56-96</a>

                    {include file="components/menu/topbar.tpl"}

                    <ul class="bar right">
                        <li class="bar__item favorite">

                            {$favorite = $smarty.cookies.favorite|json_decode:true}

                            {if count($favorite)}
                                <a href="{$modx->makeUrl(84)}" class="favorite__link">
                                    <span class="favorite__text">Избранное</span>
                                    <span class="favorite__counter">({$favorite|count})</span>
                                </a>
                            {else}
                                <a href="{$modx->makeUrl(84)}" class="favorite__link favorite--empty">
                                    <span class="favorite__text">Избранное</span>
                                    <span class="favorite__counter">(0)</span>
                                </a>
                            {/if}

                        </li>

                        {$basket = json_decode($smarty.cookies.basket, true)}

                        {if $basket}
                        <li class="bar__item quick-cart">
                            {else}
                        <li class="bar__item quick-cart quick-cart--empty">
                            {/if}

                            <a class='quick-cart__trigger' href='{$modx->makeUrl(83)}'>
                                <span class="quick-cart__trigger-text">Корзина</span>
                            </a>
                            <span class="quick-cart__counter">

                                {if $basket}

                                    <span class="quick-cart__counter-badge">{$basket|count}</span>

                                    {$cost = 0}

                                    {foreach $basket as $data}
                                    {$cost = $cost + $data.price}
                                {/foreach}

                                    <span class="quick-cart__counter-cost"><em>{$cost|number_format:0:',':' '}</em> руб</span>


                                {else}
                                    <span class="quick-cart__counter-badge">0</span>
                                    <span class="quick-cart__counter-cost"><em>0</em> руб</span>
                                {/if}
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="header__content hide-on-small-and-down">
        <div class="container">
            <div class="row row--grid">
                <div class="col l4 valign-wrapper">
                    {include file="components/logo/index.tpl" image="logo-big.png"}
                </div>
                <div class="col offset-m1 m3 l5 xl4 valign-wrapper">
                    <ul class="header__action">
                        <li class="header__action-item">
                            <a href="#modal-order-visit" class="button-action modal-trigger" onclick="yaCounter49093180.reachGoal('zamer');">
                                <i class="icon icon--ruler"></i>
                                Заказать замер</a>
                        </li>
                        <li class="header__action-item">
                            <a href="#modal-order-project" class="button-action modal-trigger" onclick="yaCounter49093180.reachGoal('proekt');">
                                <i class="icon icon--project"></i>
                                Заказать проект</a>
                        </li>
                    </ul>
                </div>
                <div class="col m3 xl2 right-align valign-wrapper">
                    <ul class="header__contacts">
                        <li class="header__contacts-time">
                            Пн.-Вс. 10:00-20:00
                        </li>
                        <li>
                            <a class="header__contacts-phone" href="tel:84952088802">8 (495) 208-88-02</a>
                        </li>
                        <li>
                            <a class="header__contacts-phone" href="tel:84951085696">8 (495) 108-56-96</a>
                        </li>
                    </ul>
                </div>
                <div class="col hide-on-med-and-down hide-on-large-only show-on-extra-large xl2 valign-wrapper right-align">
                    <ul class="header__link">
                        <li>
                            <a href="#modal-callback" class="header__link-item modal-trigger" onclick="yaCounter49093180.reachGoal('call');">Заказать звонок</a>
                        </li>
                        <li>
                            <a href="#modal-feedback" class="header__link-item modal-trigger" onclick="yaCounter49093180.reachGoal('soob');">Написать сообщение</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>