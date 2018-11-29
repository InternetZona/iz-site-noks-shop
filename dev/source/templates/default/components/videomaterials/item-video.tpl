<div class="card box-testimonials box-testimonials--video">
    <a href="#modal-testimonial-video" class="modal-trigger" data-testimonial-video="{$data.video}">
        <div class="card-image">
            {snippet name="pThumb" params=[
            "input" => $data.preview
            ,"options" => "&w=360&h=225&zc=1&aoe=0&far=0&q=80"
            ] assign=thumbImage}

            <img src="{$thumbImage}">
        </div>
    </a>
    <div class="card-content">
        <ul class="collection">
            <li class="collection-item avatar left-align">
                <span class="title">{$data.name}</span>
            </li>
        </ul>
    </div>
</div>