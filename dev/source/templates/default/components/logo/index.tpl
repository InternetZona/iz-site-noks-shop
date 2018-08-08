{if $modx->resource->id == {config name=site_start}}

    <div class="header__logo">
        <span class="header__logo-brand">
            <img class="responsive-img" src="{$template_url}img/{$image}" alt="{config name=site_name}">
        </span>
        <span class="header__logo-text">Мебель на заказ<br>и не только...</span>
    </div>

{else}

    <div class="header__logo">
        <a href="{$modx->makeUrl({config name=site_start})}" class="header__logo-brand">
            <img class="responsive-img" src="{$template_url}img/{$image}" alt="{config name=site_name}">
        </a>
        <span class="header__logo-text">Мебель на заказ<br>и не только...</span>
    </div>
{/if}