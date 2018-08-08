{assign var=params value=[
    'parent'    => 12
    ,'dir'      => 'DESC'
    ,'sort'     => 'publishedon'
    ,'limit'    => 10
    ,'cache'    => true
]}
{processor action="site/web/resources/getdata" params=$params ns="modxsite" assign=result}

{if $result.success && $result.count > 0}
    <div class="section block-blog">
        <div class="section__title">
            Полезные советы
        </div>

        <div class="section__content">
            <div id="swiper-blog" class="swiper-container swiper-content">
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
            <div class="center-align">
                <a href="{$modx->makeUrl(12)}" class="button-action" style="width: auto;">Все полезные советы</a>
            </div>
        </div>
    </div>
{/if}
