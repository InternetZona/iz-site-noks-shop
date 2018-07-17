{$params = [
    'parent'    => 38
    ,'sort'     => 'publishedon'
    ,'dir'      => 'DESC'
    ,'limit'    => 0
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}
    <div class="section">
        <div id="swiper-banner" class="swiper-container swiper-content">
            <div class="swiper-wrapper">
                {foreach $result.object as $object}
                    <div class="swiper-slide center-align">
                        {snippet name="pThumb" params=[
                            "input" => $object.tvs.banner_l.value
                            ,"options" => "&w=1140&h=336&zc=1&aoe=0&far=0&q=80"
                        ] assign=thumbImage}

                        <a href="{$object.uri}">
                            <img src="{$thumbImage}" class="responsive-img hide-on-small-and-down">
                        </a>

                        <a href="{$object.uri}">
                            <img src="{$object.tvs.banner_s.value}" class="responsive-img hide-on-med-and-up">
                        </a>
                    </div>
                {/foreach}
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
{/if}