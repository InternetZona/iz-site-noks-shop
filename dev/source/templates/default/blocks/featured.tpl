
{$tvData = {tv name=features}|json_decode:true}

{if $tvData && is_array($tvData)}

    <div class="section block-featured">
        <div class="section__title">
            С нами удобно
        </div>
        <div class="section_content">
            <div class="row row--grid">

                {foreach $tvData as $data}
                    <div class="col s12 l3">
                        <div class="card horizontal box-featured">
                            <div class="card-image">
                                <img src="{$data.icon}">
                            </div>
                            <div class="card-stacked">
                                <div class="card-content">
                                    <p>{$data.title}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}
                
            </div>
        </div>
    </div>

{/if}
