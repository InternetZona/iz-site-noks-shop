{assign var=params value=[
'parent'    => 38
,'dir'      => 'DESC'
,'sort'     => 'publishedon'
,'limit'    => 0
,'cache'    => true
]}
{processor action="site/web/resources/getdata" params=$params ns="modxsite" assign=result}

{if $result.success && $result.count >= 4}
    <div class="block-blog">
        <div class="section__title">
            Акции
        </div>

        <div class="section__content">
            <div id="swiper-event" class="swiper-container swiper-content">
                <div class="swiper-wrapper">
                    {foreach $result.object as $object}
                        <div class="swiper-slide">
                            {include file="components/blog/item.tpl" object=$object}
                        </div>
                    {/foreach}
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>

        <div class="center-align">
            <a href="{$modx->makeUrl('38')}" class="button-action" style="width: auto;">Все акции</a>
        </div>
    </div>
{/if}
