{assign var=params value=[
'id' => 937
,'current'    => true
,'cache'    => true
]}

{processor action="site/web/resources/getdata" params=$params ns="modxsite" assign=result}

{if $result.success && $result.count > 0}
    <div class="section block-videomaterials">
        <div class="section__title">
            Видео
        </div>
        <div class="section__content">

 {$tvData = $result.object.tvs.videomaterials.value|json_decode:true}

                <div id="swiper-related" class="swiper-container swiper-content">
                    <div class="swiper-wrapper">

                        {foreach $tvData as $data}

                            {if $data.video}

                                <div class="swiper-slide center-align">
                                        {include file="components/videomaterials/item-video.tpl" data=$data}
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
                    <a href="{$modx->makeUrl(937)}" class="button-action" style="width: auto;">Все видео</a>
                </div>
        </div>
    </div>
{/if}