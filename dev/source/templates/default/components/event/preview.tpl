{if $menuPage = $modx->getObject('modResource', $id)}

    {$params = [
        'where'    => [
            'id'    => $menuPage->getTVValue('eventId')|default:0
        ]
        ,'current'  => true
    ]}

    {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

    {if $result.success && $result.count > 0}

        {$object = $result.object}

        <div class="card box-sale-preview">
            <div class="card-image">
                {snippet name="pThumb" params=[
                "input" => $object.tvs.image.value
                ,"options" => "&w=480&h=320&zc=1&aoe=0&far=0&q=70"
                ] assign=thumbImage}
                <a href="{$object.uri}" style="padding: 0">
                    <img src="{$thumbImage}">
                </a>
            </div>
        </div>

    {/if}

{/if}