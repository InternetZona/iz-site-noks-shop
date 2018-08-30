<div class="row row--grid">

    <div class="col l3">
        <a  class="brand-list__title" href="{$object.uri}">{$object.pagetitle}</a>
    </div>
    <div class="col l3">
        {snippet name="pThumb" params=[
            "input" => $object.tvs.image.value
            ,"options" => "&w=165&h=95&zc=0&aoe=0&far=0&q=80"
        ] assign=thumbImage}
        <a href="{$object.uri}">
            <img class="brand-list__image" src="{$thumbImage}">
        </a>
    </div>
    <div class="col l6">
        <p class="brand-list__desc">{$object.introtext}</p>
    </div>

</div>