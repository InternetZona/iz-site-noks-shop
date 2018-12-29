<div class="container">
    <div class="sitename">
        <div><a class="holiday hide-on-med-and-up" href="{$modx->makeUrl(941)}">Работа в праздники</a></div>
        {if {field name=id} == {config name=site_start}}
            <span class="brand-logo hide-on-med-and-up">ДЕЛАЕМ МЕБЕЛЬ - СОЗДАЕМ УЮТ</span>
        {else}
            <a href="{$modx->makeUrl({config name=site_start})}" class="brand-logo hide-on-med-and-up">ДЕЛАЕМ МЕБЕЛЬ - СОЗДАЕМ УЮТ</a>
        {/if}
    </div>
    <div class="clear"></div>
    <nav class="z-depth-0 nav">
        <div class="nav-wrapper">
            <a href="#" data-target="mobile-menu" class="sidenav-trigger hide-on-med-and-up on_mobile_pages">
                <i class="fas fa-bars"></i>
                <span class="hide-on-med-only hide-on-large-only">КАК КУПИТЬ</span>
            </a>
            {include file="components/menu/main.tpl"}
        </div>
    </nav>
    <nav class="z-depth-0 nav hiddenmenu">
        <div class="nav-wrapper">
            <a href="#" data-target="mobile-menu" class="sidenav-trigger hide-on-med-and-up on_mobile_catalog">
                <i class="fas fa-bars"></i>
                <span class="hide-on-med-only hide-on-large-only">КАТАЛОГ</span>
            </a>
        </div>
    </nav>
    <div class="clear"></div>
</div>