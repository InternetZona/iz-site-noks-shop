<div class="card horizontal box-sale-preview">
    <div class="card-image">
        {snippet name="pThumb" params=[
        "input" => $object.tvs.image.value
        ,"options" => "&w=480&h=320&zc=1&aoe=0&far=0&q=70"
        ] assign=thumbImage}
        <a href="{$object.uri}">
            <img src="{$thumbImage}">
        </a>
    </div>
    <div class="card-stacked">
        <div class="card-content">
            <div class="card-title">
                <a href="{$object.uri}">{$object.pagetitle}</a>
            </div>
            <p class="hide-on-small-and-down">{$object.tvs.text.value}</p>
                <div class="center-align"><a href="{$object.content}" class="button-action width_auto">Смотреть коллекцию</a></div>
        </div>
    </div>
</div>