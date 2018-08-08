{assign var=params value=[
'id' => 18
,'current'    => true
,'cache'    => true
]}

{processor action="site/web/resources/getdata" params=$params ns="modxsite" assign=result}

{if $result.success && $result.count > 0}
    <div class="section block-testimonials">
        <div class="section__title">
            Отзывы клиентов
        </div>
        <div class="section__content">

            {$testimonials = $result.object.tvs.testimonials.value|json_decode:true}

            {if $testimonials && is_array($testimonials)}

                <div id="swiper-testimonials" class="swiper-container swiper-content">
                    <div class="swiper-wrapper">

                        {assign var=testimonialsList value=[]}

                        {foreach $testimonials as $data}

                            {if $data.published}

                                <div class="swiper-slide center-align">
                                    {if $data.hash}

                                        {include file="components/testimonials/item-video.tpl" data=$data}

                                    {else}

                                        {$testimonialsList[$data.MIGX_id] = $data}

                                        {include file="components/testimonials/item-text.tpl" data=$data}

                                    {/if}
                                </div>

                            {/if}

                        {/foreach}

                        <script>
                          var testimonialsList = {$testimonialsList|json_encode};
                        </script>

                    </div>

                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
                <div class="center-align">
                    <a href="{$modx->makeUrl(18)}" class="button-action" style="width: auto;">Все отзывы</a>
                </div>
            {/if}
        </div>
    </div>
{/if}