{$tvData = {tv name=images}|json_decode:true}

{if $tvData && is_array($tvData)}

    <div class="product-gallery">
        <div class="row">
            <div class="col s12 m12 push-l2 l10">
                <div class="swiper-container swiper-gallery gallery-images">
                    <div class="swiper-wrapper gallery-photoswipe">
                        {foreach $tvData as $data}

                            <figure class="swiper-slide gallery-photoswipe__item">

                                {*

                                {snippet name="pThumb" params=[
                                "input" => $data.image
                                ,"options" => "&w=1200&h=600&zc=0&aoe=0&far=0&q=70"
                                ] assign=thumbImage}

                                *}

                                {$size = getimagesize($modx->getOption('base_path')|cat:$data.image)}

                                {$width = $size[0]}
                                {$height = $size[1]}

                                {if $width > $height}

                                    {if $width > 1920}

                                        {$width = $size[0] / ($size[0] / 1920)}
                                        {$height = $size[1] / ($size[0] / 1920)}

                                    {/if}

                                {else}

                                    {if $height > 1080}

                                        {$width = $size[0] / ($size[1] / 1080)}
                                        {$height = $size[1] / ($size[1] / 1080)}

                                    {/if}

                                {/if}

                                {snippet name="pThumb" params=[
                                    "input" => $data.image
                                    ,"options" => "&w={$width}&h={$height}&zc=1&aoe=0&far=0&q=70"
                                ] assign=thumbImage}


                                <a href="{$thumbImage}" data-size="{$width}x{$height}">

                                    {snippet name="pThumb" params=[
                                    "input" => $data.image
                                    ,"options" => "&w=605&h=425&zc=1&aoe=0&far=0&q=70"
                                    ] assign=thumbImage}

                                    <img src="{$thumbImage}" class="responsive-img" alt="{field name=pagetitle} - {$data.MIGX_id}" />
                                </a>
                            </figure>
                        {/foreach}
                    </div>
                </div>
            </div>
            <div class="col s12 m12 pull-l10 l2">
                <div class="swiper-gallery-wrapper">
                    <div class="swiper-container swiper-gallery gallery-thumbs">
                        <div class="swiper-wrapper">
                            {foreach $tvData as $data}
                                <div class="swiper-slide">

                                    {snippet name="pThumb" params=[
                                    "input" => $data.image
                                    ,"options" => "&w=115&h=85&zc=1&aoe=0&far=0&q=70"
                                    ] assign=thumbImage}

                                    <img src="{$thumbImage}" class="responsive-img" alt="{field name=pagetitle} - {$data.MIGX_id}">
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
        </div>
    </div>

{/if}