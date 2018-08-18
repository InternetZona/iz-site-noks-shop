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

            <div class="dd-panel__title center-align">{$rotatorTitle|default:"Нокс рекомендует"}</div>

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
                    <a href="{$object.uri}" class="card-title">
                        {$item.title|default:$object.pagetitle}
                    </a>
                </div>
            </div>

        {/if}

    {/if}


{/if}