{extends file="basepage.tpl"}

{block name=page_content}

    {$tvData = {tv name=videomaterials}|json_decode:true}

        <div class="row">

            {assign var=testimonialsList value=[]}

            {foreach $tvData as $data}

                <div class="col s12 m4 l3 center-align">
                        {include file="components/videomaterials/item-video.tpl" data=$data}
                </div>

            {/foreach}

            <script>
                var testimonialsList = {$testimonialsList|json_encode};
            </script>

        </div>

{/block}

{block name=modals append}
    {include file="components/modals/testimonials.tpl"}
{/block}