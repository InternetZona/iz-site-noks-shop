
{$tvData = {tv name=freePackage}|json_decode:true}

{if $tvData && is_array($tvData)}
    <div class="section block-free">
        <div class="section__title">
            Бесплатный сервис пакет
        </div>
        <div class="section_content">
            <div class="row row--grid">

                {foreach $tvData as $data}
                    <div class="col s12 l3">
                        <div class="card horizontal box-free">
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
