{$params = [
    'id'    => $id
    ,'cached'    => true
    ,'current'  => true
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.object}

    {if $tvRotator = $result.object.tvs.itemRotation.value}

        {$rotator = $tvRotator|json_decode:true}

        {$item = $rotator[$rotator|@array_rand]}

        {$params = [
            'id'    => $item.itemId
            ,'cached'   => true
            ,'current'  => true
        ]}

        {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

        {if $result.success && $result.object}

            {$object = $result.object}

            <div class="dd-panel__title center-align">{$item.title}</div>

            <div class="card box-product product--preview">
                <div class="card-image">

                    {$tvImages = $object.tvs.images.value|json_decode:true}

                    {snippet name="pThumb" params=[
                    "input" => $tvImages[0].image
                    ,"options" => "&w=275&h=215&zc=1&aoe=0&far=0&q=80"
                    ] assign=thumbImage}

                    <a href="{$object.uri}"><img src="{$thumbImage}"></a>
                </div>
                <div class="card-content">
                    <div class="row" style="margin-left: 0; margin-right: 0;">
                        <div class="col s12">
                            <a href="{$object.uri}" class="card-title">
                                {$object.menutitle|default:$object.pagetitle}
                            </a>
                        </div>
                        <div class="col s12">
                            {if $discount = $object.tvs.price_discount.value}
                                <div class="product--sale-info" style="margin-top: 1.5rem;">
                                    <div class="old-price" style="right: 0;">
                                        <span class="product__cost">
                                            {$object.tvs.price.value|number_format:0:'.':' '}
                                        </span>
                                    </div>
                                    <span class="product__cost">
                                        {$discount|number_format:0:'.':' '}
                                    </span>
                                </div>
                            {else}
                                <span class="product__cost" style="margin-top: 1rem;">
                                    {$object.tvs.price.value|number_format:0:'.':' '}
                                </span>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>

        {/if}

    {/if}


{/if}