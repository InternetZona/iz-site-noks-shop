<div class="card box-testimonials box-testimonials--video">
    <a href="#modal-testimonial-video" class="modal-trigger" data-testimonial-video="{$data.hash}">
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
                <p>{$data.product}<br>
                    <span class="rate">
                            {for $i=1 to 5}
                                {if $i > $data.rate}
                                    <i class="far fa-star"></i>
                                    {else}
                                    <i class="fas fa-star"></i>
                                {/if}
                            {/for}
                        </span>
                </p>
            </li>
        </ul>
    </div>
</div>