<div class="container">
    <nav class="z-depth-0 nav">
        <div class="nav-wrapper">
            {if {field name=id} == {config name=site_start}}
                <span class="brand-logo hide-on-large-only">Мебель на заказ</span>
            {else}
                <a href="{$modx->makeUrl({config name=site_start})}" class="brand-logo hide-on-med-and-up">Мебель на заказ</a>
            {/if}
            <a href="#" data-target="mobile-menu" class="sidenav-trigger hide-on-large-only">
                <i class="fas fa-bars"></i>
            </a>
            {include file="components/menu/main.tpl"}
        </div>
    </nav>

</div>