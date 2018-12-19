<div class="card box-testimonials box-testimonials--sertificats">
    <a target="_blank" href="{$data.sertificat}">
        <div class="card-image">
            {snippet name="pThumb" params=[
            "input" => $data.image
            ,"options" => "&w=260&h=260&zc=1&aoe=0&far=0&q=90"
            ] assign=thumbImage}

            <img src="{$thumbImage}">
        </div>
    </a>
    <div class="card-content">
        <ul class="collection">
            <li class="collection-item avatar left-align">
                <a target="_blank" href="{$data.sertificat}"><span class="title">{$data.name}</span></a>
            </li>
        </ul>
    </div>
</div>