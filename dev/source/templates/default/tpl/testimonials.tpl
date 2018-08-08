{extends file="basepage.tpl"}

{block name=page_content}

    {$tvData = {tv name=testimonials}|json_decode:true}

    {if $tvData && is_array($tvData)}

        {$tvData = $tvData|array_reverse}

        <div class="row">

            {assign var=testimonialsList value=[]}

            {foreach $tvData as $data}

                <div class="col s12 m4 l3 center-align">

                    {if $data.hash}

                        {include file="components/testimonials/item-video.tpl" data=$data}

                        {else}

                        {$testimonialsList[$data.MIGX_id] = $data}

                        {include file="components/testimonials/item-text.tpl" data=$data}

                    {/if}
                </div>

            {/foreach}

            <script>
                var testimonialsList = {$testimonialsList|json_encode};
            </script>

        </div>

    {/if}


{/block}

{block name=modals append}
    {include file="components/modals/testimonials.tpl"}
{/block}