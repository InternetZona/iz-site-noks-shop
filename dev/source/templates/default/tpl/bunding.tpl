{extends file="basepage.tpl"}

{block name=page_content prepend}

    {if $tv_bunding = {field name=bunding}}

        {$bunding = $tv_bunding|json_decode:true}

        <div class="row row--grid">

            {foreach $bunding as $data}

                <div class="center-align col s12 m4 l3">

                    <div class="card box-item">
                        <div class="card-image">
                            <img src="{$data.image}" class="responsive-img materialboxed" />
                        </div>
                        <div class="card-content left-align">
                            <span class="card-title">{$data.title}</span>
                            <p>{$data.description}</p>
                        </div>
                    </div>

                </div>

            {/foreach}

        </div>

    {/if}

{/block}