<div class="card box-brand">
    <a href="{$object.uri}">
        <div class="card-image">
            {snippet name="pThumb" params=[
            "input" => $object.tvs.image.value
            ,"options" => "&w=165&h=95&zc=0&aoe=0&far=0&q=80"
            ] assign=thumbImage}
            <img src="{$thumbImage}">
        </div>
    </a>
</div>