<div class="card box-item">
    <div class="card-image">

        {snippet name="pThumb" params=[
        "input" => $data.image
        ,"options" => "&w=125&h=185&zc=0&aoe=0&far=0&q=70"
        ] assign=thumbImage}

        <img src="{$thumbImage}" class="responsive-img">
    </div>
    <div class="card-content">
        <span class="card-title">
            {$data.title}
        </span>
    </div>
</div>